import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentHotelBloc extends Cubit<String> {
  String currentHotel = '';

  CurrentHotelBloc() : super('');

  void setCurrentHotel(String value) {
    emit(value);
  }
}
