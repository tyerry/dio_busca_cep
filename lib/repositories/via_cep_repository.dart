import '../model/via_cep_model.dart';
import 'package:dio/dio.dart';

class ViaCepRepository {
  Future<ViaCepModel> consultarCep(String cep) async {
    var dio = Dio();
    var response = await dio.get("https://viacep.com.br/ws/$cep/json/");
    if (response.statusCode == 200) {
      return ViaCepModel.fromJson(response.data);
    } else {
      return ViaCepModel();
    }
  }
}
