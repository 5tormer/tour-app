import 'package:flutter/material.dart';
import 'package:tourist_app/screens/attraction_map/attraction_map_screen.dart';
import 'package:tourist_app/screens/main/stores/main_store.dart';
import 'package:tourist_app/screens/profle/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _mainStore = MainStore();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await _mainStore.signOut(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ],
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
          title: const Text('Tourist App'),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            MapScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
