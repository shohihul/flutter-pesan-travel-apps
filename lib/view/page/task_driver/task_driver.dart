import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:pesan_travel_apps/models/models.dart';
import 'package:pesan_travel_apps/view/page/dropoff_route/dropoff_route.dart';
import 'package:pesan_travel_apps/view/page/pickup_route/pickup_route.dart';

part 'components/header.dart';
part 'components/body.dart';
part 'components/passenger_card.dart';

class TaskDriver extends StatelessWidget {
  final TaskList task;
  const TaskDriver({
    Key key,
    this.task
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: Header(task: task,), preferredSize: Size.fromHeight(200)),
      body: Body(task: task,),
    );
  }
}