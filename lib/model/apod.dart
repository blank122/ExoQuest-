import 'dart:convert';

class Apod {
  final String copyRight; //author
  final String date; //date today
  final String explanation; //photo explaination
  final String hdurl; //hdurl for image
  final String mediaType; //media type
  final String serviceVersion; //version of the api
  final String title; //title of the piece
  final String url; //image

  Apod({
    required this.copyRight,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  factory Apod.fromMap(Map<String, dynamic> map) {
    return Apod(
      copyRight: map['copyright'] ?? '',
      date: map['date'] ?? '',
      explanation: map['explanation'] ?? '',
      hdurl: map['hdurl'] ?? '',
      mediaType: map['media_type'] ?? '',
      serviceVersion: map['service_version'] ?? '',
      title: map['title'] ?? '',
      url: map['url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'copyright': copyRight,
      'date': date,
      'explanation': explanation,
      'hdurl': hdurl,
      'media_type': mediaType,
      'service_version': serviceVersion,
      'title': title,
      'url': url,
    };
  }

  String toJson() => json.encode(toMap());

  factory Apod.fromJson(String source) => Apod.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Apod(copyRight: $copyRight, date: $date, title: $title, url: $url, hdurl: $hdurl, explanation: $explanation, mediaType: $mediaType, serviceVersion: $serviceVersion)';
  }
}
