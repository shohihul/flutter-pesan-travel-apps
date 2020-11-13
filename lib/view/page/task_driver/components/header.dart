part of '../task_driver.dart';

class Header extends StatefulWidget {
  final TaskList task;

  const Header({
    Key key,
    this.task
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool pickupRouteLoading = false;
  bool dropoffRouteLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: gradientSecondColor,
        boxShadow: [
          BoxShadow(
            color: secondColor.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: -5,
            offset: Offset(0, 10),
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/left-arrow.svg',
                    color: primaryColor,
                    height: 15,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Antar Kota',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 10
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.task.origin + ' - ' + widget.task.destination,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 12
                    ),
                  ),
                  Text(
                    tanggal(widget.task.start) + ' - ' + DateFormat('HH:mm').format(widget.task.start),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 12
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/minivan-car.svg',
                  height: 15,
                  color: primaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  widget.task.carName,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 10
                  ),
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/passenger.svg',
                  height: 15,
                  color: primaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  widget.task.passengerCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 10
                  ),
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/map.svg',
                  height: 15,
                  color: primaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  (widget.task.routeReady == 0) ? 'Not Ready' : 'Ready',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 10
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    pickupRouteButton();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: setUpPickupRouteButton()
                    ),
                  ),
                )
              ),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () async{
                    dropoffRouteButton();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: setUpDropoffRouteButton(),
                    ),
                  ),
                )
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget setUpPickupRouteButton() {
    if (pickupRouteLoading == false) {
      return new Text(
        'Rute Penjemputan',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontSize: 10
        ),
      );
    } else {
      return SizedBox(
        height: 10,
        width: 10,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
  }

  Future pickupRouteButton() async {
    setState(() {
      pickupRouteLoading = true;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        pickupRouteLoading = false;
      });
    });
    Get.to(PickupRoute(taskId: widget.task.serviceId,));
  }

  Widget setUpDropoffRouteButton() {
    if (dropoffRouteLoading == false) {
      return new Text(
        'Rute Pengantaran',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontSize: 10
        ),
      );
    } else {
      return SizedBox(
        height: 10,
        width: 10,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
  }

  Future dropoffRouteButton() async {
    setState(() {
      dropoffRouteLoading = true;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        dropoffRouteLoading = false;
      });
    });
    Get.to(DropoffRoute(taskId: widget.task.serviceId,));
  }
}