import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentHotelCubit extends Cubit<String> {
  String currentHotel = '';

  CurrentHotelCubit() : super('');

  void setCurrentHotel(String value) {
    emit(value);
  }
}
