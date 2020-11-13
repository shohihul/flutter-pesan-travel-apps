part of '../history.dart';

class Header extends StatelessWidget {
  final int countSchedule;

  const Header({
    Key key,
    this.countSchedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
              color: primaryColor,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              'History',
              textAlign: TextAlign.left,
              style: secondTitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}