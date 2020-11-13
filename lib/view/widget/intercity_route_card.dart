part of 'widgets.dart';

class IntercityRouteCard extends StatelessWidget {
  final IntercityRoute route;

  IntercityRouteCard(
    this.route
  );

  @override
  Widget build(BuildContext context) {

    // ignore: close_sinks
    DropoffMarkerBloc dropoffMarkerBloc = BlocProvider.of<DropoffMarkerBloc>(context);
    // ignore: close_sinks
    PickupMarkerBloc pickupMarkerBloc = BlocProvider.of<PickupMarkerBloc>(context);

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10
      ),
      padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(10, 10),
              spreadRadius: -10,
              blurRadius: 20,
            )
          ]
        ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dari',
                        style: TextStyle(
                          color: greyColor,
                          fontFamily: 'Montserrat',
                          fontSize: 10.0
                        ),
                      ),
                      Text(
                        route.origin,
                        style: secondTitleTextStyle
                      )
                    ],
                  ),
                  Divider(
                    height: 20,
                    thickness: 1,
                    color: Color(0xFFEEEEEE),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ke',
                        style: TextStyle(
                          color: greyColor,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0
                        ),
                      ),
                      Text(
                        route.destination,
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 16.0
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                pickupMarkerBloc.add(AddPickupMarker(null, null));
                dropoffMarkerBloc.add(AddDropoffMarker(null, null));
                Get.toNamed(
                  '/intercity_schedule?origin=' + route.origin 
                  + '&destination=' + route.destination 
                  + '&originId=' + route.originId.toString() 
                  + '&destinationId=' + route.destinationId.toString()
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withOpacity(0.1),
                ),
                child: SvgPicture.asset(
                  'assets/icons/calendar_bold.svg',
                  height: 20,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}