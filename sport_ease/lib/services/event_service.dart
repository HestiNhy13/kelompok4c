import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event_model.dart';

class EventService {
  static Future<List<EventModel>> fetchEvents() async {
    final response = await http.get(Uri.parse('https://yourdomain.com/api/events'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => EventModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat data event');
    }
  }
}
