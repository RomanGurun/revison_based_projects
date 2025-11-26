import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/group_model.dart';
import '../repositories/group_repository.dart';
import 'chat_page.dart';

final essentialGroupsProvider = FutureProvider<List<Group>>((ref) async {
  final repo = ref.watch(groupRepositoryProvider);
  final groups = await repo.fetchGroups();
  return groups.where((g) => g.category == 'Free').toList();
});

class EssentialTierPage extends ConsumerWidget {
  const EssentialTierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final essentialGroupsAsync = ref.watch(essentialGroupsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Essential Tier Groups')),
      body: essentialGroupsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (groups) {
          if (groups.isEmpty) return const Center(child: Text('No essential groups'));
          return ListView(
            padding: const EdgeInsets.all(16),
            children: groups.map((group) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(group.name),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      final repo = ref.watch(groupRepositoryProvider);
                      await repo.joinGroup(group);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Joined ${group.name}')),
                      );
                    },
                    child: const Text('Join'),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
