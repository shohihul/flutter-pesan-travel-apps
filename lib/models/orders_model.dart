part of 'models.dart';

class OrdersModel {
  int id;
  LatLng pickupPoint;
  LatLng dropoffPoint;
  String locationStatus;
  String locationNote;
  String adminNote;
  int quantity;
  String status;
  int pickupSequence;
  int dropoffSequence;
  String invoiceStatus;
  String origin;
  String destination;
  DateTime start;
  String driverName;
  String carName;
  int carCapacity;

  OrdersModel(
    this.id,
    this.pickupPoint,
    this.dropoffPoint,
    this.locationStatus,
    this.locationNote,
    this.adminNote,
    this.quantity,
    this.status,
    this.pickupSequence,
    this.dropoffSequence,
    this.invoiceStatus,
    this.origin,
    this.destination,
    this.start,
    this.driverName,
    this.carName,
    this.carCapacity,
  );

  factory OrdersModel.fromJson(Map<String, dynamic> object) {
    List<String> pickup = object['pickup_point'].split(',');
    List<String> dropoff = object['dropoff_point'].split(',');

    LatLng pickupPoint = new LatLng(double.parse(pickup[0]),double.parse(pickup[1]));
    LatLng dropoffPoint = new LatLng(double.parse(dropoff[0]),double.parse(dropoff[1]));

    return OrdersModel(
      object['id'],
      pickupPoint,
      dropoffPoint,
      object['location_point_status'],
      object['location_note'],
      object['admin_note'],
      object['quantity'],
      object['status'],
      object['pickup_sequence'],
      object['dropoff_sequence'],
      object['invoice_status'],
      object['origin'],
      object['destination'],
      DateTime.parse(object['start']),
      object['driver_name'],
      object['car_name'],
      object['car_capacity'],
    );
  }
}

class OrdersListModel {
  int id;
  String locationStatus;
  String status;
  String invoiceStatus;
  String route;
  DateTime start;

  OrdersListModel(
    this.id,
    this.locationStatus,
    this.status,
    this.invoiceStatus,
    this.route,
    this.start,
  );

  factory OrdersListModel.fromJson(Map<String, dynamic> object) {
    return OrdersListModel(
      object['id'],
      object['location_point_status'],
      object['status'],
      object['invoice_status'],
      object['route'],
      DateTime.parse(object['start']),
    );
  }
}

List<OrdersListModel> parseOrdersList(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<OrdersListModel>((json) => OrdersListModel.fromJson(json)).toList();
}

Future<OrdersModel> getOrders(int ordersId) async {
  final response = await CallApi().getData('orders/' + ordersId.toString() + '/show');
  var body = json.decode(response.body);
  if(response.statusCode == 200) {
    return OrdersModel.fromJson(body);
  } else{
    print(body);
  }
}

Stream<List<OrdersListModel>> getOrdersList() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 10));
    final response = await CallApi().getData('get_orders');
    String body = response.body;
    if(response.statusCode == 200)
      yield await compute(parseOrdersList, body);
    else
      print(body);
  }
}

Future<List<OrdersListModel>> getHistoryList() async {
  final response = await CallApi().getData('get_orders/history');
  String body = response.body;
  if(response.statusCode == 200) {
    return await compute(parseOrdersList, body);
    // return data;
  } else{
    print(body);
  }
}

Future editLocation(int ordersId, LatLng pickupPoint, LatLng dropoffPoint, String locationNote) async {
  Map data = {
    'pickup_point': pickupPoint.latitude.toString() + ',' + pickupPoint.longitude.toString(),
    'dropoff_point': dropoffPoint.latitude.toString() + ',' + dropoffPoint.longitude.toString(),
    'location_note': locationNote,
    'location_point_status': 'new',
  };
  var response = await CallApi().postData(data, 'orders/' + ordersId.toString() + '/update');
  if(response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print(jsonResponse['message']);
  }
  else {
    print(response.body);
  }
}