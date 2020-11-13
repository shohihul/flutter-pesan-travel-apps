import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:pesan_travel_apps/models/models.dart';
import 'package:pesan_travel_apps/services/services.dart';

part 'components/header.dart';
part 'components/body.dart';

class InvoiceDetailPage extends StatefulWidget {
  final Invoice invoice;
  
  InvoiceDetailPage({
    Key key,
    this.invoice
  }) : super(key: key);

  @override
  _InvoiceDetailPageState createState() => _InvoiceDetailPageState();
}

class _InvoiceDetailPageState extends State<InvoiceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Header(),
      ),
      body: Body(invoice: widget.invoice,),
    );
  }
}