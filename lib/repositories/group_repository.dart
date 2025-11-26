import 'dart:async';
import '../models/group_model.dart';

class GroupRepository {
  // Simulate fetching groups from API
  Future<List<Group>> fetchGroups() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network
    return [
      Group(id: '1', name: 'Flutter Devs', category: 'Free'),
      Group(id: '2', name: 'Premium Coders', category: 'Premium'),
      Group(id: '3', name: 'Standard Members', category: 'Standard'),
    ];
  }

  Future<void> joinGroup(Group group) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network
    print('Joined group: ${group.name}');
  }
}
