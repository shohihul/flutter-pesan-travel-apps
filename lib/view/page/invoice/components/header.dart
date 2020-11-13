part of '../invoice.dart';

class Header extends StatelessWidget {
  final int countInvoice;

  const Header({
    Key key,
    this.countInvoice,
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
              'Tagihan',
              textAlign: TextAlign.left,
              style: secondTitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}