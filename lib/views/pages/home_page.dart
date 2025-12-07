// / ============================================================================
// FILE 5: lib/views/pages/home_page.dart
// Copy this file into: lib/views/pages/home_page.dart
// ============================================================================

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
const HomePage({super.key});

@override
Widget build(BuildContext context) {
return SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// Welcome Section
Container(
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(
gradient: LinearGradient(
colors: [Colors.red.shade400, Colors.red.shade600],
begin: Alignment.topLeft,
end: Alignment.bottomRight,
),
borderRadius: BorderRadius.circular(20),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Welcome Back!',
style: TextStyle(
color: Colors.white,
fontSize: 24,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 8),
const Text(
'Explore our latest products and deals',
style: TextStyle(
color: Colors.white70,
fontSize: 14,
),
),
const SizedBox(height: 16),
ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.white,
foregroundColor: Colors.red,
padding: const EdgeInsets.symmetric(
horizontal: 24,
vertical: 12,
),
),
onPressed: () {},
child: const Text('Shop Now'),
),
],
),
),

const SizedBox(height: 24),

// Quick Actions
const Text(
'Quick Actions',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 16),
Row(
children: [
Expanded(
child: _buildActionCard(
context,
icon: Icons.sell,
title: 'Start Selling',
color: Colors.orange,
onTap: () {
print('Start Selling Tapped');
},
),
),
const SizedBox(width: 16),
Expanded(
child: _buildActionCard(
context,
icon: Icons.shopping_bag,
title: 'Buy Products',
color: Colors.blue,
onTap: () {
print('Buy Products Tapped');
},
),
),
],
),

const SizedBox(height: 24),

// Featured Products
const Text(
'Featured Products',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 16),
SizedBox(
height: 220,
child: ListView.builder(
scrollDirection: Axis.horizontal,
itemCount: 5,
itemBuilder: (context, index) {
return _buildProductCard(context, index);
},
),
),

const SizedBox(height: 24),

// Categories
const Text(
'Categories',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 16),
GridView.count(
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
crossAxisCount: 4,
mainAxisSpacing: 16,
crossAxisSpacing: 16,
children: [
_buildCategoryItem(Icons.phone_android, 'Electronics'),
_buildCategoryItem(Icons.checkroom, 'Fashion'),
_buildCategoryItem(Icons.home, 'Home'),
_buildCategoryItem(Icons.sports_soccer, 'Sports'),
_buildCategoryItem(Icons.book, 'Books'),
_buildCategoryItem(Icons.toys, 'Toys'),
_buildCategoryItem(Icons.restaurant, 'Food'),
_buildCategoryItem(Icons.more_horiz, 'More'),
],
),
],
),
),
);
}

Widget _buildActionCard(
BuildContext context, {
required IconData icon,
required String title,
required Color color,
required VoidCallback onTap,
}) {
return InkWell(
onTap: onTap,
child: Container(
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(
color: color.withOpacity(0.1),
borderRadius: BorderRadius.circular(16),
border: Border.all(color: color.withOpacity(0.3)),
),
child: Column(
children: [
Icon(icon, size: 40, color: color),
const SizedBox(height: 12),
Text(
title,
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 14,
fontWeight: FontWeight.w600,
color: color,
),
),
],
),
),
);
}

Widget _buildProductCard(BuildContext context, int index) {
return Container(
width: 150,
margin: const EdgeInsets.only(right: 16),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(16),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.05),
blurRadius: 10,
offset: const Offset(0, 4),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Container(
height: 120,
decoration: BoxDecoration(
color: Colors.grey.shade200,
borderRadius: const BorderRadius.vertical(
top: Radius.circular(16),
),
),
child: Center(
child: Icon(
Icons.image,
size: 50,
color: Colors.grey.shade400,
),
),
),
Padding(
padding: const EdgeInsets.all(12),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Product ${index + 1}',
style: const TextStyle(
fontWeight: FontWeight.w600,
fontSize: 14,
),
maxLines: 1,
overflow: TextOverflow.ellipsis,
),
const SizedBox(height: 4),
Text(
'\$${(index + 1) * 10}.99',
style: const TextStyle(
color: Colors.red,
fontWeight: FontWeight.bold,
fontSize: 16,
),
),
],
),
),
],
),
);
}

Widget _buildCategoryItem(IconData icon, String label) {
return Column(
children: [
Container(
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: Colors.grey.shade100,
borderRadius: BorderRadius.circular(12),
),
child: Icon(icon, size: 28, color: Colors.grey.shade700),
),
const SizedBox(height: 8),
Text(
label,
style: const TextStyle(fontSize: 12),
textAlign: TextAlign.center,
maxLines: 1,
overflow: TextOverflow.ellipsis,
),
],
);
}
}