import 'dart:convert';

import 'package:exoplanet_nasa/model/apod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class NasaController {
  Future<Apod?> getAstronomyPictureForToday() async {
    final response = await http.get(
      Uri.parse('https://api.nasa.gov/planetary/apod'),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': dotenv.env['NASA_API_KEY'] ?? '',
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      // print('response Forms Data: $responseData');
      final Map<String, dynamic> dataParsing = responseData['form'];
      developer.log('convert apod data to map: $dataParsing');
      Apod data = Apod.fromMap(dataParsing);

      return data;
    } else {
      print('Failed to get the apod: ${response.body}');
      return null;
    }
  }
}
