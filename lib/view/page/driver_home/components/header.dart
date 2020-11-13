part of '../driver_home.dart';

class Header extends StatelessWidget {
  final String name;
  const Header({
    Key key,
    this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20
      ),
      margin: EdgeInsets.only(
        top: 40,
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: gradientSecondColor,
        boxShadow: [
          BoxShadow(
            color: secondColor.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: -5,
            offset: Offset(0, 10),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              AuthServices.logout();
              Get.toNamed('/landing_page');
            },
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/travel-supir.jpg"),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Driver',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 10
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 14
                ),
              ),
              SizedBox(height: 8),
              Text(
                '2 Tugas Selesai - Oktober',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 10
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}