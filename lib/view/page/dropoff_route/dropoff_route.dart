import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:interactive_maps_marker/utils.dart';
import 'package:pesan_travel_apps/api/api.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:pesan_travel_apps/models/models.dart';

class DropoffRoute extends StatefulWidget {
  LatLng center;
  final double zoom;

  @required
  final IndexedWidgetBuilder itemContent;
  final int taskId;
  final IndexedWidgetBuilder itemBuilder;

  DropoffRoute({
    this.taskId,
    this.itemBuilder,
    this.center = const LatLng(-0.789275, 113.921327),
    this.itemContent,
    this.zoom = 5.0,
  });

  Uint8List markerIcon;
  Uint8List markerIconSelected;

  @override
  _DropoffRouteState createState() => _DropoffRouteState();
}

class _DropoffRouteState extends State<DropoffRoute> {
  List<Passenger> passengers = [];
  Set<Polyline> _polyline = {};

  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  PageController pageController = PageController(viewportFraction: 0.9);

  Set<Marker> markers;
  int currentIndex = 0;
  ValueNotifier selectedMarker = ValueNotifier<int>(null);
  List<LatLng> route = List();
  PolylinePoints polylinePoints = PolylinePoints();
  List<PolylineWayPoint> wayPoint;
  List<LatLng> polylineCoordinates = [];
  

  @override
  void initState() {
    _getPassengers();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    rebuildMarkers(currentIndex);
    super.didChangeDependencies();
  }

  _getPassengers() async {
    List<Passenger> listPassengers = await getPassengerOrderByDropoff(widget.taskId);
    setState(() {
      passengers = listPassengers;
      widget.center = passengers[0].dropoffPoint;
    });
    
    mapController
        .animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: widget.center, zoom: 13),
      ),
    )
        .then((val) {
      setState(() {});
    });

    rebuildMarkers(currentIndex);
    _getPolyline();
  }   

  _getPolyline() async{
    for (Passenger passenger in passengers) {
      route.add(passenger.dropoffPoint);
    }

    for (var i = 0; i < route.length-1; i++) {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleAPIKey,
          PointLatLng(route[i].latitude, route[i].longitude),
          PointLatLng(route[i+1].latitude, route[i+1].longitude),
          travelMode: TravelMode.driving,
        // wayPoints: wayPoint
      );
      
      if(result.points.isNotEmpty){
        // loop through all PointLatLng points and convert them
        // to a list of LatLng, required by the Polyline
        result.points.forEach((PointLatLng point){
          polylineCoordinates.add(
            LatLng(point.latitude, point.longitude));
        });
      }

      setState(() {
        // create a Polyline instance
        // with an id, an RGB color and the list of LatLng pairs
        Polyline polyline = Polyline(
          polylineId: PolylineId('Rute' + (i+1).toString()),
          color: Colors.blue,
          width: 3,
          points: polylineCoordinates
        );

        // add the constructed polyline as a set of points
        // to the polyline set, which will eventually
        // end up showing up on the map
        _polyline.add(polyline);
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<int>(
        builder: (context, snapshot) {
          return Stack(
            children: <Widget>[
              _buildMap(),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 40, left: 15),
                  child: Container(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            defaultBoxShadow
                          ]
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/left-arrow.svg',
                          color: primaryColor,
                          height: 15,
                        ),
                      ),
                    ),
                  ),
                )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    height: 160,
                    child: PageView.builder(
                      itemCount: passengers.length,
                      controller: pageController,
                      onPageChanged: _pageChanged,
                      itemBuilder: widget.itemBuilder != null ? widget.itemBuilder : _buildItem,
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }

  Widget _buildMap() {
    return Positioned.fill(
      child: ValueListenableBuilder(
        valueListenable: selectedMarker,
        builder: (context, value, child) {
          return GoogleMap(
            zoomControlsEnabled: false,
            markers: value == null ? null : markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: _onMapCreated,
            polylines: _polyline,
            initialCameraPosition: CameraPosition(
              target: widget.center,
              zoom: widget.zoom,
            ),
          );
        },
      ),
    );
  }

  Widget _buildItem(context, i) {
    Passenger passenger = passengers[i];

    var status = '';
    if (passenger.status == 'on_travel')
      if (i == 0)
        status = 'enable';
      else if (passengers[i-1].status == 'on_travel')
        status = 'disable';
      else 
        status = 'enable';
    else
      status = 'done';

    return Transform.scale(
      scale: i == currentIndex ? 1 : 0.9,
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: secondColor.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: -5,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                          url + passenger.passengerPhoto
                          ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      passenger.passenger,
                      style: secondTitleTextStyle,
                    ),
                  ],
                ),
                Text(
                  passenger.quantity.toString() + ' Tiket',
                  style: secondTitleTextStyle
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
              color: Color(0xFFEEEEEE),
            ),
            GestureDetector(
              onTap: () {
                if (status == 'enable') {
                  _dropoffButton(passenger.id, i);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: (status == 'done') ? primaryColor.withOpacity(0.1) : (status == 'enable') ? primaryColor :  greyColor.withOpacity(0.3)
                ),
                child: Center(
                  child: Row(
                    children: [
                      (status == 'done') ?
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            'assets/icons/check.svg',
                            height: 10,
                            color: primaryColor,
                          ),
                        )
                      : Container(),
                      Text(
                        (status == 'done') ? 'Sudah Diantar' : 'Selesai Diantar',
                        style: TextStyle(
                          color: (status == 'done') ? primaryColor : Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pageChanged(int index) {
    setState(() => currentIndex = index);
    Marker marker = markers.elementAt(index);
    rebuildMarkers(index);

    mapController
        .animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: marker.position, zoom: 15),
      ),
    )
        .then((val) {
      setState(() {});
    });
  }

  Future<void> rebuildMarkers(int index) async {
    int current = passengers[index].id;

    if (widget.markerIcon == null) widget.markerIcon = await getBytesFromAsset('assets/icons/location-pin.png', 80);
    if (widget.markerIconSelected == null) widget.markerIconSelected = await getBytesFromAsset('assets/icons/location-pin-active.png', 100);

    Set<Marker> _markers = Set<Marker>();

    passengers.forEach((passenger) {
      _markers.add(
        Marker(
          markerId: MarkerId(passenger.id.toString()),
          position: passenger.dropoffPoint,
          onTap: () {
            int tappedIndex = passengers.indexWhere((element) => element.id == passenger.id);
            pageController.animateToPage(
              tappedIndex,
              duration: Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
            );
            _pageChanged(tappedIndex);
          },
          icon: passenger.id == current ? BitmapDescriptor.fromBytes(widget.markerIconSelected) : BitmapDescriptor.fromBytes(widget.markerIcon),
        ),
      );
    });

    setState(() {
      markers = _markers;
    });
    selectedMarker.value = current;
  }

  _dropoffButton(int id, index) async {
    Map data = {
      'status': 'done'
    };
    var response = await CallApi().postData(data, 'orders/' + id.toString() + '/update');
    if(response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        print(jsonResponse['message']);
      }
    }
    else {
      print(response.body);
    }

    List<Passenger> listPassengers = await getPassengerOrderByPickup(widget.taskId);
    setState(() {
      passengers = listPassengers;
    });
    
    Timer(Duration(seconds: 3), () {
      int tappedIndex = index + 1;
      if (tappedIndex < passengers.length){
        pageController.animateToPage(
          tappedIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
        );
        _pageChanged(tappedIndex);
      }
    });
    
  }
}