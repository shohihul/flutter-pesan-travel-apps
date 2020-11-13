part of '../order_ticket.dart';

class Footer extends StatelessWidget {
  final int serviceId;
  final int price;
  final String note;

  const Footer({
    Key key, 
    this.serviceId,
    this.price, 
    this.note
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(0, -5),
            spreadRadius: -5,
            blurRadius: 10,
          )
        ]
      ),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, ticketCount) => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Total Pembayaran',
                  style: smallTitleTextStyle,
                ),
                Text(
                  rupiah(price*ticketCount.value),
                  style: primaryTitleTextStyle,
                ),
              ],
            ),
            sizeBoxHorizontal,
            BlocBuilder<SelectedBankBloc, SelectedBankState>(
              builder: (context, selectedBank) => BlocBuilder<PickupMarkerBloc, PickupMarkerState>(
                builder: (context, pickup) => BlocBuilder<DropoffMarkerBloc, DropoffMarkerState>(
                  builder: (context, dropoff) => GestureDetector(
                    onTap: () {
                      var pickupPoint = pickup.point.latitude.toString() + ',' + pickup.point.longitude.toString();
                      var dropoffPoint = dropoff.point.latitude.toString() + ',' + dropoff.point.longitude.toString();
                      validate(serviceId, ticketCount.value, price*ticketCount.value, pickupPoint, dropoffPoint, selectedBank.id, note);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 140,
                      height: double.infinity,
                      color: primaryColor,
                      child: Text(
                        'Pembayaran',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validate(serviceId, qty, amount, pickupPoint, dropoffPoint, bankId, note) {
  if (pickupPoint != null && dropoffPoint != null && bankId != null) {
    IntercityServices.orderTicket(serviceId, qty, amount, pickupPoint, dropoffPoint, bankId, note);
    print('sukses');
  } else {
    print('error');
  }
}
}