import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Krutik Shiroya"),
            accountEmail: Text("krutik123@gmail.com"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1599834562135-b6fc90e642ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG1hbiUyMHdpdGglMjBiZWFyZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("account"),
            subtitle: const Text("personal"),
            trailing: const Icon(Icons.edit),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text("email"),
            subtitle: const Text("add@gmail.com"),
            trailing: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
