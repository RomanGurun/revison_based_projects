import 'package:flutter/material.dart';
import 'package:totto/views/home_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage'),
        backgroundColor: Colors.white70,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red.shade100,
                    child: Icon(Icons.person, size: 50, color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'John Doe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'johndeoes32@gmail.com,',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStateCard(
                      icon: Icons.shopping_bag,
                      label: 'Orders',
                      value: '24',
                      color: Colors.blue,
                    ),


                  ),

                  const SizedBox(width:16),
Expanded(
  child:_buildStateCard(icon: Icons.favorite, label: 'wishlist', value: '12', color: Colors.red),

),

const SizedBox(width:16),
                  Expanded(
                    child:_buildStateCard(icon: Icons.star, label: 'Reviews', value: '8', color: Colors.amber),

                  )


                ],
              ),
            ),
            const SizedBox(height:16),

            // menu items
            Container(
              color:Colors.white,
              child:Column(
                children: [
                  _buildMenuItem(
                    icon:Icons.shopping_bag_outlined,
                    title:'My Orders',
                    onTap:(){
Navigator.pushReplacement(context, MaterialPageRoute(
builder: (context) =>const HomeScreen()
),
);
                    }
,                    showDivider: false,

                  ),

            _buildMenuItem(icon: Icons.logout, title: 'logout', onTap: (){

            },
            iconColor:Colors.red,
              showDivider:true

            ),
                  _buildMenuItem(icon: Icons.help_outline, title: 'Help & support', onTap:(){

                  }),

_buildMenuItem(icon: Icons.info_outline, title: 'About', onTap: (){

},
showDivider: false,


)








                ],
              )
            )



          ],
        ),
      ),
    );
  }

  Widget _buildStateCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(4, 4),
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,

              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                  offset: Offset(2, 2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Icon(icon, size: 24),
          ),

          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ],
      ),
    );
  }

Widget _buildMenuItem({
    required IconData icon,
  required String title,
  required VoidCallback onTap,
   Color? iconColor,
   bool showDivider = true,
}){
    return Column(
      children:[
      ListTile(
        leading:Icon(icon,color:iconColor ?? Colors.black87 ),
        title:Text(title),
        trailing:const Icon(Icons.chevron_right,
        color:Colors.grey),
        onTap:onTap,

      ),
        if(showDivider)
          Divider(height:10,
          color:Colors.blue),





      ]
    );
}





}
