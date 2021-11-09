import 'dart:convert';

import 'package:http/http.dart';
import 'api_constants.dart';
import '../../utils/config.dart';

///
/// this class contains all the redundant code in each api call
///
class ApiClient {
    final Client _client;

    ApiClient(this._client);

    dynamic get(String path) async {
        final url = Uri.parse(
            '${ApiConstants.BASE_URL}$path?api_key=${Config.API_KEY}'
        );

        final response = await _client.get(
            url,
            headers: {
                'Content-Type': 'application/json',
            },
        );

        if (response.statusCode == 200) {
            return json.decode(response.body);
        } else {
            throw Exception(response.reasonPhrase);
        }
    }
}