import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // User Account Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/img.png'), // Replace with your image
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Lekan Okeowo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'demo@gmail.com',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Drawer items
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.blue),
            title: Text('Dashboard'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
            title: Text('My Transaction'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.insert_chart, color: Colors.blue),
            title: Text('Statistics'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.wallet_giftcard, color: Colors.blue),
            title: Text('Wallet Account'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.trending_up, color: Colors.blue),
            title: Text('My Investments'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Setting System'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout Account'),
            onTap: () {},
          ),
        ],
      ),
    ) ;
  }
}
