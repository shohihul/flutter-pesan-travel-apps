part of 'models.dart';

class Bank {
  int id;
  String bankAccount;
  String tag;
  String logo;

  Bank(this.id, this.bankAccount, this.tag, this.logo);

  factory Bank.fromJson(Map<String, dynamic> object) {
    return Bank(
      object['id'],
      object['bank_account'],
      object['tag'],
      object['logo']
    );
  }
}

List<Bank> parseBankList(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Bank>((json) => Bank.fromJson(json)).toList();
}

Future<List<Bank>> getBanks() async {
  var response = await CallApi().getData('saving_account');
  String body = response.body;
  if (response.statusCode == 200) {
    return await compute(parseBankList, body);
  } else {
    print(response.body);
  }
}