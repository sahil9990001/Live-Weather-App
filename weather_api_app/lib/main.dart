import 'dart:ui';

import 'package:flutter/material.dart';

import 'Modals/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String location = 'indore';
  String temp = '';
  String tempMin = '';
  String tempMax = '';
  String humidity = '';
  String wind_speed = '';
  String description = 'haze';
  String error = '';
  String url = '';
  String pressure = '';
  String visibility = '';
  String feelTemp = '';
  DateTime dateTime = DateTime.now();

  void getWeather(location) async {
    Weather instance = Weather(location: location);
    await instance.fetchWeather();
    setState(() {
      if (instance.error != 'Wrong City') {
        temp = (instance.temp - 273.15).toInt().toString();
        tempMin = (instance.tempMin - 273.15).toInt().toString();
        tempMax = (instance.tempMax - 273.15).toInt().toString();
        humidity = instance.humidity;
        wind_speed = instance.wind;
        description = instance.disc;
        url = instance.url;
        pressure = instance.pressure;
        visibility = instance.visibility;
        feelTemp = (instance.feelTemp - 273.15).toInt().toString();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather('indore');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://source.unsplash.com/1600x900/?$description'),
              fit: BoxFit.cover),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Flutter",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Weather",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w600),
                )
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText: "Enter City Name",
                          labelText: "City Name",
                          suffixIcon: IconButton(
                            onPressed: () {
                              getWeather(location);
                            },
                            icon: Icon(Icons.search),
                          ),
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 400,
                    child: Card(
                      elevation: 30.0,
                      shadowColor: Colors.black26,
                      color: Colors.blueAccent.withOpacity(0.5),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  'http://openweathermap.org/img/w/$url.png',
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  description,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              location.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(dateTime.toString().substring(0, 19)),
                            Text(
                              'Temperature $temp°C',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 400,
                    child: Card(
                      elevation: 30.0,
                      shadowColor: Colors.black26,
                      color: Colors.blue[200].withOpacity(0.5),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Min Temperature $tempMin°C',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Humidity $humidity%',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Feel Temp $feelTemp°C',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Wind Speed $wind_speed kph',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Visibility $visibility',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Pressure $pressure hpa',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
