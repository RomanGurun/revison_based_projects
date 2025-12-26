// import 'package:flutter/material.dart';
// import 'package:totto/views/home_screen.dart';
//
// class OrderPage extends StatelessWidget {
//   const OrderPage({super.key});
//
//   @override
//   Widget build(BuiildContext) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("My Orders"),
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 1,
//           bottom: TabBar(
//             // labelColor:Colors.red,
//             // unselectedLabelColor:Colors.grey,
//             // indicatorColor:Colors.red,
//             labelColor: Colors.blue,
//             unselectedLabelColor: Colors.blueGrey,
//
//             // indicatorColor: Colors.red,
//         // isScrollable:true,
// labelPadding:EdgeInsets.zero,
// indicatorPadding:EdgeInsets.zero,
// isScrollable: true,
//             indicatorColor: Colors.transparent,
//             indicator:BoxDecoration(
//               color:Colors.grey.shade600,
//               borderRadius:BorderRadius.circular(8)
//             ),
//
//             tabs: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 decoration: BoxDecoration(
//                   // color: Colors.transparent, // ← Unselected background
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Tab(text: 'Pending'),
//               ),
//
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 decoration: BoxDecoration(
//                   // color: Colors.white,
//                   // ← Unselected background
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Tab(text: 'Delivered'),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 decoration: BoxDecoration(
//                   // color: Colors.grey.shade300, // ← Unselected background
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Tab(text: 'Shipped'),
//               ),
//
//
//
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             _buildOrderList('Pending'),
//             _buildOrderList('shipped'),
//             _buildOrderList('delivered'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOrderList(String status) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return Card(
//           margin: const EdgeInsets.only(bottom: 16),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Order #${100 + index} ",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         color: _getStatusColor(status).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//
//                       child: Text(
//                         status.toUpperCase(),
//                         style: TextStyle(
//                           color: _getStatusColor(status),
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//                 //================== height increase container size too ==========================
//                 Row(
//                   children: [
//                     Container(
//                       width: 60,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Icon(Icons.image, color: Colors.grey),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Product Name ${index + 1}',
//
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             'Oty :${index + 1}',
//                             style: TextStyle(
//                               color: Colors.grey.shade600,
//                               fontSize: 12,
//                             ),
//                           ),
//                           Text(
//                             '\$${(index + 1) * 25}.99 ',
//                             //================== Here actual mutlipliacationui logic is consists =====================
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//
//                           const SizedBox(height: 12),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Ordered : Dec ${index}, 2024',
//                                 style: TextStyle(
//                                   color: Colors.grey.shade600,
//                                   fontSize: 12,
//                                 ),
//                               ),
//
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (index) =>
//                                   const HomeScreen()));
//
//                                 },
//                                 child: const Text('ViewDetails'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// Color _getStatusColor(String status) {
//   switch (status) {
//     case 'pending':
//       return Colors.orange;
//     case 'shipped':
//       return Colors.blue;
//     case 'delivered':
//       return Colors.green;
//     default:
//       return Colors.grey;
//   }
// }









//////================new orders_page ==========================
import 'package:flutter/material.dart';
import 'package:totto/views/home_screen.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            // color: Colors.grey.shade200, // Background for entire tab area
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                _buildTab('Pending', 0),
                // const SizedBox(width: 8),
                _buildTab('Delivered', 1),
                // const SizedBox(width: 8),
                // _buildTab('Shipped', 2),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildOrderList('Pending'),
          _buildOrderList('delivered'),
          // _buildOrderList('shipped'),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.blueGrey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
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
                      "Order #${100 + index}",
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
                        borderRadius: BorderRadius.circular(12),
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
                const SizedBox(height: 15),
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Qty: ${index + 1}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '\$${(index + 1) * 25}.99',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ordered: Dec ${index}, 2024',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                },
                                child: const Text('View Details'),
                              ),
                            ],
                          ),
                        ],
                      ),
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
}

Color _getStatusColor(String status) {
  switch (status.toLowerCase()) {
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