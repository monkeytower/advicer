import 'package:advicer/domain/entities/advice_Entity.dart';
import 'package:advicer/infrastructure/exceptions/exceptions.dart';
import 'package:advicer/infrastructure/models/advice_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class AdvicerRemoteDatasource {
  /// requests random advice from free api
  /// throws a server-Exception if response code is not 200
  Future<AdviceEntity> getRandomAdviceFromApi();
}

class AdvicerRemoteDatasourceImpl implements AdvicerRemoteDatasource {
  final http.Client client = http.Client();

  // AdvicerRemoteDatasourceImpl({required this.client});

  @override
  Future<AdviceEntity> getRandomAdviceFromApi() async {
    final response = await client
        .get(Uri.parse('https://api.adviceslip.com/advice'), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);

      return AdviceModel.fromJson(responseBody["slip"]);
    }
// try {
//   if (response.statusCode == 200) {
//     return AdviceModel.fromJson(responseBody["slip"]);
//   } else {
//     throw ServerException();
//   }

// } catch (e) {
//   throw ServerException();
    // }
  }
  // TODO: implement data source
  // throw UnimplementedError();
}
