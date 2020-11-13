part of 'widgets.dart';

// ignore: must_be_immutable
class IntercityScheduleCard extends StatelessWidget {
  final IntercitySchedule schedule;
  // final int serviceId;
  // final int available;
  // final int price;
  // final DateTime start;
  // final String origin;
  // final String destination;
  
  IntercityScheduleCard(
    this.schedule
  );

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: -5,
            offset: Offset(0, 10),
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      schedule.start.day.toString(),
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 30.0
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.MMMM().format(schedule.start),
                          style: TextStyle(
                            color: secondColor,
                            fontFamily: 'Montserrat',
                            fontSize: 14.0
                          ),
                        ),
                        Text(
                          DateFormat.y().format(schedule.start),
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
                          DateFormat('HH:mm').format(schedule.start) + ' WIB',
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
                          schedule.available.toString() + ' seats',
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
                          rupiah(schedule.price),
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
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              counterBloc.add(SetOne());
              Get.to(OrderTicket(schedule: schedule,));
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                gradient: gradientPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )
              ),
              child: Center(
                child: Text(
                  'Pesan Tiket',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}