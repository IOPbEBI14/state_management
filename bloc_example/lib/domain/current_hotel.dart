import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class StateHotel {}

class SetCurrentHotelState extends StateHotel {
  late String currentHotel;

  SetCurrentHotelState(this.currentHotel);
}

class CurrentHotelBloc extends Bloc<StateHotel, String> {
  CurrentHotelBloc() : super('') {
    on<SetCurrentHotelState>((event, emit) => emit(event.currentHotel));
  }
}
