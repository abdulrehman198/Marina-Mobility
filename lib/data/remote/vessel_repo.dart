import 'package:marina_mobility/data/remote/service.dart';
import 'BaseService.dart';
import 'EndPoints.dart';
import '../../model/home/VesseleListModel.dart';

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
