part of 'services.dart';

class AuthServices {
  
  static logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass
    };
    var response = await CallApi().postData(data, 'login');
    if(response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        sharedPreferences.setString("token", jsonResponse['token']);
        sharedPreferences.setString("email", email);
        sharedPreferences.setString("password", pass);
        sharedPreferences.setString("name", jsonResponse['name']);
        if (jsonResponse['role'] == 'driver')
          Get.toNamed('/driver_home');
        else
          Get.toNamed('/home');
      }
    }
    else {
      print(response.body);
    }
  }

  static signUp(String name, email, password) async {
    Map data = {
      'name': name,
      'email': email,
      'password': password,
    };
    var response = await CallApi().postData(data, 'register');
    if(response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        Get.toNamed('/register');
      }
    }
    else {
      print(response.body);
    }
  }

  static getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    return token;
  }
}