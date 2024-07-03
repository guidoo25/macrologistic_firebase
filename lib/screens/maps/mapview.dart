import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class SimpleExample extends StatefulWidget {
  SimpleExample({Key? key}) : super(key: key);

  @override
  _SimpleExampleState createState() => _SimpleExampleState();
}

class _SimpleExampleState extends State<SimpleExample> {
  late PageController controller;
  late int indexPage;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1);
    indexPage = controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return 
      Mapa();
  
  }
}

class Mapa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SimpleOSMState();
}

class SimpleOSMState extends State<Mapa>
    with AutomaticKeepAliveClientMixin {
  late MapController controller;
  GeoPoint? startPoint;
  GeoPoint? endPoint;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initMapWithUserPosition: UserTrackingOption(),
    );
    setMarker();
  }

  void setMarker() async {
    startPoint = await controller.myLocation();
    print (startPoint);
    
    endPoint = GeoPoint(latitude: 40.7128, longitude: -74.0060);

  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);
    return OSMFlutter( 
        controller:controller,
        osmOption: OSMOption(
              userTrackingOption: UserTrackingOption(
              enableTracking: true,
              unFollowUser: false,
            ),
            zoomOption: ZoomOption(
                  initZoom: 15,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
            ),
            markerOption: MarkerOption(
                  advancedPickerMarker: MarkerIcon(
                      icon: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 48,
                      ),
                  ),
                  defaultMarker: MarkerIcon(
                      icon: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 48,
                      ),
                  ),
            ),
            userLocationMarker: UserLocationMaker(

                personMarker: MarkerIcon(
                    icon: Icon(
                        Icons.location_history_rounded,
                        color: Colors.red,
                        size: 48,
                    ),
                ),
                directionArrowMarker: MarkerIcon(
                    icon: Icon(
                        Icons.double_arrow,
                        size: 48,
                    ),
                ),
            ),
            roadConfiguration: RoadOption(
                    roadColor: Colors.yellowAccent,
            ),



        )
    );
  }

  @override
  bool get wantKeepAlive => true;
}