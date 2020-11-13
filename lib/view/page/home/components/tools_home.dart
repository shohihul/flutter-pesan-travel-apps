part of '../home_page.dart';

class ToolsHome extends StatelessWidget {
  const ToolsHome({Key key}) : super(key: key);

  Widget _menu(String icon, title, bool alert, Function press){

    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0),
              borderRadius: new BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  "assets/icons/" + icon,
                  height: 20,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 10
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: (alert == true) ? warningColor : Colors.transparent,
                shape: BoxShape.circle
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        gradient: gradientSecondColor,
        borderRadius: new BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 20),
            spreadRadius: -10,
            blurRadius: 20,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _menu('calendar.svg', 'Pesanan', false, () => Get.toNamed('/orders')),
          _menu('history.svg', 'Riwayat', false, () => Get.toNamed('/history')),
          _menu('invoice.svg', 'Tagihan', true, () => Get.toNamed('/invoice')),
          _menu('bookmark.svg', 'Disimpan', false, null)
        ],
      ),
    );
  }
}