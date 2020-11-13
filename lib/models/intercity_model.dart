part of 'models.dart';

class IntercityRoute {
  int originId;
  int destinationId;
  String origin;
  String destination;

  IntercityRoute(this.originId, this.destinationId, this.origin, this.destination);

  factory IntercityRoute.fromJson(Map<String, dynamic> object) {
    return IntercityRoute(
      object['origin_id'],
      object['destination_id'],
      object['origin'],
      object['destination'],
    );
  }
}

class IntercitySchedule {
  int id;
  String origin;
  String destination;
  int price;
  DateTime start;
  int routeReady;
  String status;
  int available;

  IntercitySchedule(
    this.id,
    this.origin,
    this.destination,
    this.price,
    this.start,
    this.routeReady,
    this.status,
    this.available,
  );

  factory IntercitySchedule.fromJson(Map<String, dynamic> object) {
    return IntercitySchedule(
      object['id'],
      object['origin'],
      object['destination'],
      object['price'],
      DateTime.parse(object['start']),
      object['route_ready'],
      object['status'],
      object['available'],
    );
  }
}

List<IntercityRoute> parseIntercityRouteList(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<IntercityRoute>((json) => IntercityRoute.fromJson(json)).toList();
}

Future<List<IntercityRoute>> getRouteList() async {
  var response = await CallApi().getData('route');
  String body = response.body;
  if (response.statusCode == 200) {
    return await compute(parseIntercityRouteList, body);
  } else {
    print(response.body);
  }
}

List<IntercitySchedule> parseIntercitySchedule(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<IntercitySchedule>((json) => IntercitySchedule.fromJson(json)).toList();
}

Future<List<IntercitySchedule>> getScheduleList(originId, destinationId) async {
  var url = 'route_schedule/' + originId + '/' + destinationId;
  var response = await CallApi().getData(url);
  String body = response.body;
  if (response.statusCode == 200) {
    return await compute(parseIntercitySchedule, body);
  }else {
    print(response.body);
  }
}

// Future<IntercitySchedule> getSchedule(id) async {
//   var url = 'schedule/' + id + '/show';
//   var response = await CallApi().getData(url);
//   var body = json.decode(response.body);
//   print(body);
//   if (response.statusCode == 200) {
//     return IntercitySchedule.fromJson(body);
//   }else {
//     print(response.body);
//   }
// }