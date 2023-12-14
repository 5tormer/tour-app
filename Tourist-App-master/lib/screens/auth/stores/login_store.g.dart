// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$visibilityAtom =
      Atom(name: '_LoginStoreBase.visibility', context: context);

  @override
  bool get visibility {
    _$visibilityAtom.reportRead();
    return super.visibility;
  }

  @override
  set visibility(bool value) {
    _$visibilityAtom.reportWrite(value, super.visibility, () {
      super.visibility = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginStoreBase.login', context: context);

  @override
  Future<void> login(BuildContext context, String email, String password) {
    return _$loginAsyncAction.run(() => super.login(context, email, password));
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  void toggleVisibility() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.toggleVisibility');
    try {
      return super.toggleVisibility();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visibility: ${visibility}
    ''';
  }
}
