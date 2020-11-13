part of '../order_ticket.dart';

class CobaCard extends StatefulWidget {
  @override
  _CobaCardState createState() => _CobaCardState();
}

class _CobaCardState extends State<CobaCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          defaultBoxShadow
        ]
      ),
    );
  }
}