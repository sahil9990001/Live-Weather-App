// import 'package:http/http.dart' ;


// import 'dart:convert';

// import 'package:weather_api_app/Modals/weather.dart';


// class ApiServices {
//   static Future<List<Weather>> fetchNews() async {
//     Response response = await get(Uri.parse(
//         "ap.org/data/2.5/https://api.openweathermweather?q=London&appid=d7f87c0f3113a79b1d53bcde799a17e0"));
//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//       Map<String, dynamic> json = jsonDecode(jsonString);
//       // List<dynamic> body = json['articles'];
//       // Map<Weather,dynamic> articles =
//       //     json.map((dynamic item) => Weather.fromJson(item)).toList();
//       return articles;
//     } else {
//       throw ("Can't fetch articles");
//     }
//   }
// }
