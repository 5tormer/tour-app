import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_app/screens/profle/stores/profile_store.dart';
import 'package:tourist_app/services/auth_service.dart';
import 'package:tourist_app/theme/stores/theme_store.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeStore themeStore;
  final _authService = AuthService();
  final controller = TextEditingController();
  String? description;
  String? avatarLink;

  final _profileStore = ProfileStore();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200)).then((value) =>
        _profileStore.init(userEmail: _authService.currentUser!.email!));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    themeStore = context.read<ThemeStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: themeStore.toggleTheme,
        child: themeStore.isDark
            ? const Icon(Icons.brightness_high)
            : const Icon(Icons.brightness_2),
      ),
      body: Consumer<User?>(
        builder: (_, user, ___) {
          return user == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      avatarLink == null
                          ? GestureDetector(
                              onTap: () async {
                                await _profileStore
                                    .setProfileImage(user.email!);
                                await _profileStore
                                    .getProfileImage(user.email!);
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Center(
                                  child: Text(
                                    user.email!.split('@')[0].substring(0, 1) +
                                        ' ' +
                                        user.email!
                                            .split('@')[1]
                                            .substring(0, 1),
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                await _profileStore
                                    .setProfileImage(user.email!);
                                await _profileStore
                                    .getProfileImage(user.email!);
                              },
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: NetworkImage(
                                  avatarLink!,
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                      Text(user.email!, style: const TextStyle(fontSize: 20)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'О себе',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _profileStore.showMyDialog(context, controller);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              description ?? 'Добавьте описание',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
