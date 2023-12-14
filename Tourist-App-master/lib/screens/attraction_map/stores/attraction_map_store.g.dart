// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attraction_map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AttractionMapStore on _AttractionMapStoreBase, Store {
  late final _$mapObjectsAtom =
      Atom(name: '_AttractionMapStoreBase.mapObjects', context: context);

  @override
  List<MapObject<dynamic>> get mapObjects {
    _$mapObjectsAtom.reportRead();
    return super.mapObjects;
  }

  @override
  set mapObjects(List<MapObject<dynamic>> value) {
    _$mapObjectsAtom.reportWrite(value, super.mapObjects, () {
      super.mapObjects = value;
    });
  }

  late final _$_listOfAttractionsAtom = Atom(
      name: '_AttractionMapStoreBase._listOfAttractions', context: context);

  @override
  List<Attraction> get _listOfAttractions {
    _$_listOfAttractionsAtom.reportRead();
    return super._listOfAttractions;
  }

  @override
  set _listOfAttractions(List<Attraction> value) {
    _$_listOfAttractionsAtom.reportWrite(value, super._listOfAttractions, () {
      super._listOfAttractions = value;
    });
  }

  late final _$currentAttractionImageLinkAtom = Atom(
      name: '_AttractionMapStoreBase.currentAttractionImageLink',
      context: context);

  @override
  String get currentAttractionImageLink {
    _$currentAttractionImageLinkAtom.reportRead();
    return super.currentAttractionImageLink;
  }

  @override
  set currentAttractionImageLink(String value) {
    _$currentAttractionImageLinkAtom
        .reportWrite(value, super.currentAttractionImageLink, () {
      super.currentAttractionImageLink = value;
    });
  }

  late final _$currentAttractionDescriptionAtom = Atom(
      name: '_AttractionMapStoreBase.currentAttractionDescription',
      context: context);

  @override
  String get currentAttractionDescription {
    _$currentAttractionDescriptionAtom.reportRead();
    return super.currentAttractionDescription;
  }

  @override
  set currentAttractionDescription(String value) {
    _$currentAttractionDescriptionAtom
        .reportWrite(value, super.currentAttractionDescription, () {
      super.currentAttractionDescription = value;
    });
  }

  late final _$_selectedAttractionAtom = Atom(
      name: '_AttractionMapStoreBase._selectedAttraction', context: context);

  @override
  Attraction get _selectedAttraction {
    _$_selectedAttractionAtom.reportRead();
    return super._selectedAttraction;
  }

  @override
  set _selectedAttraction(Attraction value) {
    _$_selectedAttractionAtom.reportWrite(value, super._selectedAttraction, () {
      super._selectedAttraction = value;
    });
  }

  late final _$_openPanelAsyncAction =
      AsyncAction('_AttractionMapStoreBase._openPanel', context: context);

  @override
  Future<void> _openPanel() {
    return _$_openPanelAsyncAction.run(() => super._openPanel());
  }

  late final _$_AttractionMapStoreBaseActionController =
      ActionController(name: '_AttractionMapStoreBase', context: context);

  @override
  void init() {
    final _$actionInfo = _$_AttractionMapStoreBaseActionController.startAction(
        name: '_AttractionMapStoreBase.init');
    try {
      return super.init();
    } finally {
      _$_AttractionMapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUpAllFields(Attraction selectedAttraction) {
    final _$actionInfo = _$_AttractionMapStoreBaseActionController.startAction(
        name: '_AttractionMapStoreBase.setUpAllFields');
    try {
      return super.setUpAllFields(selectedAttraction);
    } finally {
      _$_AttractionMapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mapObjects: ${mapObjects},
currentAttractionImageLink: ${currentAttractionImageLink},
currentAttractionDescription: ${currentAttractionDescription}
    ''';
  }
}
