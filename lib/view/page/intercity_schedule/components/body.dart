part of '../intercity_schedule_page.dart';

class Body extends StatelessWidget {
  final String originId;
  final String destinationId;
  final String origin;
  final String destination;

  Body({
    Key key,
    this.originId,
    this.destinationId,
    this.origin,
    this.destination
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getScheduleList(originId, destinationId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var listSchedule = snapshot.data;
          return Container(
            child: Column(
              children: [
                RouteCard(origin: origin, destination: destination),
                Expanded(
                  child: ListView.builder(
                    itemCount: listSchedule.length,
                    itemBuilder: (BuildContext context, int index) {
                      return IntercityScheduleCard(listSchedule[index]);
                    },
                  ),
                ),
              ],
            ),
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