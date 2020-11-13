import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pesan_travel_apps/bloc/bloc.dart';
import 'package:pesan_travel_apps/bloc/pickup_marker/pickup_marker_bloc.dart';
import 'package:pesan_travel_apps/bloc/selected_bank/selected_bank_bloc.dart';
import 'package:pesan_travel_apps/view/page/driver_home/driver_home.dart';
import 'package:pesan_travel_apps/view/page/history/history.dart';
import 'package:pesan_travel_apps/view/page/home/home_page.dart';
import 'package:pesan_travel_apps/view/page/intercity/intercity_page.dart';
import 'package:pesan_travel_apps/view/page/intercity_schedule/intercity_schedule_page.dart';
import 'package:pesan_travel_apps/view/page/invoice/invoice.dart';
import 'package:pesan_travel_apps/view/page/order_ticket/order_ticket.dart';
import 'package:pesan_travel_apps/view/page/orders/orders.dart';
import 'package:pesan_travel_apps/view/page/pages.dart';
import 'package:pesan_travel_apps/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<VisibleBloc>(create: (context) => VisibleBloc()),
        BlocProvider<SelectedBankBloc>(create: (context) => SelectedBankBloc()),
        BlocProvider<PickupMarkerBloc>(create: (context) => PickupMarkerBloc()),
        BlocProvider<DropoffMarkerBloc>(create: (context) =>DropoffMarkerBloc()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: isNull,
        initialRoute: '/',
        home: SplashScreen(),
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/landing_page', page: () => LandingPage()),
          GetPage(name: '/login', page: () => LoginScreen()),
          GetPage(name: '/register', page: () => RegisterScreen()),
          GetPage(name: '/home', page: () => HomePage()),
          GetPage(name: '/driver_home', page: () => DriverHome()),
          GetPage(name: '/intercity', page: () => IntercityPage()),
          GetPage(name: '/intercity_schedule', page: () => IntercitySchedulePage()),
          GetPage(name: '/order_ticket', page: () => OrderTicket()),
          GetPage(name: '/invoice', page: () => InvoicePage()),
          GetPage(name: '/orders', page: () => Orders()),
          GetPage(name: '/history', page: () => History()),

        ],
        title: 'Pesan Travel',
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          primaryColor: primaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.transparent
          ),
        ),
      ),
    );
  }
}
