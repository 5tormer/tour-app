import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tourist_app/screens/attraction_map/stores/attraction_map_store.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late YandexMapController yandexMapController;
  final _attractionMapStore = AttractionMapStore();

  @override
  void initState() {
    _attractionMapStore.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) => SlidingUpPanel(
          maxHeight: 600,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          controller: _attractionMapStore.panelController,
          minHeight: 0,
          panel: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _attractionMapStore.currentAttractionName,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              Image.network(
                _attractionMapStore.currentAttractionImageLink,
                errorBuilder: ((_, __, ___) => const SizedBox.shrink()),
                loadingBuilder: ((_, child, progress) {
                  if (progress == null) return child;
                  return const CircularProgressIndicator();
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  _attractionMapStore.currentAttractionDescription,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          body: YandexMap(
            mapObjects: _attractionMapStore.mapObjects,
            onMapCreated: (controller) async {
              yandexMapController = controller;
            },
          ),
        ),
      ),
    );
  }
}
