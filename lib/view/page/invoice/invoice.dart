import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:get/get.dart';
import 'package:pesan_travel_apps/models/models.dart';
import 'package:pesan_travel_apps/view/widget/widgets.dart';

part 'components/header.dart';
part 'components/body.dart';

class InvoicePage extends StatefulWidget {
  InvoicePage({Key key}) : super(key: key);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Header(countInvoice: 2,),
        preferredSize: Size.fromHeight(100)
      ),
      body: Body(),
    );
  }
}