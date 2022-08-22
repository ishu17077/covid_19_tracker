import "dart:convert";
// import "package:connectivity/connectivity.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:http/http.dart" as http;

class District_Cases extends StatefulWidget {
  final String statecode;
  District_Cases(this.statecode);
  @override
  _District_CasesState createState() => _District_CasesState(statecode);
}

class _District_CasesState extends State<District_Cases> {
  _District_CasesState(this.statecode);
  final String statecode;
  var convertDataToJson;
  final List<MaterialAccentColor> _colors = [
    Colors.blueAccent,
    Colors.limeAccent,
    Colors.redAccent
  ];
  bool isData = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getconvertDataToJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("District wise cases"),
        ),
        body: isData
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
                      Text(convertDataToJson["Rajasthan"]["districtData"]["Kota"]
                          .toString()),
                    ],
                  ),
                ),
              ));
  }

  void getconvertDataToJson() async {
    String cryptourl = "https://data.covid19india.org/state_district_wise.json";

    var response;

    try {
      response = await http.get(Uri.parse(cryptourl),
          // parameters: {},
          headers: {
            "Accept": "application/json",
            // "X-CMC_PRO_API_KEY": "36eb5338-d84d-45b6-930d-2c73544d242e",
          });
    } catch (e) {
      _showAlertBox(context);
    }
    setState(() {
      if (response.statusCode == 200) {
        convertDataToJson = json.decode(response.body);
        isData = false;
      }
    });
    // Future.delayed(Duration(seconds: 2), () {
    //   if (response.statusCode != 200) {}
    // });
    debugPrint(convertDataToJson["Rajasthan"]['districtData'].toString());
    debugPrint("successful");
    // isData = true;
  }
}

void _showAlertBox(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Unable to fetch data!"),
        content: Text("Please check your internet connection and try again."),
        actions: <Widget>[
          TextButton(onPressed: () => SystemNavigator.pop(), child: Text("OK"))
        ],
      );
    },
  );
}
