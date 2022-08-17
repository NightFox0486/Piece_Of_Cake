import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng _initialPosition;
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    _getUserLocation().whenComplete(() {
      isloading = false;
    });
  }

  _getUserLocation() async {
    if (await Permission.location.request().isGranted) {
      print('허락됨');
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("위치 제공 권한 거부를 누르셨습니다"),
              content: new Text("사용하시려면 설정에서 위치 제공 권한을 허용하여 주십시오"),
              actions: <Widget>[
                FloatingActionButton.extended(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  label: Text('닫기'),
                )
              ],
            );
          });
    }
    var position = await GeolocatorPlatform.instance.getCurrentPosition(
        locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.bestForNavigation));

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
    return _initialPosition;
  }

  Completer<GoogleMapController> _controller = Completer();
  List<Marker> myMarker = [];
  var address = '지도를 클릭하시면 선택하신 장소의 주소가 나타납니다';
  var selectaddress = '상대분과 만나기를 원하시는 장소를 클릭하여 주시면 됩니다';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      isloading
          ? loading()
          :
          // CircularProgressIndicator(
          //   semanticsLabel: 'Linear progress indicator',
          // ) :
          GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      _initialPosition.latitude, _initialPosition.longitude),
                  zoom: 16),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set.from(myMarker),
              onTap: _handleTap,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              compassEnabled: true,
              myLocationButtonEnabled: false,
            ),
      Align(
        alignment: Alignment.topCenter,
        child: FloatingActionButton.extended(
          onPressed: () {}, //함수 추가할 필요 없음
          label: Text(address),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        // add your floating action button
        child: FloatingActionButton.extended(
          onPressed:
              () {}, //주소(jsonDecode(response.body)['results'][0]['formatted_address'])를 가지고 게시글 등록 화면으로 이동
          label: Text(selectaddress),
        ),
      ),
    ]));
  }

  _handleTap(LatLng tappedPoint) async {
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
      ));
    });
    var lat = tappedPoint.latitude;
    var lon = tappedPoint.longitude;
    final Uri clickurl = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lon&key=AIzaSyBdf3QkB2KbMDzdfPXYxoBBfyFSk_fxBqk&language=ko');
    final response = await http.get(clickurl);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: tappedPoint, zoom: 16)));
    setState(() {
      address = jsonDecode(response.body)['results'][0]['formatted_address'];
      selectaddress = '이 장소로 선택';
    });
  }
}

class loading extends StatelessWidget {
  const loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(''),
            Text(''),
            Text(''),
            Text(
              'Map Loading...',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
            Text(''),
            Text(''),
            Text(''),
            SizedBox(
              child: CircularProgressIndicator(),
              height: 250.0,
              width: 250.0,
            ),
            Text(''),
            Text(''),
            Text(''),
            Text(
              '위치 권한을 확인해 주십시오',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Text(''),
            Text(''),
            Text(''),
            Text(
              '로딩이 오래 걸린다면 연결 상태를 확인하여 주십시오',
              style: TextStyle(fontSize: 15, color: Colors.blue),
            ),
            Text(''),
            Text(''),
            Text(''),
          ],
        ),
      )),
    );
  }
}
