import 'package:flutter/material.dart';

import '../../data/remote/api_response.dart';
import '../../data/remote/vessel_repo.dart';
import '../../model/home/vessele_list_model.dart';

class VesselsListVM extends ChangeNotifier {
  final _myRepo = VesselRepo();

  ApiResponse<VesseleListModel> vesselList = ApiResponse.loading();

  void _setVesselList(ApiResponse<VesseleListModel> response) {
    vesselList = response;
    notifyListeners();
  }

  Future<void> fetchVessels() async {
    _setVesselList(ApiResponse.loading());
    _myRepo
        .getVesselList()
        .then((value) => _setVesselList(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setVesselList(ApiResponse.error(error.toString())));
  }
}
