import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:pesan_travel_apps/bloc/bloc.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:get/get.dart';
import 'package:pesan_travel_apps/models/models.dart';
import 'package:geocoding/geocoding.dart';
import 'package:pesan_travel_apps/services/services.dart';
import 'package:pesan_travel_apps/view/widget/widgets.dart';

part 'components/header.dart';
part 'components/body.dart';
part 'components/route_card.dart';
part 'components/detail_card.dart';
part 'components/footer.dart';
part 'components/coba.dart';

class OrderTicket extends StatefulWidget {
  final IntercitySchedule schedule;

  OrderTicket({
    Key key,
    this.schedule
  }) : super(key: key);

  @override
  _OrderTicketState createState() => _OrderTicketState();
}

class _OrderTicketState extends State<OrderTicket> {
  String note = '';
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: BlocBuilder<VisibleBloc, VisibleState>(
        builder: (context, visible) => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Visibility(
              visible: visible.value,
              child: Header()
            ),
          ),
          body: Body(
            schedule: widget.schedule,
            noteOnChange: (val) => setState(() {
              note = val;
            }),
          ),
          bottomNavigationBar: Visibility(
            visible: visible.value,
            child: Footer(serviceId: widget.schedule.id, price:widget.schedule.price, note: note,)
          ),
        ),
      ),
    );
  }
}