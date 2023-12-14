// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStoreBase, Store {
  late final _$descriptionAtom =
      Atom(name: '_ProfileStoreBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$avatarLinkAtom =
      Atom(name: '_ProfileStoreBase.avatarLink', context: context);

  @override
  String? get avatarLink {
    _$avatarLinkAtom.reportRead();
    return super.avatarLink;
  }

  @override
  set avatarLink(String? value) {
    _$avatarLinkAtom.reportWrite(value, super.avatarLink, () {
      super.avatarLink = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_ProfileStoreBase.init', context: context);

  @override
  Future<void> init({required String userEmail}) {
    return _$initAsyncAction.run(() => super.init(userEmail: userEmail));
  }

  late final _$getDescriptionDataAsyncAction =
      AsyncAction('_ProfileStoreBase.getDescriptionData', context: context);

  @override
  Future<void> getDescriptionData(
      {required FirebaseFirestoreService db, required String userEmail}) {
    return _$getDescriptionDataAsyncAction
        .run(() => super.getDescriptionData(db: db, userEmail: userEmail));
  }

  late final _$setDescriptionDataAsyncAction =
      AsyncAction('_ProfileStoreBase.setDescriptionData', context: context);

  @override
  Future<void> setDescriptionData(
      {required FirebaseFirestoreService db,
      required String userEmail,
      required String text}) {
    return _$setDescriptionDataAsyncAction.run(() =>
        super.setDescriptionData(db: db, userEmail: userEmail, text: text));
  }

  late final _$setProfileImageAsyncAction =
      AsyncAction('_ProfileStoreBase.setProfileImage', context: context);

  @override
  Future<void> setProfileImage(String email) {
    return _$setProfileImageAsyncAction.run(() => super.setProfileImage(email));
  }

  late final _$getProfileImageAsyncAction =
      AsyncAction('_ProfileStoreBase.getProfileImage', context: context);

  @override
  Future<void> getProfileImage(String userEmail) {
    return _$getProfileImageAsyncAction
        .run(() => super.getProfileImage(userEmail));
  }

  late final _$showMyDialogAsyncAction =
      AsyncAction('_ProfileStoreBase.showMyDialog', context: context);

  @override
  Future<void> showMyDialog(
      BuildContext context, TextEditingController controller) {
    return _$showMyDialogAsyncAction
        .run(() => super.showMyDialog(context, controller));
  }

  @override
  String toString() {
    return '''
description: ${description},
avatarLink: ${avatarLink}
    ''';
  }
}
