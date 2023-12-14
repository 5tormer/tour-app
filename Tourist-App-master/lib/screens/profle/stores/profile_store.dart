import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tourist_app/services/auth_service.dart';
import 'package:tourist_app/services/firebase_firestore_service.dart';
import 'package:tourist_app/services/firebase_storage_service.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  final _authService = AuthService();
  final _firebaseStorageService = FirebaseStorageService();
  final _firebaseFirestoreService = FirebaseFirestoreService();
  @observable
  String? description;
  @observable
  String? avatarLink;

  @action
  Future<void> init({required String userEmail}) async {
    await getDescriptionData(
        db: _firebaseFirestoreService, userEmail: userEmail);
    await getProfileImage(userEmail);
  }

  @action
  Future<void> getDescriptionData(
      {required FirebaseFirestoreService db, required String userEmail}) async {
    try {
      description = (await db.getDataFromCollection(
        userEmail: userEmail,
        collectionName: 'description',
        key: 'text',
      ))!
          .first;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> setDescriptionData({
    required FirebaseFirestoreService db,
    required String userEmail,
    required String text,
  }) async {
    await db.setDataForCollection(
      userEmail: userEmail,
      collectionName: 'description',
      text: text,
    );
  }

  @action
  Future<void> setProfileImage(String email) async {
    await _firebaseStorageService.setProfileImage(email);
  }

  @action
  Future<void> getProfileImage(String userEmail) async {
    avatarLink = await _firebaseStorageService.getProfileImage(userEmail);
  }

  @action
  Future<void> showMyDialog(
      BuildContext context, TextEditingController controller) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Редактировать описание'),
          content: TextFormField(
            controller: controller,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Изменить'),
              onPressed: () async {
                await setDescriptionData(
                  db: _firebaseFirestoreService,
                  userEmail: _authService.currentUser!.email!,
                  text: controller.text,
                );
                await getDescriptionData(
                  db: _firebaseFirestoreService,
                  userEmail: _authService.currentUser!.email!,
                );
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
