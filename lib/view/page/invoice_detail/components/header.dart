part of '../invoice_detail.dart';

class Header extends StatelessWidget {

  const Header({
    Key key,
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
              'Detail Tagihan'.toUpperCase(),
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