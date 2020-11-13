part of 'services.dart';

class InvoiceService {
  
  static paymentConfirmation(invoiceId) async {
    Map data = {
      'status': 'on_process'
    };
    var response = await CallApi().postData(data, 'invoice/' + invoiceId.toString() + '/update');
    if(response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        print(jsonResponse['message']);
      }
      Get.toNamed('/invoice');
    }
    else {
      print(response.body);
    }
  }
}