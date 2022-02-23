import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../data/hotel.dart';

String _hotelsURL =
    'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';

class HotelList {
  Future<List<HotelPreview>> hotels = Future.value([]);
  final Dio _dio = Dio();
  bool isError = false;
  late String dioError;

  late String currentHotel;

  Future<List<HotelPreview>> getData() async {
    try {
      final responce = await _dio.get(_hotelsURL);
      hotels = Future.value(responce.data
          .map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel))
          .toList());
      isError = false;
      return hotels;
    } on DioError catch (e) {
      isError = true;
      hotels = Future.error(e.toString());
      dioError = e.message;
      return hotels;
    }
  }
}
