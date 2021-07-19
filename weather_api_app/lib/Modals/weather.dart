import 'dart:convert';

import 'package:http/http.dart';

class Weather {
  Weather({this.location}) {
    location = this.location;
  }
  String location;
  double temp;
  double tempMin;
  double tempMax;
  String humidity;
  String wind;
  String disc;
  String error;
  String url;
  double feelTemp;
  String visibility;
  String pressure;
  // factory Weather.fromJson(Map<String, dynamic> json) => Weather(
  //       temp: json["main"]['temp'].toString(),
  //       tempMax: json["main"]['temp_max'].toString(),
  //       tempMin: json["main"]['temp_min'].toString(),
  //       humidity: json["main"]['humidity'].toString(),
  //       main: json["weather"]['main'] as String,
  //     );

  Future<void> fetchWeather() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=your_Api_Key"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      Map<String, dynamic> data = jsonDecode(jsonString);

      temp = data["main"]['temp'].toDouble();
      tempMax = data["main"]['temp_max'].toDouble();
      tempMin = data["main"]['temp_min'].toDouble();
      humidity = data["main"]['humidity'].toString();
      wind = data["wind"]['speed'].toString();
      // disc = data["weather"][0]['description'].toString();
      url = data["weather"][0]["icon"].toString();
      disc = data["weather"][0]["main"].toString();
      feelTemp = data["main"]['feels_like'];
      pressure = data["main"]['pressure'].toString();
      visibility = data['visibility'].toString();
    } else {
      error = 'Wrong City';
    }
  }
}
