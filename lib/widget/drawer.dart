import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text("Krutik Shiroya"),
            accountEmail: Text("krutik123@gmail.com"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1599834562135-b6fc90e642ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG1hbiUyMHdpdGglMjBiZWFyZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("account"),
            subtitle: Text("personal"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("email"),
            subtitle: Text("add@gmail.com"),
            trailing: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
