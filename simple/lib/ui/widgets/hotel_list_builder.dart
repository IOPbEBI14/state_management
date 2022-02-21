import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/hotel_list.dart';
import 'grid_view_builder.dart';

class HotelListBuilder extends StatelessWidget {
  const HotelListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HotelList>(builder: (context, state, child)
    {
      return FutureBuilder(
        future: state.hotels,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(state.dioError);
              } else if (snapshot.hasData) {
                return GridViewBuilder(snapshot: snapshot, state: state);
              } else {
                return const CircularProgressIndicator();
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      );
    });
  }
}
