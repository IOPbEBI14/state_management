import 'package:flutter/material.dart';
import '../../domain/hotel_list.dart';
import 'grid_view_builder.dart';

class HotelListBuilder extends StatelessWidget {
  HotelListBuilder({Key? key}) : super(key: key);

  final HotelList hotelList = HotelList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: hotelList.getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text(hotelList.dioError);
            } else if (snapshot.hasData) {
              return GridViewBuilder(snapshot: snapshot);
            } else {
              return const CircularProgressIndicator();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
