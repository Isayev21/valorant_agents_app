import 'package:flutter/material.dart';
import 'package:valorant_app/controller/api_service.dart';
import 'package:valorant_app/models/agent.dart';

class AgentsProvider extends ChangeNotifier {
  AgentModel? _agentModel;
  
  bool _isLoading = true;

  AgentModel? get agentModel => _agentModel;

  set setAgentModel(AgentModel? newAgent) {
    _agentModel = newAgent;
    notifyListeners();
  }

  bool get isLoading => _isLoading;


  void getData() async {

    final agentData = await ApiService().getAgents();
    if (agentData == null) {
      return;
    }
      _agentModel = agentData;
      _isLoading = false;
      notifyListeners();
    
  }


}
