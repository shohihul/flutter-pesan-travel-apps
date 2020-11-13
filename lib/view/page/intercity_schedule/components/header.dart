part of '../intercity_schedule_page.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
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
              'Jadwal Rute',
              textAlign: TextAlign.left,
              style: secondTitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}