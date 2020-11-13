import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pesan_travel_apps/models/models.dart';
import 'package:pesan_travel_apps/view/widget/widgets.dart';

part 'components/header.dart';
part 'components/body.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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