part of 'models.dart';

class Passenger {
  int id;
  LatLng pickupPoint;
  LatLng dropoffPoint;
  String locationPointStatus;
  String locationNote;
  int quantity;
  String status;
  int pickupSequence;
  int dropoffSequence;
  String passenger;
  String passengerPhoto;

  Passenger(
    this.id,
    this.pickupPoint,
    this.dropoffPoint,
    this.locationPointStatus,
    this.locationNote,
    this.quantity,
    this.status,
    this.pickupSequence,
    this.dropoffSequence,
    this.passenger,
    this.passengerPhoto,
  );

  factory Passenger.fromJson(Map<String, dynamic> object) {
    List<String> pickup = object['pickup_point'].split(',');
    List<String> dropoff = object['dropoff_point'].split(',');

    LatLng pickupPoint = new LatLng(double.parse(pickup[0]),double.parse(pickup[1]));
    LatLng dropoffPoint = new LatLng(double.parse(dropoff[0]),double.parse(dropoff[1]));

    return Passenger(
      object['id'],
      pickupPoint,
      dropoffPoint,
      object['location_point_status'],
      object['location_note'],
      object['quantity'],
      object['status'],
      object['pickup_sequence'],
      object['dropoff_sequence'],
      object['passenger'],
      object['passenger_photo'],
    );
  }
}

List<Passenger> parsePassengerList(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Passenger>((json) => Passenger.fromJson(json)).toList();
}

Future<List<Passenger>> getPassengerList(int taskId) async {
  final response = await CallApi().getData('passenger/' + taskId.toString());
  String body = response.body;
  if(response.statusCode == 200) {
    return await compute(parsePassengerList, body);
    // return data;
  } else{
    print(body);
  }
}

Future<List<Passenger>> getPassengerOrderByPickup(int taskId) async {
  final response = await CallApi().getData('passenger_orderBy_pickup/' + taskId.toString());
  String body = response.body;
  if(response.statusCode == 200) {
    return await compute(parsePassengerList, body);
    // return data;
  } else{
    print(body);
  }
}

Future<List<Passenger>> getPassengerOrderByDropoff(int taskId) async {
  final response = await CallApi().getData('passenger_orderBy_dropoff/' + taskId.toString());
  String body = response.body;
  if(response.statusCode == 200) {
    return await compute(parsePassengerList, body);
  } else{
    print(body);
  }
}