import 'package:climav2/services/location.dart';
import 'package:flutter/material.dart';
import 'package:climav2/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  static const apiKey = '9cfd673239817c5155ded3db3c26e2e8';
  double lat;
  double lon;

  void getLocationData() async {
    Location appLocation = Location();
    await appLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${appLocation.lat}&lon=${appLocation.long}'
        '&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF26324c),
      body: Center(
        child: SpinKitCubeGrid(
          color: Color(0xFF1fc5e1),
        ),
      ),
    );
  }
}
