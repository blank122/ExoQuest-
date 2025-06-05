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

      developer.log('convert apod data to map: $responseData');
      Apod data = Apod.fromMap(responseData); // no need to extract any field

      developer.log(data.toString());
      return data;
    } else {
      developer.log('Failed to get the apod: ${response.body}');
      return null;
    }
  }
}
