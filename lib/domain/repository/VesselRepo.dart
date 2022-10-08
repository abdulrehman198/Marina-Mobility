import 'package:marina_mobility/data/network/service.dart';
import '../../data/network/BaseService.dart';
import '../../data/network/EndPoints.dart';
import '../../presentation/home/VesseleListModel.dart';

class VesselRepo {
  final BaseService _apiService = Service();

  Future<VesseleListModel> getVesselList() async {
    try {
      dynamic response = await _apiService.getResponse(EndPoints().getVesseles);
      final jsonData = VesseleListModel.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
    }
  }
}
