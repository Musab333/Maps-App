import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    super.key,
    required this.selectedMapType,
    required this.onMapTypeChanged,
  });

  final MapType selectedMapType;
  final ValueChanged<MapType> onMapTypeChanged;

  void _selectMapType(BuildContext context, MapType mapType) {
    onMapTypeChanged(mapType);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.indigo]),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(""),
            ),
            accountName: const Text("Musab Mohamed"),
            accountEmail: const Text("musab@email.com"),
          ),

          // 📍 Home
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            subtitle: const Text("Set your home location"),
            onTap: () {},
          ),

          // // 💼 Work
          // ListTile(
          //   leading: const Icon(Icons.work_outline),
          //   title: const Text("Work"),
          //   subtitle: const Text("Set your work location"),
          //   onTap: () {},
          // ),
          const Divider(),

          // 🧭 Saved Places
          ListTile(
            leading: const Icon(Icons.bookmark_border),
            title: const Text("Saved Places"),
            onTap: () {},
          ),

          // 🗺️ Map Type
          ExpansionTile(
            leading: const Icon(Icons.map_outlined),
            title: const Text("Map Type"),
            children: [
              ListTile(
                leading: const Icon(Icons.map),
                title: const Text("Normal"),
                onTap: () {
                  _selectMapType(context, MapType.normal);
                },
                trailing: selectedMapType == MapType.normal
                    ? const Icon(Icons.check, color: Colors.teal)
                    : null,
              ),
              ListTile(
                leading: const Icon(Icons.satellite_alt),
                title: const Text("Satellite"),
                onTap: () {
                  _selectMapType(context, MapType.satellite);
                },
                trailing: selectedMapType == MapType.satellite
                    ? const Icon(Icons.check, color: Colors.teal)
                    : null,
              ),
              ListTile(
                leading: const Icon(Icons.terrain),
                title: const Text("Terrain"),
                onTap: () {
                  _selectMapType(context, MapType.terrain);
                },
                trailing: selectedMapType == MapType.terrain
                    ? const Icon(Icons.check, color: Colors.teal)
                    : null,
              ),
              ListTile(
                leading: const Icon(Icons.layers),
                title: const Text("Hybrid"),
                onTap: () {
                  _selectMapType(context, MapType.hybrid);
                },
                trailing: selectedMapType == MapType.hybrid
                    ? const Icon(Icons.check, color: Colors.teal)
                    : null,
              ),
            ],
          ),

          const Divider(),

          // // 🌙 Dark Mode
          // SwitchListTile(
          //   secondary: const Icon(Icons.dark_mode_outlined),
          //   title: const Text("Dark Mode"),
          //   value: false,
          //   onChanged: (value) {},
          // ),

          // ⚙️ Settings
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Settings"),
            onTap: () {},
          ),

          // // ℹ️ About
          // ListTile(
          //   leading: const Icon(Icons.info_outline),
          //   title: const Text("About"),
          //   onTap: () {},
          // ),
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
