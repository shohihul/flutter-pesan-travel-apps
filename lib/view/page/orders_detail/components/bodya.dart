// part of '../orders_detail.dart';

// class Body extends StatefulWidget {
//   final int ordersId;
//   const Body({
//     Key key,
//     this.ordersId,
//   }) : super(key: key);

//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   OrdersModel orders;
//   String pickupAddress = '';
//   String dropoffAddress = '';

//   @override
//   void initState() {
//     getOrders(widget.ordersId);
//     super.initState();
//   }

//   Future setAddress(LatLng pickupPoint, LatLng dropoffPoint) async {
//     var pickup = await GoogleMapsService().getAddress(pickupPoint);
//     var dropoff = await GoogleMapsService().getAddress(dropoffPoint);
//     setState(() {
//       pickupAddress = pickup;
//       dropoffAddress = dropoff;
//     });
//   }

//   Future getOrders(int ordersId) async {
//     final response = await CallApi().getData('orders/' + ordersId.toString() + '/show');
//     var body = response.body;
//     if(response.statusCode == 200) {
//       print(response.statusCode);
//       setState(() {
//         orders = OrdersModel.fromJson(json.decode(body));
//       });
//       setAddress(orders.pickupPoint, orders.dropoffPoint);
//     } else{
//       print(response.statusCode);
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         margin: EdgeInsets.symmetric(
//           vertical: 20,
//           horizontal: 20,
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.15),
//               offset: Offset(0, 10),
//               spreadRadius: -5,
//               blurRadius: 10,
//             )
//           ]
//         ),
//         child: Column(
//           children: [
//             // 1
//             Container(
//               padding: EdgeInsets.all(30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         orders.carName,
//                         style: smallSecondBoldTextStyle,
//                       ),
//                       Text(
//                         orders.carCapacity.toString() + ' Penumpang',
//                         style: smallSecondTextStyle,
//                       )
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         'Berangkat',
//                         style: smallSecondTextStyle,
//                       ),
//                       Text(
//                         tanggal(orders.start),
//                         style: smallSecondBoldTextStyle,
//                       ),
//                       Text(
//                         DateFormat('HH:mm').format(orders.start) + ' WIB',
//                         style: smallSecondBoldTextStyle,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // 2
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SvgPicture.asset(
//                   'assets/icons/half-circle.svg',
//                   height: 20,
//                   color: secondColor,
//                 ),
//                 Expanded(
//                   child: Center(
//                     child: Dash(
//                       direction: Axis.horizontal,
//                       length: 280,
//                       dashLength: 10,
//                       dashGap: 5,
//                       dashThickness: 2,
//                       dashColor: secondColor
//                     ),
//                   ),
//                 ),
//                 RotationTransition(
//                   turns: new AlwaysStoppedAnimation(180 / 360),
//                   child: SvgPicture.asset(
//                     'assets/icons/half-circle.svg',
//                     height: 20,
//                     color: secondColor,
//                   ),
//                 ),
//               ],
//             ),

//             // 3
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Text(
//                       'Tiket Untuk ' + orders.quantity.toString() + ' Orang',
//                       style: smallSecondBoldTextStyle,
//                     ),
//                   ),
//                   sizeBoxVertical,

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Asal',
//                             style: smallSecondTextStyle,
//                           ),
//                           Text(
//                             orders.origin,
//                             style: smallSecondBoldTextStyle,
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                             'Tujuan',
//                             style: smallSecondTextStyle,
//                           ),
//                           Text(
//                             orders.destination,
//                             style: smallSecondBoldTextStyle,
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   divider,
//                   Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Status Penumpang',
//                             style: smallSecondTextStyle,
//                           ),
//                           Text(
//                             (orders.status == 'done') ? 'Selesai' 
//                               : (orders.status == 'on_travel') ? 'Dalam Perjalanan'
//                               : (orders.status == 'cencel') ? 'Dibatalkan'
//                               : 'Terdaftar',
//                             style: smallSecondBoldTextStyle,
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Pembayaran',
//                             style: smallSecondTextStyle,
//                           ),
//                           Text(
//                             (orders.invoiceStatus == 'paid_off') ? 'Lunas' 
//                               : (orders.invoiceStatus == 'on_process') ? 'Proses Verifikasi'
//                               : (orders.invoiceStatus == 'cencel') ? 'Dibatalkan'
//                               : (orders.invoiceStatus == 'rejected') ? 'Konfirmasi Ditolak'
//                               : 'Belum Dibayar',
//                             style: TextStyle(
//                               color: (orders.invoiceStatus == 'rejected')? warningColor : secondColor,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Montserrat',
//                               fontSize: 12
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Lokasi',
//                             style: smallSecondTextStyle,
//                           ),
//                           Text(
//                             (orders.locationStatus == 'rejected') ? 'Lokasi Ditolak' 
//                               : (orders.locationStatus == 'approved') ? 'Disetujui'
//                               : 'Menunggu Verifikasi',
//                             style: TextStyle(
//                               color: (orders.locationStatus == 'rejected')? warningColor :secondColor,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Montserrat',
//                               fontSize: 12
//                             ),
//                           )
//                         ],
//                       ),
//                       (orders.locationStatus != 'rejected') ? Container() : 
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           sizeBoxVertical,
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Pesan Admin :',
//                                 style: smallSecondTextStyle,
//                               ),
//                               Text(
//                                 orders.adminNote,
//                                 style: smallSecondBoldTextStyle,
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/exclamation.svg',
//                                 height: 30,
//                                 color: greyColor,
//                               ),
//                               SizedBox(width: 10),
//                               Expanded(
//                                 child: Text(
//                                   'Jika lokasi penjemputan atau lokasi pengantaran yang ditolak tidak segera diganti, maka lokasi akan ditentukan oleh admin',
//                                   style: smallSecondTextStyle,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   divider,
                  
//                   BlocBuilder<DropoffMarkerBloc, DropoffMarkerState>(
//                     builder: (context, dropoff) => BlocBuilder<PickupMarkerBloc, PickupMarkerState>(
//                       builder: (context, pickup) =>  Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Lokasi Penjemputan',
//                                     style: smallSecondTextStyle,
//                                   ),
//                                   Container(
//                                     width: 170,
//                                     decoration: BoxDecoration(
//                                       border: Border(bottom: BorderSide(color: greyColor, width: 1))
//                                     ),
//                                     child: Center(
//                                       child: SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child: Text(
//                                           pickupAddress,
//                                           style: smallSecondBoldTextStyle,
//                                         ),
//                                       ),
//                                     )
//                                   )
//                                 ],
//                               ),
//                               SizedBox(height: 10),
                              
//                               GestureDetector(
//                                 onTap: null,
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(5),
//                                     border: Border.all(
//                                       width: 2,
//                                       color: primaryColor
//                                     )
//                                   ),
//                                   child: Text(
//                                     'Lihat',
//                                     style: TextStyle(
//                                       color: secondColor,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'Montserrat',
//                                       fontSize: 12,
//                                     )
//                                   )
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 10),

//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Lokasi Pengantaran',
//                                     style: smallSecondTextStyle,
//                                   ),
//                                   Container(
//                                     width: 170,
//                                     decoration: BoxDecoration(
//                                       border: Border(bottom: BorderSide(color: greyColor, width: 1))
//                                     ),
//                                     child: Center(
//                                       child: SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child: Text(
//                                           dropoffAddress,
//                                           style: smallSecondBoldTextStyle,
//                                         ),
//                                       ),
//                                     )
//                                   )
//                                 ],
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   dropoffPointButton(context, orders.dropoffPoint, false);
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(5),
//                                     border: Border.all(
//                                       width: 2,
//                                       color: primaryColor
//                                     )
//                                   ),
//                                   child: Text(
//                                     'Lihat',
//                                     style: TextStyle(
//                                       color: secondColor,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'Montserrat',
//                                       fontSize: 12,
//                                     )
//                                   )
//                                 ),
//                               ),
//                             ],
//                           ),
//                           sizeBoxVertical,
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Catatan Lokasi Penjemputan :',
//                                 style: smallSecondTextStyle,
//                               ),
//                               Text(
//                                 'Depan Warung Merah',
//                                 style: smallSecondBoldTextStyle,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   sizeBoxVertical,

//                   (orders.invoiceStatus == 'paid_off') ? Container() :
//                   ButtonTheme(
//                     minWidth: double.infinity,
//                     child: FlatButton(
//                       onPressed: () => Get.toNamed('/invoice'),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         side: BorderSide(color: greyColor)
//                       ),
//                       child: Text(
//                         'Tagihan'.toUpperCase(),
//                         style: smallSecondBoldTextStyle,
//                       )
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// void dropoffPointButton(context, LatLng coordinate, bool editable) {

//   Future<void> future = showGeneralDialog<void>(
//     barrierDismissible: false,
//     barrierColor: Colors.black45,
//     transitionDuration: const Duration(milliseconds: 200),
//     context: context, 
//     pageBuilder: (BuildContext context, Animation animation, Animation secondAnimation) {
//       return DropoffMaps(coordinate: coordinate, editable: editable,);
//     }
//   );
// }