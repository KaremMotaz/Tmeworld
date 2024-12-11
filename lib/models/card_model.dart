import 'dart:convert';
import 'package:http/http.dart';

class CardModel {
  final String apiCountryZone;
  final String countryZone;
  final String imgUrl;
  late int minute;
  late int hour;

  CardModel({
    required this.apiCountryZone,
    required this.countryZone,
    required this.imgUrl,
  });

  getData() async {
    Response responseData = await get(Uri.parse(
        "https://timeapi.io/api/time/current/zone?timeZone=$apiCountryZone"));

    var receivedData = jsonDecode(responseData.body);
    minute = receivedData["minute"];
    hour = receivedData["hour"];
  }
}
