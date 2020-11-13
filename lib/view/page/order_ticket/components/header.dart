part of '../order_ticket.dart';

class Header extends StatelessWidget {
  final int countSchedule;

  const Header({
    Key key,
    this.countSchedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      padding: const EdgeInsets.only(
        top: 60,
        bottom: 40,
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              'assets/icons/left-arrow.svg',
              height: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              'Pesan Tiket'.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 16.0
              ),
            ),
          ),
        ],
      ),
    );
  }
}