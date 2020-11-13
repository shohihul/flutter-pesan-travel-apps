import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:pesan_travel_apps/services/services.dart';
import 'package:pesan_travel_apps/view/page/task_driver/task_driver.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pesan_travel_apps/models/models.dart';

part 'components/body.dart';
part 'components/header.dart';
part 'components/task_list_card.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({Key key}) : super(key: key);

  @override
  _DriverHomeState createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  String name = '';
  
  @override
  void initState() { 
    super.initState();
    getName();
  }

  getName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      name = sharedPreferences.getString('name');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Header(name: name),
        preferredSize: Size.fromHeight(100)
      ),
      body: Body(),
    );
  }
}