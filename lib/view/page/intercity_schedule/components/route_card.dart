part of '../intercity_schedule_page.dart';

class RouteCard extends StatelessWidget {
  final String origin;
  final String destination;

  const RouteCard({
    Key key,
    this.origin,
    this.destination
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: primaryColor,
                    width: 3,
                    style: BorderStyle.solid
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    VerticalDivider(
                      width: 20,
                      thickness: 1,
                      color: Color(0xFFEEEEEE),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: dangerColor,
                    width: 3,
                    style: BorderStyle.solid
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dari',
                      style: TextStyle(
                        color: greyColor,
                        fontFamily: 'Montserrat',
                        fontSize: 10.0
                      ),
                    ),
                    Text(
                      origin,
                      style: secondTitleTextStyle
                    )
                  ],
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  color: Color(0xFFEEEEEE),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ke',
                      style: TextStyle(
                        color: greyColor,
                        fontFamily: 'Montserrat',
                        fontSize: 10.0
                      ),
                    ),
                    Text(
                      destination,
                      style: secondTitleTextStyle
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}