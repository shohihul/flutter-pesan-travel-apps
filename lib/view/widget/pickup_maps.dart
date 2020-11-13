part of 'widgets.dart';

class PickupMaps extends StatefulWidget {
  final LatLng coordinate;
  final bool editable;
  final String origin;
  const PickupMaps({
    Key key,
    this.coordinate,
    this.editable,
    this.origin
  }) : super(key: key);

  @override
  _PickupMapsState createState() => _PickupMapsState();
}

class _PickupMapsState extends State<PickupMaps> {
  String address;
  bool markerVisible = true;

  @override
  void initState() {
    _getAddress();
    if (widget.origin != null) {
      markerVisible = false;
    }
    super.initState();
  }

  Future _getAddress() async {
    var alamat = await GoogleMapsService().getAddress(widget.coordinate);
    setState(() {
      address = alamat;
    });
  }

  Future onTap(LatLng point) async {
    // ignore: close_sinks
    PickupMarkerBloc pickupMarkerBloc = BlocProvider.of<PickupMarkerBloc>(context);
    String pickupAddress = await GoogleMapsService().getAddress(point);

    pickupMarkerBloc.add(AddPickupMarker(point, pickupAddress));
    setState(() {
      markerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<PickupMarkerBloc, PickupMarkerState>(
          builder: (context, pickup) => Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: (pickup.point == null) ? widget.coordinate : pickup.point,
                    zoom: 12
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('pickUp'),
                      position: (pickup.point == null) ? widget.coordinate : pickup.point,
                      icon: BitmapDescriptor.defaultMarker,
                      visible: (pickup.point == null ) ? markerVisible : true,
                    )
                  },
                  onTap: (LatLng point) {
                    if (widget.editable == true )
                      onTap(point);
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      top: 60,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Pilih Lokasi Penjemputan',
                          style: formTextStyle,
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: greyColor, width: 1))
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                (pickup.address == null) ? (widget.origin == null) ? address : widget.origin : pickup.address,
                                style: primaryTitleTextStyle,
                              ),
                            ),
                          )
                        )
                      ]
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 60),
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]
                        ),
                        child: Center(
                          child: Text(
                            'Selesai',
                            style: TextStyle(
                              color: primaryColor,
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}