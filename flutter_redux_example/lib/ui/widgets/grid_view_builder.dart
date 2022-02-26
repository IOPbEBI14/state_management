import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../actions/actions.dart';

class GridViewBuilder extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const GridViewBuilder({required this.snapshot, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Store<String> store = StoreProvider.of<String>(context);
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
                      StoreConnector<String, String>(
                        converter: (store) => store.state,
                        builder: (context, state) => TextButton(
                          style: ElevatedButton.styleFrom(
                            primary:
                                (snapshot.data[index].uuid == state.toString())
                                    ? Colors.red
                                    : Colors.lightBlue,
                            // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () => store.dispatch(
                              SetCurrentHotel(snapshot.data[index].uuid)),
                          child: Text(
                            (snapshot.data[index].uuid == state.toString())
                                ? 'Забронировано'
                                : 'Забронировать',
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ])
              ]);
        });
  }
}
