import 'package:http/http.dart' as http;
import 'study.dart';
import 'dart:convert';
import 'package:deep_pick/deep_pick.dart';

class RemoteServiceSingle {
  Future<StudyGrassroots?> getPosts() async {
    var client = http.Client();
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    //String studyID = '60c1c8ae02700f56d34868fd'; // WGIN 2013
    String studyID = '5dd8009cde68e75a053b66b8'; // Paragon x Watkins 487/88/89

    var data =
        '{"services": [{"so:name": "Search Field Trials","start_service": true,"parameter_set": {"level": "advanced","parameters": [{"param": "ST Id","current_value": "' +
            studyID +
            '"}, {"param": "Get all Plots for Study","current_value": true}, {"param": "ST Search Studies","current_value": true}]}}]}';

    var uri = Uri.parse('https://grassroots.tools/public_backend');
    //var uri = Uri.parse('http://localhost:2000/grassroots/public_backend');

    //var response = await http.post(uri, headers: headers, body: data);
    var response = await client.post(uri, headers: headers, body: data);

    if (response.statusCode == 200) {
      var json = response.body; //json body is a string

      final jsonDecoded = jsonDecode(json); //json decoded as Hashmap
      String? st =
          pick(jsonDecoded, 'results', 0, 'results', 0, 'data', 'so:name')
              .asStringOrNull();
      st = pick(jsonDecoded, 'results', 0, 'results', 0, 'data',
              'treatment_factors', 0, 'treatment', 'so:name')
          .asStringOrNull();

      print('(test) Treatment factor name: $st');

      final objectJson = studyGrassrootsFromJson(json); //return study object
      //print(objectJson.runtimeType); // grassroots study
      return objectJson;
    }
  }
}
