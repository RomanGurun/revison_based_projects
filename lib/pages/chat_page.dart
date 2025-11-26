import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/group_model.dart';
import '../repositories/group_repository.dart';
import 'essential_tier_page.dart';

final groupRepositoryProvider = Provider((ref) => GroupRepository());

final groupsProvider = FutureProvider<List<Group>>((ref) async {
  final repo = ref.watch(groupRepositoryProvider);
  return repo.fetchGroups();
});

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupsAsync = ref.watch(groupsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Chat Groups')),
      body: groupsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (groups) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ...groups.map((group) => GroupTile(group: group)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EssentialTierPage()),
                ),
                child: const Text('Go to Essential Tier Page'),
              )
            ],
          );
        },
      ),
    );
  }
}

class GroupTile extends ConsumerWidget {
  final Group group;
  const GroupTile({required this.group, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(groupRepositoryProvider);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(group.name),
        subtitle: Text(group.category),
        trailing: ElevatedButton(
          onPressed: () async {
            await repo.joinGroup(group);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Joined ${group.name}')),
            );
          },
          child: const Text('Join'),
        ),
      ),
    );
  }
}
