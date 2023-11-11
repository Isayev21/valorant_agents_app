import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:valorant_app/constants/api_url.dart';
import 'package:valorant_app/models/agent.dart';

class ApiService {
  Future<AgentModel?> getAgents() async {
    try {
      var url = Uri.parse(ApiUrl.baseUrl + ApiUrl.agentsEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        AgentModel agent = agentModelFromJson(response.body);
        return agent;
      }
    } catch (e) {
      log(e.toString() as num);
    }
    return null;
  }
}
