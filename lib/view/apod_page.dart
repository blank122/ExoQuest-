import 'package:exoplanet_nasa/controller/nasa_controller.dart';
import 'package:exoplanet_nasa/model/apod.dart';
import 'package:flutter/material.dart';

class ApodPage extends StatefulWidget {
  const ApodPage({super.key});

  @override
  State<ApodPage> createState() => _ApodPageState();
}

class _ApodPageState extends State<ApodPage> {
  //create a future that links to the nasa controller
  final NasaController _nasaController = NasaController();
  late Future<Apod?> _apodFuture;

  @override
  void initState() {
    super.initState();
    _apodFuture = _nasaController.getAstronomyPictureForToday();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Apod?>(
      future: _apodFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('naay error chuy bugo');
        }

        if (!snapshot.hasData) {
          return Text('no data ulols');
        }
        return Text('ulos');
      },
    );
  }
}
