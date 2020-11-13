import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:pesan_travel_apps/view/widget/widgets.dart';
import 'package:pesan_travel_apps/models/models.dart';

part 'components/header.dart';
part 'components/body.dart';
part 'components/route_card.dart';

class IntercitySchedulePage extends StatefulWidget {

  @override
  _IntercitySchedulePageState createState() => _IntercitySchedulePageState();
}

class _IntercitySchedulePageState extends State<IntercitySchedulePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: Header(), preferredSize: Size.fromHeight(100)),
      body: Body(originId: Get.parameters['originId'], destinationId: Get.parameters['destinationId'], origin: Get.parameters['origin'], destination: Get.parameters['destination']),
    );
  }
}