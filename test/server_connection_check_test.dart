import 'dart:convert';
import 'package:covid_19_tracker/cases_added_yesterday.dart';
import 'package:covid_19_tracker/district_wise_cases.dart';
import 'package:covid_19_tracker/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  String cryptoURLHomePage = '';
  String cryptoURLCasesAddedYesterday = '';
  String cryptoURLDistrictWiseCases = '';
  setUp(() async {
    cryptoURLHomePage = HomePage.cryptourlHomePage;
    cryptoURLCasesAddedYesterday =
        CasesAddedYesterday.cryptourlCasesAddedYesterday;
    cryptoURLDistrictWiseCases = DistrictCases.cryptoUrlDistrictCases;
  });
  test('Checking for internet connection', () async {
    http.Response response = await http.get(
      Uri.parse('https://www.google.com'),
      headers: {"Accept": "application/json"},
    );
    print(response.body);
    expectLater(response.statusCode, 200);
  });
  test(
      'Checking for server status and getting a dynamic JSON for home_page.dart',
      () async {
    http.Response response =
        await http.get(Uri.parse(cryptoURLHomePage), headers: {
      "Accept": "application/json",
    });

    if (response.statusCode == 200) {
      print('Connected successfully to: ' + cryptoURLHomePage);
    }
    var jsonFormat = json.decode(response.body);
    print(jsonFormat.toString());
    expect(jsonFormat['statewise'], isNotNull);
  });
  test('Getting a JSON for cases_added_yesterday.dart', () async {
    http.Response response =
        await http.get(Uri.parse(cryptoURLCasesAddedYesterday), headers: {
      "Accept": "application/json",
    });

    if (response.statusCode == 200) {
      print('Connected successfully to: ' + cryptoURLCasesAddedYesterday);
    }
    var jsonFormat = json.decode(response.body);
    print(jsonFormat.toString());
    expect(jsonFormat['states_daily'], isNotNull);
  });
  test('Getting a dynamic JSON for district_wise_cases.dart', () async {
    http.Response response =
        await http.get(Uri.parse(cryptoURLDistrictWiseCases), headers: {
      "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      print('Connected successfully to: ' + cryptoURLCasesAddedYesterday);
    }
    var jsonFormat = json.decode(response.body);
    print(jsonFormat.toString());
    expect(jsonFormat['Rajasthan'], isNotNull);
  });
}
