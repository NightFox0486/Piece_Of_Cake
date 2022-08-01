import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> myMarker = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition:
          CameraPosition(target: LatLng(33.450701, 126.570667), zoom: 16),
        markers: Set.from(myMarker),
        onTap: _handleTap,
      ));
  }

  _handleTap(LatLng tappedPoint) async {
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
            markerId: MarkerId(tappedPoint.toString()),
            position: tappedPoint,
      ));
    });
    print(tappedPoint.latitude);
    print(tappedPoint.longitude);
    var lat = tappedPoint.latitude;
    var lon = tappedPoint.longitude;
    final Uri clickurl = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lon&key=AIzaSyBdf3QkB2KbMDzdfPXYxoBBfyFSk_fxBqk&language=ko');
    final response = await http.get(clickurl);
    print(jsonDecode(response.body)['results'][0]['formatted_address']);
  }
}
