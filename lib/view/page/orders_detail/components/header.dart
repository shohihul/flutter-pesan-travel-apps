part of '../orders_detail.dart';

class Header extends StatelessWidget {
  final int countSchedule;

  const Header({
    Key key,
    this.countSchedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondColor,
      padding: const EdgeInsets.only(
        top: 60,
        bottom: 10,
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
              'assets/icons/close.svg',
              height: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}