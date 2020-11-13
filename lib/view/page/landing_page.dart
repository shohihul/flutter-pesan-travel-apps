part of 'pages.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: FlatButton(
        onPressed: (){
          Navigator.push(
              context,
            MaterialPageRoute(
              builder: (context) => RegisterScreen(),
            ),
          );
        },
        color: secondColor,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Text(
          'GET STARTED',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
      )
    );
  }

  Widget _buildSignInBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: FlatButton(
        onPressed: (){
          Navigator.push(
              context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        color: Colors.transparent,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: secondColor,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Text(
          'SIGN IN',
          style: TextStyle(
            color: secondColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: secondColor,
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 110.0,
                      ),
                      SvgPicture.asset(
                        'assets/icons/logo-icon.svg',
                        width: 100.0,
                      ),
                      SizedBox(
                        height: 110.0,
                      ),
                      _buildRegisterBtn(),
                      _buildSignInBtn(),
                      sizeBoxVertical,
                      GestureDetector(
                        onTap: () => Get.toNamed('/home'),
                        child: Text(
                          'SKIP',
                          style: secondTitleTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}