part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }
  
  startLaunching() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var duration = const Duration(seconds: 5);
    return new Timer(duration, () async {
      if (sharedPreferences.getString('token') == null) {
        Get.toNamed('/landing_page');
      } else {
        String email = sharedPreferences.getString('email');
        String password = sharedPreferences.getString('password');
        AuthServices.signIn(email, password);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/logo.svg',
          width: 200.0,
        ),
      ),
    );
  }
}
