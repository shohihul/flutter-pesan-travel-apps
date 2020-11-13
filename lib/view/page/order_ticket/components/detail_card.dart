part of '../order_ticket.dart';

class DetailCard extends StatefulWidget {

  final IntercitySchedule schedule;
  final Function(String) noteOnChange;

  const DetailCard({
    Key key,
    this.schedule,
    this.noteOnChange
  }) : super(key: key);

  @override
  _DetailCardState createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  List<Bank> bank = [];
  LatLng originPoint;
  LatLng destinationPoint;

  @override
  void initState() {
    getBankList();
    geocode();
    super.initState();
  }

  getBankList() async{
    var getBank = await getBanks();
    setState(() {
      bank = getBank;
    });
  }

  Future geocode() async {
    var origin = Get.parameters['origin'];
    var destination = Get.parameters['destination'];
    var originGeocode = await locationFromAddress(origin);
    var destinationGeocode = await locationFromAddress(destination);
    setState(() {
      originPoint = LatLng(originGeocode.first.latitude, originGeocode.first.longitude);
      destinationPoint = LatLng(destinationGeocode.first.latitude, destinationGeocode.first.longitude); 
    });
    // print("${originPoint} : ${destinationPoint}");
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    // ignore: close_sinks
    VisibleBloc visibleBloc = BlocProvider.of<VisibleBloc>(context);

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          defaultBoxShadow
        ]
      ),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.schedule.start.day.toString(),
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 30
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.MMMM().format(widget.schedule.start),
                        style: TextStyle(
                          color: secondColor,
                          fontFamily: 'Montserrat',
                          fontSize: 14
                        ),
                      ),
                      Text(
                        DateFormat.y().format(widget.schedule.start),
                        style: TextStyle(
                          color: secondColor,
                          fontFamily: 'Montserrat',
                          fontSize: 10
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keberangkatan',
                        style: TextStyle(
                          color: greyColor,
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        DateFormat('HH:mm').format(widget.schedule.start) + ' WIB',
                        style: TextStyle(
                          color: secondColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tersedia',
                        style: TextStyle(
                          color: greyColor,
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        widget.schedule.available.toString() + ' seats',
                        style: TextStyle(
                          color: secondColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harga',
                        style: TextStyle(
                          color: greyColor,
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        moneyFormat.format(widget.schedule.price),
                        style: TextStyle(
                          color: secondColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              divider,
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, ticketCount) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/tickets.svg',
                            color: primaryColor,
                            height: 20,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          ticketCount.value.toString() + 'x',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 20.0
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Tiket',
                          style: TextStyle(
                            color: greyColor,
                            fontFamily: 'Montserrat',
                            fontSize: 16.0
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (ticketCount.value > 1) {
                              counterBloc.add(Decrement());
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFF0F0F0),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/minus.svg',
                              height: 10,
                              color: primaryColor,
                            )
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            if (ticketCount.value < widget.schedule.available) {
                              counterBloc.add(Increment());
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFF0F0F0),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/plus.svg',
                              height: 10,
                              color: primaryColor,
                            )
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              divider,
              //Lokasi Penjemputan
              BlocBuilder<VisibleBloc, VisibleState>(
                builder: (context, visible) => Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/send.svg',
                            color: primaryColor,
                          ),
                        ),
                        BlocBuilder<PickupMarkerBloc, PickupMarkerState>(
                          builder: (context, pickup) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lokasi Penjemputan',
                                style: TextStyle(
                                  color: secondColor,
                                  fontFamily: 'Montserrat',
                                  fontSize: 10
                                ),
                              ),
                              Container(
                                width: 180,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    (pickup.address == null) ? 'Pilih lokasi penjemputan' : pickup.address,
                                    style: smallSecondBoldTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => pickupPointButton(context, widget.schedule.origin, originPoint),
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: gradientPrimaryColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/pin.svg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizeBoxVertical,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/pin.svg',
                            color: dangerColor,
                          ),
                        ),
                        BlocBuilder<DropoffMarkerBloc, DropoffMarkerState>(
                          builder: (context, dropoff) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lokasi Tujuan',
                                style: TextStyle(
                                  color: secondColor,
                                  fontFamily: 'Montserrat',
                                  fontSize: 10.0
                                ),
                              ),
                              Container(
                                width: 180,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    (dropoff.address == null) ? 'Pilih lokasi penjemputan' : dropoff.address,
                                    style: smallSecondBoldTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => dropoffPointButton(context, widget.schedule.destination, destinationPoint),
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: gradientPrimaryColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/pin.svg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizeBoxVertical,
                    TextFormField(
                      style: formTextStyle,
                      maxLines: null,
                      onChanged: widget.noteOnChange,
                      decoration: InputDecoration(
                        labelText: 'Catatan Lokasi Penjemputan',
                        labelStyle: labelStyle,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        hintText: 'Tulis Catatan...',
                        hintStyle: hintTextStyle,
                      ),
                    ),
                    sizeBoxVertical,
                    BlocBuilder<SelectedBankBloc, SelectedBankState>(
                      builder: (context, selectedBank) =>  Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Metode Pembayaran',
                              style: TextStyle(
                                color: secondColor,
                                fontFamily: 'Montserrat',
                                fontSize: 10
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text(
                                  (selectedBank.index == null) ? 'Pilih Metode Pembayaran' : "Transfer Bank " + bank[selectedBank.index].bankAccount,
                                  style: smallSecondBoldTextStyle,
                                ),
                                sizeBoxHorizontal,
                                GestureDetector(
                                  onTap: () {
                                    visibleBloc.add(VisibleFalse());
                                    paymentButton(context, bank);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      gradient: gradientPrimaryColor,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/credit-card.svg',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void pickupPointButton(context, origin, originPoint) {
  // ignore: close_sinks
  VisibleBloc visibleBloc = BlocProvider.of<VisibleBloc>(context);

  Future<void> future = showGeneralDialog<void>(
    barrierDismissible: false,
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 200),
    context: context, 
    pageBuilder: (BuildContext context, Animation animation, Animation secondAnimation) {
      return PickupMaps(coordinate: originPoint, editable: true, origin: origin,);
    }
  );
  future.then((value) {
    visibleBloc.add(VisibleTrue());
  });
}

void dropoffPointButton(context, destination, destinationPoint) {
  // ignore: close_sinks
  VisibleBloc visibleBloc = BlocProvider.of<VisibleBloc>(context);

  Future<void> future = showGeneralDialog<void>(
    barrierDismissible: false,
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 200),
    context: context, 
    pageBuilder: (BuildContext context, Animation animation, Animation secondAnimation) {
      return DropoffMaps(coordinate: destinationPoint, editable: true, destination: destination);
    }
  );
  future.then((value) {
    visibleBloc.add(VisibleTrue());
  });
}

void paymentButton(context, banks) {
  // ignore: close_sinks
  VisibleBloc visibleBloc = BlocProvider.of<VisibleBloc>(context);

  Future<void> future = showModalBottomSheet<void>(
    context: context,
    builder: (builder){
      return BankModal(banks: banks,);
    }
  );
  future.then((value) {
    visibleBloc.add(VisibleTrue());
  });
}