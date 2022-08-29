// ignore_for_file: camel_case_types

import "dart:convert";
import 'dart:io';
// import "package:connectivity/connectivity.dart";
import 'package:covid_19_tracker/important_functions.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class DistrictCases extends StatefulWidget {
  static String cryptoUrlDistrictCases =
      'https://data.covid19india.org/state_district_wise.json';
  final String statecode;
  DistrictCases(this.statecode);
  @override
  _DistrictCasesState createState() => _DistrictCasesState(statecode);
}

class _DistrictCasesState extends State<DistrictCases> {
  _DistrictCasesState(this.statecode);
  final String statecode;
  var convertDataToJson;
  File? districtWiseCases;
  bool isOldData = false;
  // final List<MaterialAccentColor> _colors = [
  //   Colors.blueAccent,
  //   Colors.limeAccent,
  //   Colors.redAccent
  // ];
  bool isData = true;
  @override
  void initState() {
    super.initState();
    getconvertDataToJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.white
                : Colors.black,
        appBar: AppBar(
          title: Text("District wise cases"),
        ),
        body: Stack(
          children: [
            isData
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.redAccent,
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50.0),
                          Text(
                            "Kota Cases Overall",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(convertDataToJson["Rajasthan"]["districtData"]
                                  ["Kota"]
                              .toString()),
                          SizedBox(height: 20),
                          Text(
                            "Active Cases",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          Text(convertDataToJson["Rajasthan"]["districtData"]
                                  ["Kota"]["active"]
                              .toString()),
                          SizedBox(
                            height: 60,
                          ),
                          Text(
                            "Delta",
                            style: TextStyle(
                              color: Colors.amberAccent,
                            ),
                          ),
                          Text(convertDataToJson["Rajasthan"]["districtData"]
                                  ["Kota"]
                              .toString()),
                        ],
                      ),
                    ),
                  ),
            isOldData
                ? Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 1),
                        child: Text(
                          "Old Data",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            decoration: TextDecoration.overline,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(height: 0, width: 0),
          ],
        ));
  }

  void getconvertDataToJson() async {
    String cryptourl = DistrictCases.cryptoUrlDistrictCases;
    var importantFunctions = ImportantFunctions();
    districtWiseCases =
        await importantFunctions.localFile('district_wise_cases.json');
    bool filepresent = await districtWiseCases?.exists() ?? false;
    debugPrint(filepresent.toString());

    if (filepresent == false) {
      districtWiseCases = File(await importantFunctions.localPath(
          'district_wise_cases.json')); //? will create a new file everytime, we don't want that
    }
    var response;

    try {
      response = await http.get(Uri.parse(cryptourl),
          // parameters: {},
          headers: {
            "Accept": "application/json",
          });
      setState(() {
        if (response.statusCode == 200) {
          isOldData = false;
          convertDataToJson = json.decode(response.body);
          isData = false;
        }
      });
    } catch (e) {
      _showOldData();
    }

    // Future.delayed(Duration(seconds: 2), () {
    //   if (response.statusCode != 200) {}
    // });
    if (response != null) {
      if (response.statusCode == 200) {
        districtWiseCases
            ?.writeAsString(response.body); //? Writing to the file.
        //! debugPrint(await districtWiseCases?.readAsString().toString().substring(0, 200));
        debugPrint(convertDataToJson["Rajasthan"]['districtData']
                .toString()
                .substring(0, 200) +
            '...');
        debugPrint("successful writing the file");
      }
    }

    // isData = true;
  }

  void _showOldData() async {
    String covidFileContents = districtWiseCases?.readAsStringSync() ?? '';
    convertDataToJson = json.decode(covidFileContents);
    setState(() {
      isData = false;
      isOldData = true;
    });
  }
}
