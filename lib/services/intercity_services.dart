part of 'services.dart';

class IntercityServices {
  
  static orderTicket(serviceId, qty, amount, pickupPoint, dropoffPoint, bankId, note) async {
    Map data = {
      'door_to_door_service_id': serviceId.toString(),
      'pickup_point': pickupPoint.toString(),
      'dropoff_point': dropoffPoint.toString(),
      'quantity': qty.toString(),
      'amount': amount.toString(),
      'transfer_to': bankId.toString(),
      'location_note': note,
    };
    var response = await CallApi().postData(data, 'order_ticket');
    if(response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        print(jsonResponse['message']);
      }
      Get.toNamed('/home');
    }
    else {
      print(response.body);
    }
  }
}