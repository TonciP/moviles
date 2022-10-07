import 'package:airbnb/model/responseSearch/responseSearch.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  List<Datum> lugares;
  Home({required this.lugares}) : super();
  @override
  // ignore: no_logic_in_create_state
  _HomeState createState() => _HomeState(lugares: lugares);
}

class _HomeState extends State<Home> {
  List<Datum> lugares;
  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers = new Set(); //markers for google map

  _HomeState({required this.lugares}) : super();

  static const LatLng showLocation =
      const LatLng(-17.7574439, -63.2918294); //location to show in map
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple Markers in Google Map"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: LatLng(double.parse(lugares[0].latitud),
              double.parse(lugares[0].longitud)), //initial position
          zoom: 15.0, //initial zoom level
        ),
        markers: getmarkers(), //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      for (var lugar in lugares) {
        if (lugar.latitud != "latitud" && lugar.longitud != "longitud") {
          markers.add(Marker(
            markerId: MarkerId(lugar.id.toString()),
            position: LatLng(
                double.parse(lugar.latitud), double.parse(lugar.longitud)),
            infoWindow: InfoWindow(
              title: lugar.nombre,
              snippet: lugar.descripcion,
            ),
          ));
        }
        /* markers.add(Marker(
          markerId: MarkerId(lugar.id.toString()),
          position:
              LatLng(double.parse(lugar.latitud), double.parse(lugar.longitud)),
          infoWindow: InfoWindow(
            title: lugar.nombre,
            snippet: lugar.descripcion,
          ),
        )); */
      }
      /* markers.add(Marker(
        //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(27.7099116, 85.3132343), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(27.7137735, 85.315626), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title Third ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      )); */

      //add more markers here
    });

    return markers;
  }
}
