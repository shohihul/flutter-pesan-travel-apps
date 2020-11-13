part of '../task_driver.dart';

class PassengerCard extends StatelessWidget {
  final Passenger passenger;

  const PassengerCard({
    Key key,
    this.passenger
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          defaultBoxShadow
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 25,
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
          Row(
            children: [
              Text(
                passenger.quantity.toString(),
                style: smallSecondBoldTextStyle,
              ),
              SizedBox(width: 5),
              Text(
                'Tiket',
                style: smallTitleTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}