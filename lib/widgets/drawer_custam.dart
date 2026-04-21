import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // 🔷 Header احترافي
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.indigo]),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            accountName: const Text("Musab AlMohamed"),
            accountEmail: const Text("musab@email.com"),
          ),

          // 📍 Home
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            subtitle: const Text("Set your home location"),
            onTap: () {},
          ),

          // 💼 Work
          ListTile(
            leading: const Icon(Icons.work_outline),
            title: const Text("Work"),
            subtitle: const Text("Set your work location"),
            onTap: () {},
          ),

          const Divider(),

          // 🧭 Saved Places
          ListTile(
            leading: const Icon(Icons.bookmark_border),
            title: const Text("Saved Places"),
            onTap: () {},
          ),

          // 🗺️ Map Type
          ListTile(
            leading: const Icon(Icons.map_outlined),
            title: const Text("Map Type"),
            onTap: () {},
          ),

          const Divider(),

          // 🌙 Dark Mode
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text("Dark Mode"),
            value: false,
            onChanged: (value) {},
          ),

          // ⚙️ Settings
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Settings"),
            onTap: () {},
          ),

          // ℹ️ About
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),
            onTap: () {},
          ),

          const Spacer(),

          // 🔚 Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
