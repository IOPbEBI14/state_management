import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class StateHotel {}

class SetCurrentHotel extends StateHotel {
  late String currentHotel;

  SetCurrentHotel(this.currentHotel);
}

class CurrentHotelBloc extends Bloc<StateHotel, String> {
  CurrentHotelBloc() : super('') {
    on<SetCurrentHotel>((event, emit) => emit(event.currentHotel));
  }
}
