// FILE 7: lib/views/pages/orders_page.dart
// Copy this file into: lib/views/pages/orders_page.dart
// ============================================================================

import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
const OrdersPage({super.key});

@override
Widget build(BuildContext context) {
return DefaultTabController(
length: 3,
child: Scaffold(
appBar: AppBar(
title: const Text('My Orders'),
backgroundColor: Colors.white,
foregroundColor: Colors.black,
elevation: 1,
bottom: const TabBar(
labelColor: Colors.red,
unselectedLabelColor: Colors.grey,
indicatorColor: Colors.red,
tabs: [
Tab(text: 'Pending'),
Tab(text: 'Shipped'),
Tab(text: 'Delivered'),
],
),
),
body: TabBarView(
children: [
_buildOrderList('pending'),
_buildOrderList('shipped'),
_buildOrderList('delivered'),
],
),
),
);
}

Widget _buildOrderList(String status) {
return ListView.builder(
padding: const EdgeInsets.all(16),
itemCount: 5,
itemBuilder: (context, index) {
return Card(
margin: const EdgeInsets.only(bottom: 16),
child: Padding(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
'Order #${1000 + index}',
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16,
),
),
Container(
padding: const EdgeInsets.symmetric(
horizontal: 12,
vertical: 6,
),
decoration: BoxDecoration(
color: _getStatusColor(status).withOpacity(0.1),
borderRadius: BorderRadius.circular(20),
),
child: Text(
status.toUpperCase(),
style: TextStyle(
color: _getStatusColor(status),
fontSize: 12,
fontWeight: FontWeight.bold,
),
),
),
],
),
const SizedBox(height: 12),
Row(
children: [
Container(
width: 60,
height: 60,
decoration: BoxDecoration(
color: Colors.grey.shade200,
borderRadius: BorderRadius.circular(8),
),
child: const Icon(Icons.image, color: Colors.grey),
),
const SizedBox(width: 12),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Product Name ${index + 1}',
style: const TextStyle(fontWeight: FontWeight.w600),
),
const SizedBox(height: 4),
Text(
'Qty: ${index + 1}',
style: TextStyle(
color: Colors.grey.shade600,
fontSize: 14,
),
),
],
),
),
Text(
'\$${(index + 1) * 25}.99',
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16,
color: Colors.red,
),
),
],
),
const SizedBox(height: 12),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
'Ordered: Dec ${5 + index}, 2024',
style: TextStyle(
color: Colors.grey.shade600,
fontSize: 12,
),
),
TextButton(
onPressed: () {},
child: const Text('View Details'),
),
],
),
],
),
),
);
},
);
}

Color _getStatusColor(String status) {
switch (status) {
case 'pending':
return Colors.orange;
case 'shipped':
return Colors.blue;
case 'delivered':
return Colors.green;
default:
return Colors.grey;
}
}
}
