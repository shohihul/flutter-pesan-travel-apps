part of '../home_page.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, 10),
          //     blurRadius: 10,
          //     color: Colors.black.withOpacity(0.1),
          //   ),
          // ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: greyColor,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  // surffix isn't working properly  with SVG
                  // thats why we use row
                  // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/icons/search.svg",
              color: greyColor,
            ),
          ],
        ),
      ),
    );
  }
}