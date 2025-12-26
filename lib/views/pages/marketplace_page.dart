import 'package:flutter/material.dart';

class MarketPlacePage extends StatelessWidget {
  const MarketPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MarketPlace'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryChip('All', true),
                _buildCategoryChip('Electronic', false),
                _buildCategoryChip('Fashion', false),
                _buildCategoryChip('Home', false),
                _buildCategoryChip('Sports', false),
              ],
            ),
          ),
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
      floatingActionButton:FloatingActionButton.extended(
        backgroundColor:Colors.red,
        onPressed:(){},
        icon:const Icon(Icons.add,
        color: Colors.white70,)
      ,
      label:const Text('Add Product,'
          ,
      style: TextStyle(
        color:Colors.white70
      ),)


      )


    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (value) {},
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
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child:Column(
      children: [
        Expanded(
          flex:3,
          child:Container(
            decoration:BoxDecoration(
              color:Colors.grey.shade200,
              borderRadius:const BorderRadius.vertical(
                top: Radius.circular(12),
              )
            ),
 child:Stack(
              children:[
                Center(
                  child:Icon(Icons.image,
                    size:60,

                    color:Colors.grey.shade200
                  )
                )
              ]
          )




          )
        )
      ],
    )



    );
  }
}
