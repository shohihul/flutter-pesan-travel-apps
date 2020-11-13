part of 'widgets.dart';

class OrdersListCard extends StatelessWidget {
  final OrdersListModel orders;

  const OrdersListCard({
    Key key,
    this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          defaultBoxShadow
        ]
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 10,
              decoration: BoxDecoration(
                gradient: gradientPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(0),
                )
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/world-map.png',
                            height: 80,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Antar Kota',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 12
                              ),
                            ),
                            Text(
                              orders.route,
                              style: TextStyle(
                                color: secondColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 14
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              tanggal(orders.start) + ' - ' + DateFormat('HH:mm').format(orders.start) + ' WIB',
                              style: TextStyle(
                                color: secondColor,
                                fontFamily: 'Montserrat',
                                fontSize: 12
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            (orders.status == 'cencel') ? 
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/close.svg',
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Dibatalkan',
                                  style:  TextStyle(
                                    color: secondColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 12
                                  ),
                                ),
                              ],
                            )
                            : (orders.status == 'on_travel') ? 
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.circle
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Sedang Dalam Perjalanan !',
                                  style:  TextStyle(
                                    color: secondColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 12
                                  ),
                                ),
                              ],
                            )
                            : (orders.status == 'done') ? 
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/check.svg',
                                  height: 10,
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Selesai',
                                  style:  TextStyle(
                                    color: secondColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 12
                                  ),
                                ),
                              ],
                            )
                            : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: (orders.invoiceStatus == 'paid_off') ? primaryColor :warningColor,
                                        shape: BoxShape.circle
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      (orders.invoiceStatus == 'paid_off') ? 'Tagihan Lunas' : 'Tagihan Belum Selesai',
                                      style:  TextStyle(
                                        color: secondColor,
                                        fontFamily: 'Montserrat',
                                        fontSize: 12
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: (orders.locationStatus == 'approved') ? primaryColor : warningColor,
                                        shape: BoxShape.circle
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      (orders.locationStatus == 'approved')? 'Lokasi Disetujui' : (orders.locationStatus == 'rejected') ? 'Mohon Ganti Lokasi !' : 'Lokasi Belum Disetujui',
                                      style:  TextStyle(
                                        color: secondColor,
                                        fontFamily: 'Montserrat',
                                        fontSize: 12
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    if (orders.status != 'cencel')
                      GestureDetector(
                        onTap: () {
                          // ignore: close_sinks
                          PickupMarkerBloc pickupMarkerBloc = BlocProvider.of<PickupMarkerBloc>(context);
                          // ignore: close_sinks
                          DropoffMarkerBloc dropffMarkerBloc = BlocProvider.of<DropoffMarkerBloc>(context);
                          
                          pickupMarkerBloc.add(AddPickupMarker(null, null));
                          dropffMarkerBloc.add(AddDropoffMarker(null, null));
                          Get.to(OrdersDetail(ordersId: orders.id,));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: gradientPrimaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/tickets.svg',
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}