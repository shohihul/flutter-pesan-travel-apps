import 'package:http/http.dart' as http;
import 'package:pesan_travel_apps/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  var token;
  // final String _url = 'http://192.168.1.12:8000/api/';

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
  }

  postData(data, apiUrl) async {
    var fullUrl = url + '/api/' + apiUrl;
    await _getToken();
    return await http.post(fullUrl, body: data, headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = url + '/api/' + apiUrl;
    await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
    'Content-Type' : 'application/x-www-form-urlencoded',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

  // _getToken() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token = localStorage.getString('token');
  //   return '?token=$token';
  // }
}
