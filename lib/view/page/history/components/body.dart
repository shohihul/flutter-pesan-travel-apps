part of '../history.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<OrdersListModel>> orders;
  // StreamController _streamOrdersController = StreamController();
  Timer _timer;

  @override
  void initState() {
    getData();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => getData());
    super.initState();
  }

  getData() async {
    // _streamOrdersController.add(getOrdersList());
    setState(() {
      orders = getHistoryList();
    });
  }

  @override
  void dispose() {
    //cancel the timer
    if (_timer.isActive) _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: orders.asStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var listOrders = snapshot.data;
          return ListView.builder(
            itemCount: listOrders.length,
            itemBuilder: (context, index) {
              return OrdersListCard(orders: listOrders[index],);
            }
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