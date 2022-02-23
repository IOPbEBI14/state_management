import 'package:flutter/material.dart';
import './widgets/hotel_list_builder.dart';

String _hotelsURL =
    'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: HotelListBuilder()));
  }
}
