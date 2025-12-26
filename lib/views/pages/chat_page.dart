import 'package:flutter/material.dart';
import 'package:totto/views/home_screen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  Colors.primaries[index % Colors.primaries.length],
              child: Text('U${index + 1}'),
              // ==============Colors.primaries contains 18 colors and it is a built in color code. ==================
            ),
            title: Text('User ${index + 1}'),
            subtitle: Text('Last Message Preview '),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,

              // =========MainAxisAlignment works as a Vertical and =====================
              // ==========CrossAxisAlignment works as a Horizontal =============
              children: [
                Text(
                  '10 : ${30 + index}AM',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                if (index % 3 == 0)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),

                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (index) => const HomeScreen()),
          );
        },
      ),
    );
  }
}
