import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/hotel_list.dart';

String _hotelsURL =
    'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HotelList>(builder: (context, state, child) {
      return Scaffold(
          appBar: AppBar(),
          body: Center(
              child: FutureBuilder(
            future: state.hotels,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text(state.dioError);
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                        shrinkWrap: true,
                        controller: ScrollController(keepScrollOffset: false),
                        itemCount: snapshot.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    'assets/images/' +
                                        snapshot.data[index].poster,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        snapshot.data[index].name,
                                        textAlign: TextAlign.center,
                                      ),
                                      TextButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: (snapshot.data[index].uuid ==
                                                  state.currentHotel)
                                              ? Colors.red
                                              : Colors.lightBlue,
                                          // background
                                          onPrimary: Colors.white, // foreground
                                        ),
                                        onPressed: () {
                                          context
                                              .read<HotelList>()
                                              .setCurrentHotel(
                                                  snapshot.data[index].uuid);
                                        },
                                        child: Text(
                                          (snapshot.data[index].uuid ==
                                                  state.currentHotel)
                                              ? 'Забронировано'
                                              : 'Забронировать',
                                          textAlign: TextAlign.justify,
                                        ),
                                      )
                                    ])
                              ]);
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                default:
                  return const CircularProgressIndicator();
              }
            },
          )));
    });
  }
}
