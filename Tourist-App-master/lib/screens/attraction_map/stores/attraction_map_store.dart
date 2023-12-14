import 'package:mobx/mobx.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tourist_app/models/attraction.dart';
import 'package:tourist_app/services/attraction_map_service.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
part 'attraction_map_store.g.dart';

class AttractionMapStore = _AttractionMapStoreBase with _$AttractionMapStore;

abstract class _AttractionMapStoreBase with Store {
  final panelController = PanelController();
  @observable
  List<MapObject> mapObjects = [];
  @observable
  List<Attraction> _listOfAttractions = [];
  String currentAttractionName = '';
  @observable
  String currentAttractionImageLink = '';
  @observable
  String currentAttractionDescription = '';
  @observable
  late Attraction _selectedAttraction;

  @action
  void init() {
    AttractionMapService().getAttraction().then((listOfAttractions) {
      _listOfAttractions = listOfAttractions;
      mapObjects = listOfAttractions
          .map(
            (attraction) => PlacemarkMapObject(
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                  image: BitmapDescriptor.fromAssetImage(
                    'assets/placemark_icon.png',
                  ),
                  rotationType: RotationType.noRotation,
                  scale: 1,
                ),
              ),
              mapId: MapObjectId(
                attraction.sightName!,
              ),
              point: Point(
                latitude: attraction.cords!.lat!,
                longitude: attraction.cords!.long!,
              ),
              onTap: (placemark, point) async {
                _selectedAttraction = _listOfAttractions.firstWhere((element) =>
                    MapObjectId(element.sightName!) == placemark.mapId);

                if (panelController.panelPosition > 0.4) {
                  await panelController.close();
                  setUpAllFields(_selectedAttraction);
                  await _openPanel();
                } else {
                  setUpAllFields(_selectedAttraction);
                  await _openPanel();
                }
              },
            ),
          )
          .toList();
    });
  }

  @action
  void setUpAllFields(Attraction selectedAttraction) {
    currentAttractionName = selectedAttraction.sightName!;
    currentAttractionImageLink = selectedAttraction.image!;
    currentAttractionDescription = selectedAttraction.description!;
  }

  @action
  Future<void> _openPanel() async {
    await panelController.animatePanelToPosition(0.6);
  }
}
