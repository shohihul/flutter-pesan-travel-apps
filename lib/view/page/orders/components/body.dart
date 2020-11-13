part of '../orders.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getOrdersList(),
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