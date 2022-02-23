import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/current_hotel.dart';

class GridViewBuilder extends ConsumerWidget {
  final AsyncSnapshot snapshot;

  const GridViewBuilder({required this.snapshot, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentHotel = ref.watch(currentHotelProvider);
    final provider = ref.watch(currentHotelProvider.notifier);

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
                          primary: (snapshot.data[index].uuid ==
                                  currentHotel.toString())
                              ? Colors.red
                              : Colors.lightBlue,
                          // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          provider.setCurrentHotel(snapshot.data[index].uuid);
                        },
                        child: Text(
                          (snapshot.data[index].uuid == currentHotel.toString())
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
