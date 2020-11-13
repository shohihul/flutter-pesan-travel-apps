part of 'pages.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var _errorMessage = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  ScaffoldState scaffoldState;

  void _validateInputs() {
    Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (nameController.text == '') {
      _errorMessage = "- Nama tidak boleh kosong -";
    } else {
      if (!regex.hasMatch(emailController.text)){
        _errorMessage =  '- Masukan Email dengan benar -';
      } else {
        if (passwordController.text.length < 6) {
          _errorMessage =  '- Password minimal 6 digit -';
        } else {
          _errorMessage = '';
          AuthServices.signUp(nameController.text, emailController.text, passwordController.text);
        }
      }
    }
  }

  Widget _buildErrorMessage(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment:  Alignment.center,
          height: 20.0,
          child: Text(
            _errorMessage,
            style: TextStyle(
              color: dangerColor,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            style: formTextStyle,
            controller: nameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0, left: 50),
              prefixIcon: Icon(
                Icons.person,
                color: secondColor,
              ),
              hintText: 'Enter your Name',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: secondColor,
              fontFamily: 'Montserrat',
            ),
            controller: emailController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0, left: 50),
              prefixIcon: Icon(
                Icons.email,
                color: secondColor,
              ),
              hintText: 'Enter your Email',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(
              color: secondColor,
              fontFamily: 'Montserrat',
            ),
            controller: passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0, left: 50),
              prefixIcon: Icon(
                Icons.lock,
                color: secondColor,
              ),
              hintText: 'Enter your Password',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: FlatButton(
        onPressed: () {
          _validateInputs();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: primaryColor,
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }

  Widget _buildSigninBtn() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an Account? ',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Sign In',
            recognizer: new TapGestureRecognizer()..onTap = (){
              Navigator.push(
                  context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            style: TextStyle(
              color: secondColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    vertical: 80.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/icons/logo.svg',
                        width: 250,
                        ),
                      SizedBox(height: 80.0),
                      Text(
                        'Create Account',
                        style: TextStyle(
                          color: secondColor,
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      _buildErrorMessage(),
                      SizedBox(height: 10.0),
                      _buildNameTF(),
                      SizedBox(height: 10.0),
                      _buildEmailTF(),
                      SizedBox(height: 10.0),
                      _buildPasswordTF(),
                      _buildRegisterBtn(),
                      _buildSigninBtn(),
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