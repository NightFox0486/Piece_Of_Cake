import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piece_of_cake/party/buy/buy_create.dart';

GlobalKey<_MapSettingState> mapKey = GlobalKey();
//
class MapSetting extends StatefulWidget {
  const MapSetting({Key? key}) : super(key: key);

  @override
  State<MapSetting> createState() => _MapSettingState();
}

class _MapSettingState extends State<MapSetting> {
  late GoogleMapController mapController;
  LatLng center = LatLng(35.08947, 128.85354);

  String Rdv_Address = '주소 적힐곳';

  List<Marker> _markers = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  addMaker(cordinate) {
    setState(() {
      _markers = [];
      _markers.add(Marker(position: cordinate, markerId: MarkerId('1')));
      center = _markers[0].position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map_Setting'),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.pop(context, center);
              },
              icon: Icon(Icons.done))
        ],
      ),
      body: GoogleMap(
        markers: Set.from(_markers),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 11.0,
        ),
        onTap: (cordinate) {
          mapController.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMaker(cordinate);
        },
      ),
    );
  }
}
