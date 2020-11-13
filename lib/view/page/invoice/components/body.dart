part of '../invoice.dart';

class Body extends StatelessWidget {

  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return StreamBuilder<List<Invoice>>(
      stream: getInvoice(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var listInvoice = snapshot.data;
          return ListView.builder(
            itemCount: listInvoice.length,
            itemBuilder: (context, index) {
              return InvoiceListCard(
                invoice: listInvoice[index],
              );
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