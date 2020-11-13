part of '../intercity_page.dart';

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
        left: 20,
        right: 20,
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
              'Antar Kota',
              textAlign: TextAlign.left,
              style: secondTitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}