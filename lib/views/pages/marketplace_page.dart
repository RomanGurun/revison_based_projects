// import 'package:flutter/material.dart';
//
// class MarketPlacePage extends StatelessWidget {
//   const MarketPlacePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MarketPlace'),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 1,
//         actions: [
//           IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
//           IconButton(icon: Icon(Icons.search), onPressed: () {}),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 60,
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: [
//                 _buildCategoryChip('All', true),
//                 _buildCategoryChip('Electronic', false),
//                 _buildCategoryChip('Fashion', false),
//                 _buildCategoryChip('Home', false),
//                 _buildCategoryChip('Sports', false),
//               ],
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(16),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.75,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//               itemCount: 20,
//               itemBuilder: (context, index) {
//                 return _buildProductCard(context, index);
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton:FloatingActionButton.extended(
//         backgroundColor:Colors.red,
//         onPressed:(){},
//         icon:const Icon(Icons.add,
//         color: Colors.white70,)
//       ,
//       label:const Text('Add Product,'
//           ,
//       style: TextStyle(
//         color:Colors.white70
//       ),)
//
//
//       )
//
//
//     );
//   }
//
//   Widget _buildCategoryChip(String label, bool isSelected) {
//     return Container(
//       child: FilterChip(
//         label: Text(label),
//         selected: isSelected,
//         onSelected: (value) {},
//         checkmarkColor: Colors.red,
//         labelStyle: TextStyle(
//           color: isSelected ? Colors.red : Colors.black,
//           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProductCard(BuildContext context, int index) {
//     return Card(
//       elevation: 1,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     child:Column(
//       children: [
//         Expanded(
//           flex:3,
//           child:Container(
//             decoration:BoxDecoration(
//               color:Colors.grey.shade200,
//               borderRadius:const BorderRadius.vertical(
//                 top: Radius.circular(12),
//               )
//             ),
//  child:Stack(
//               children:[
//                 Center(
//                   child:Icon(Icons.image,
//                     size:60,
//
//                     color:Colors.grey.shade200
//                   )
//                 )
//               ]
//           )
//
//
//
//
//           )
//         )
//       ],
//     )
//
//
//
//     );
//   }
// }

// Copy this file into: lib/views/pages/marketplace_page.dart
// ============================================================================

import 'package:flutter/material.dart';

class MarketPlacePage extends StatelessWidget {
  const MarketPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Categories
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryChip('All', true),
                _buildCategoryChip('Electronics', false),
                _buildCategoryChip('Fashion', false),
                _buildCategoryChip('Home', false),
                _buildCategoryChip('Sports', false),
              ],
            ),
          ),

          // Products Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return _buildProductCard(context, index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red,
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add Product',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (value) {},
        selectedColor: Colors.red.withOpacity(0.2),
        checkmarkColor: Colors.red,
        labelStyle: TextStyle(
          color: isSelected ? Colors.red : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, int index) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.image,
                      size: 60,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Product Details
          Expanded(
            flex: 2,
            child: Padding(
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
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        '4.${5 + (index % 5)}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      const Spacer(),
                      Text(
                        '\$${(index + 1) * 15}.99',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}