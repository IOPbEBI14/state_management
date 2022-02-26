import 'package:mobx/mobx.dart';

part 'state.g.dart';

class CurrentHotelState = _CurrentHotelState with _$CurrentHotelState;

abstract class _CurrentHotelState with Store {

  @observable
  String currentHotel = '';

  @action
  void setCurrentHotel(String value) {
    currentHotel = value;
  }
}