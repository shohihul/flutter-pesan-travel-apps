part of '../home_page.dart';

class MenuHome extends StatelessWidget {  
  const MenuHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Container(
        margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: GridView.count(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.5,
          children: <Widget>[
            ServiceBotton(
              title: 'Sewa Mobil',
              icon: 'car.svg',
              active: false,
            ),
            ServiceBotton(
              title: 'Intercity',
              icon: 'direction.svg',
              active: false,
              press: () => Get.toNamed('/intercity')
            ),
            ServiceBotton(
              title: 'Tour Travel',
              icon: 'beach.svg',
              active: false,
            ),
            ServiceBotton(
              title: 'Private Trip',
              icon: 'plane.svg',
              active: false,
            ),
          ],
        ),
      ),
    );
  }
}