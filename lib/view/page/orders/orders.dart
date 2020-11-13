import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pesan_travel_apps/models/models.dart';
import 'package:pesan_travel_apps/view/widget/widgets.dart';

part 'components/header.dart';
part 'components/body.dart';

class Orders extends StatefulWidget {
  Orders({Key key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Header(countSchedule: 2,),
        preferredSize: Size.fromHeight(100)
      ),
      body: Body(),
    );
  }
}