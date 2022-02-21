import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/hotel_list.dart';

class GridViewBuilder extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final HotelList state;

  const GridViewBuilder({required this.snapshot, required this.state, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        controller: ScrollController(keepScrollOffset: false),
        itemCount: snapshot.data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/' + snapshot.data[index].poster,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        snapshot.data[index].name,
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          primary:
                              (snapshot.data[index].uuid == state.currentHotel)
                                  ? Colors.red
                                  : Colors.lightBlue,
                          // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          context
                              .read<HotelList>()
                              .setCurrentHotel(snapshot.data[index].uuid);
                        },
                        child: Text(
                          (snapshot.data[index].uuid == state.currentHotel)
                              ? 'Забронировано'
                              : 'Забронировать',
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ])
              ]);
        });
  }
}
