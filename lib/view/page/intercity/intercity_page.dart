import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pesan_travel_apps/api/api.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:pesan_travel_apps/view/widget/widgets.dart';
import 'package:pesan_travel_apps/models/models.dart';

part 'components/body.dart';
part 'components/header.dart';

class IntercityPage extends StatefulWidget {
  IntercityPage({Key key}) : super(key: key);

  @override
  _IntercityPageState createState() => _IntercityPageState();
}

class _IntercityPageState extends State<IntercityPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: Header(), preferredSize: Size.fromHeight(100)),
      body: Body(),
    );
  }
}