part of '../home_page.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Stack(
        children: [
          ClipPath(
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: gradientPrimaryColor
              ),
            ),
            clipper: CurveShape(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBarHome(),
              sizeBoxVertical,
              ToolsHome(),
              sizeBoxVertical,
              MenuHome(),
              SizedBox(height: kDefaultPadding),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recommendation',
                  style: secondTitleTextStyle,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
