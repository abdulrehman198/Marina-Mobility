import 'package:flutter/material.dart';
import 'package:marina_mobility/domain/repository/VesselRepo.dart';

import '../../data/response/ApiResponse.dart';
import 'VesseleListModel.dart';

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
