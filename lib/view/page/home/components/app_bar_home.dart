part of '../home_page.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          top: 60,
          bottom: 20,
          left: kDefaultPadding,
          right: kDefaultPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/bell.svg",
              height: 20,
              color: secondColor,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                AuthServices.logout();
                Get.toNamed('/landing_page');
              },
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/photo.jpeg"),
              ),
            ),
          ],
        ),
    );
  }
}