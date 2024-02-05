import '../model/back4app_model.dart';
import 'package:dio/dio.dart';
import 'back4app_custom_dio.dart';

class Back4AppRepository {
  final _customDio = Back4AppCustomDio();

  Back4AppRepository();

  Future<Back4AppModel> obterCeps() async {
    var response = await _customDio.dio.get("/DioBuscaCep");
    return Back4AppModel.fromJson(response.data);
  }

  Future<void> adicionarCep(Results results) async {
    try {
      var response = await _customDio.dio
          .post("/DioBuscaCep", data: results.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> removerCep(String objectId) async {
    try {
      var response = await _customDio.dio.delete("/DioBuscaCep/$objectId");
    } catch (e) {
      throw e;
    }
  }
}
