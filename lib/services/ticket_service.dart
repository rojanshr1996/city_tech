import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_city_project/model/ticket_model.dart';
import 'package:new_city_project/utils/res/constants.dart';
import 'package:new_city_project/utils/utilities.dart';

class TicketService {
  static final TicketService _shared = TicketService._sharedInstance();
  TicketService._sharedInstance();
  factory TicketService() => _shared;

  Future<TicketModel?> getAllTickets() async {
    Map<String, dynamic> jsonResponse;
    try {
      var response = await http.get(
        Uri.parse(allTickets),
        headers: {"X-XSRF-TOKEN": accessToken},
      );
      jsonResponse = await Utilities.decodeJson(utf8.decode(response.bodyBytes));
      log("JSON RESPONSE: $jsonResponse");
      TicketModel ticketData = TicketModel.fromJson(jsonResponse);
      if (response.statusCode == 200) {
        return ticketData;
      }
      return null;
    } catch (e) {
      log("ERROR: $e");
    }
    return null;
  }
}
