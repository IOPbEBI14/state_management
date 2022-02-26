// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CurrentHotelState on _CurrentHotelState, Store {
  final _$currentHotelAtom = Atom(name: '_CurrentHotelState.currentHotel');

  @override
  String get currentHotel {
    _$currentHotelAtom.reportRead();
    return super.currentHotel;
  }

  @override
  set currentHotel(String value) {
    _$currentHotelAtom.reportWrite(value, super.currentHotel, () {
      super.currentHotel = value;
    });
  }

  final _$_CurrentHotelStateActionController =
      ActionController(name: '_CurrentHotelState');

  @override
  void setCurrentHotel(String value) {
    final _$actionInfo = _$_CurrentHotelStateActionController.startAction(
        name: '_CurrentHotelState.setCurrentHotel');
    try {
      return super.setCurrentHotel(value);
    } finally {
      _$_CurrentHotelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentHotel: ${currentHotel}
    ''';
  }
}
