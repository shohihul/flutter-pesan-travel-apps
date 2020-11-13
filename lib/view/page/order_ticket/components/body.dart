part of '../order_ticket.dart';

// class Body extends StatefulWidget {
//   final IntercitySchedule schedule;
//   final Function(String) noteOnChange;

//   Body({
//     Key key,
//     this.schedule,
//     this.noteOnChange,
//   }) : super(key: key);

//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           height: 80,
//           color: primaryColor,
//         ),
//         Expanded(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 RouteCard(origin: sche,)
//                 DetailCard(
//                   schedule: schedule,
//                   noteOnChange: widget.noteOnChange,
//                 ),
//               ],
//             ),
//           ),
//         )
//       ]
//     );
//   }
// }

class Body extends StatelessWidget {
  final IntercitySchedule schedule;
  final Function(String) noteOnChange;

  Body({
    Key key,
    this.schedule,
    this.noteOnChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          color: primaryColor,
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RouteCard(origin: schedule.origin, destination: schedule.destination),
              DetailCard(
                schedule: schedule,
                noteOnChange: noteOnChange,
              ),
            ],
          ),
        ),
      ]
    );
  }
}