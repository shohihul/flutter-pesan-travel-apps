part of 'widgets.dart';

class ServiceBotton extends StatelessWidget {
  const ServiceBotton({
    Key key,
    this.title,
    this.icon,
    this.active,
    this.press,
  }) : super(key: key);

  final String title, icon;
  final bool active;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child : Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 20
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(10, 10),
              spreadRadius: -10,
              blurRadius: 20,
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/" + icon,
              color: greyColor,
              height: 20,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: secondColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 12
              ),
            )
          ],
        ),
      ),
    );
  }
}