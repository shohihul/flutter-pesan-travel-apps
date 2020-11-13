import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:pesan_travel_apps/bloc/bloc.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:pesan_travel_apps/models/models.dart';
import 'package:pesan_travel_apps/services/services.dart';
import 'package:pesan_travel_apps/view/widget/widgets.dart';

part 'components/body.dart';
part 'components/header.dart';

class OrdersDetail extends StatefulWidget {
  final int ordersId;

  OrdersDetail({
    Key key,
    this.ordersId
  }) : super(key: key);

  @override
  _OrdersDetailState createState() => _OrdersDetailState();
}

class _OrdersDetailState extends State<OrdersDetail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: secondColor,
        appBar: PreferredSize(
          child: Header(countSchedule: 2,),
          preferredSize: Size.fromHeight(100)
        ),
        body: Body(ordersId: widget.ordersId),
      ),
    );
  }
}