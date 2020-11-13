import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:pesan_travel_apps/services/services.dart';
import 'package:pesan_travel_apps/view/widget/widgets.dart';

part 'components/body.dart';
part 'components/menu_home.dart';
part 'components/search_box.dart';
part 'components/app_bar_home.dart';
part 'components/tools_home.dart';
part 'components/curve_shape.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
