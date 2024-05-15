import 'dart:convert';

import 'package:ngekos/env/constants/open_ai.dart';
import 'package:ngekos/models/open_ai.dart';
import 'package:ngekos/models/usege.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<GptData> getRecommendations({
    required String carRegion,
    required String budget,
  }) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(completionTokens: 0, promptTokens: 0, totalTokens: 0),
    );

    // other codes…
    try {
      var url = Uri.parse('https://api.openai.com/v1/chat/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey',
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'IDR ',
        decimalDigits: 0,
      );

      String carBudget = formatCurrency.format(int.parse(budget));

      final data = jsonEncode(
        {
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": "You are a car expert."},
            {
              "role": "system",
              "content":
                  "Please give me a car recommendation from ${carRegion.toLowerCase()} manufacturers with budget equals to $carBudget."
            },
          ],
          "max_tokens": 200,
        },
      );

      var response = await http.post(url, headers: headers, body: data);
      print("ini merupakan hasil dari service recomendation_service.dart");
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Error occured when sending request.');
    }

    return gptData;
  }
}
