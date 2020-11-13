import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:pesan_travel_apps/bloc/bloc.dart';
import 'package:pesan_travel_apps/constant.dart';
import 'package:pesan_travel_apps/models/models.dart';
import 'package:pesan_travel_apps/services/services.dart';
import 'package:pesan_travel_apps/view/page/invoice_detail/invoice_detail.dart';
import 'package:pesan_travel_apps/view/page/order_ticket/order_ticket.dart';
import 'package:pesan_travel_apps/view/page/orders_detail/orders_detail.dart';

part 'service_menu_button.dart';
part 'intercity_route_card.dart';
part 'intercity_schedule_card.dart';
part 'bank_modal.dart';
part 'invoice_list_card.dart';
part 'dropoff_maps.dart';
part 'pickup_maps.dart';
part 'orders_list_card.dart';