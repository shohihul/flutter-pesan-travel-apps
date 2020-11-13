part of '../intercity_page.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRouteList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var listRoute = snapshot.data;
          return ListView.builder(
            itemCount: listRoute.length,
            itemBuilder: (BuildContext context, int index) {
              return IntercityRouteCard(listRoute[index]);
            },
          );
        } else {
          return Center (
            child: CircularProgressIndicator()
          );
        }
      }
    );
  }
}