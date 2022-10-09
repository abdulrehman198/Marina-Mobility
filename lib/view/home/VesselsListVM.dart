import 'package:flutter/material.dart';

import '../../data/remote/ApiResponse.dart';
import '../../data/remote/VesselRepo.dart';
import '../../model/home/VesseleListModel.dart';

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
