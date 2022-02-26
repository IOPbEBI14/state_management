import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../domain/state.dart';

class GridViewBuilder extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const GridViewBuilder({required this.snapshot, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _state = CurrentHotelState();

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
                      Observer(
                        builder: (_) => TextButton(
                          style: ElevatedButton.styleFrom(
                            primary: (snapshot.data[index].uuid ==
                                    _state.currentHotel)
                                ? Colors.red
                                : Colors.lightBlue,
                            // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            _state.setCurrentHotel(snapshot.data[index].uuid);
                          },
                          child: Text(
                            (snapshot.data[index].uuid == _state.currentHotel)
                                ? 'Забронировано'
                                : 'Забронировать',
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      )
                    ])
              ]);
        });
  }
}
