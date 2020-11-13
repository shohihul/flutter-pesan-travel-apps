part of 'models.dart';

class Invoice {
  int id;
  String route;
  String service;
  String status;
  int amount;
  DateTime dueDate;
  int transferTo;
  String bankAccount;
  String accountNumber;
  String bankLogo;


  Invoice(
    this.id,
    this.route, 
    this.service, 
    this.status,
    this.amount,
    this.dueDate,
    this.transferTo,
    this.bankAccount,
    this.accountNumber,
    this.bankLogo
  );

  factory Invoice.fromJson(Map<String, dynamic> object) {
    return Invoice(
      object['id'],
      object['route'],
      object['service'],
      object['status'],
      object['amount'],
      DateTime.parse(object['due_date']),
      object['transfer_to'],
      object['bank_account'],
      object['account_number'],
      object['logo'],
    );
  }
}

Stream<List<Invoice>> getInvoice() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 10));
    final response = await CallApi().getData('get_invoice');
    String body = response.body;
    if(response.statusCode == 200) {
      yield await compute(parseInvoice, body);
    } else{
      print(body);
    }
  }
}

List<Invoice> parseInvoice(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Invoice>((json) => Invoice.fromJson(json)).toList();
}