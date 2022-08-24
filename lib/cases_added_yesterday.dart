import "dart:convert";
import 'dart:io';
// import "package:connectivity/connectivity.dart";
import 'package:covid_19_tracker/important_functions.dart';
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:http/http.dart" as http;

class CasesAddedYesterday extends StatefulWidget {
  static String cryptourlCasesAddedYesterday =
      'https://data.covid19india.org/states_daily.json';
  @override
  _CasesAddedYesterdayState createState() => _CasesAddedYesterdayState();
}

class _CasesAddedYesterdayState extends State<CasesAddedYesterday> {
  var convertDataToJson;
  bool isData = true;
  File? casesAddedYesterday;
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
          title: Text("Cases added yesterday!"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    isData = true;
                  });
                  getconvertDataToJson();
                })
          ],
        ),
        body: isData
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("TT"),
                      ),
                      title: Text("Total"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["tt"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("AN"),
                      ),
                      title: Text("Andaman and Nicobar Islands"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["an"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("AP"),
                      ),
                      title: Text("Arunachal Pradesh"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["ap"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("AR"),
                      ),
                      title: Text("Arunachal Pradesh"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["ar"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("AS"),
                      ),
                      title: Text("Assam"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["ar"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("BR"),
                      ),
                      title: Text("Bihar"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["br"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("CH"),
                      ),
                      title: Text("Chandigarh"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["ch"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("CT"),
                      ),
                      title: Text("Chhattisgarh"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["ct"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("DD"),
                      ),
                      title: Text("Daman and Diu"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["dd"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("DL"),
                      ),
                      title: Text("Delhi"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["dl"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("DN"),
                      ),
                      title: Text("Dadra and Nagar Haveli"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["dn"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("GA"),
                      ),
                      title: Text("Goa"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["ga"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("GJ"),
                      ),
                      title: Text("Gujarat"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["gj"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("HP"),
                      ),
                      title: Text("Himachal Pradesh"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["hp"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("HR"),
                      ),
                      title: Text("Haryana"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["hr"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("JH"),
                      ),
                      title: Text("Jharkhand"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["jh"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("JK"),
                      ),
                      title: Text("Jammu and Kashmir"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["jk"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("KA"),
                      ),
                      title: Text("Karnataka"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["ka"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("KL"),
                      ),
                      title: Text("Kerala"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["kl"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("LA"),
                      ),
                      title: Text("Ladakh"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["la"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("LD"),
                      ),
                      title: Text("Lakshadweep"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["ld"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("MH"),
                      ),
                      title: Text("Maharashtra"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["mh"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("ML"),
                      ),
                      title: Text("Meghalaya"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["ml"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("MN"),
                      ),
                      title: Text("Manipur"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["mp"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("MZ"),
                      ),
                      title: Text("Mizoram"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["mz"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("NL"),
                      ),
                      title: Text("Nagaland"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["nl"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("OR"),
                      ),
                      title: Text("Odisha"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["or"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("PB"),
                      ),
                      title: Text("Punjab"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["pb"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("PY"),
                      ),
                      title: Text("Puducherry"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["py"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("RJ"),
                      ),
                      title: Text("Rajasthan"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["rj"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("SK"),
                      ),
                      title: Text("Sikkim"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["sk"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("TG"),
                      ),
                      title: Text("Telangana"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["tg"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("TN"),
                      ),
                      title: Text("Tamil Nadu"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["tn"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("TR"),
                      ),
                      title: Text("Tripura"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["tr"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("UP"),
                      ),
                      title: Text("Uttar Pradesh"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["up"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("UT"),
                      ),
                      title: Text("Uttarakhand"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["ut"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 23,
                        // backgroundColor: if(),
                        child: Text("WB"),
                      ),
                      title: Text("West Bengal"),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: (convertDataToJson["states_daily"][
                                        (convertDataToJson["states_daily"]
                                                .length) -
                                            3]["wb"]
                                    .toString()),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }

  void getconvertDataToJson() async {
    String cryptourl = CasesAddedYesterday.cryptourlCasesAddedYesterday;
    var importantFunctions = ImportantFunctions();
    casesAddedYesterday =
        await importantFunctions.localFile('cases_added_yesterday.json');
    bool? filepresent = await casesAddedYesterday?.exists();
    debugPrint(filepresent.toString());

    if (filepresent == false) {
      casesAddedYesterday = File(await importantFunctions.localPath(
          'cases_added_yesterday.json')); //? will create a new file everytime, we don't want that
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
          convertDataToJson = json.decode(response.body);
          isData = false;
        }
      });
    } catch (e) {
      _showAlertBox(context);
    }
    if (response != null) {
      if (response.statusCode == 200) {
        casesAddedYesterday
            ?.writeAsString(response.body); //? Writing to the file.
        // debugPrint(await casesAddedYesterday?.readAsString());
        debugPrint("successful writing the file");
      }
    }
    // Future.delayed(Duration(seconds: 2), () {
    //   if (response.statusCode != 200) {}
    // });
    // print(convertDataToJson.toString());
    print("successful");
    // isData = true;
  }

  void _showOldData() async {
    String covidFileContents = casesAddedYesterday?.readAsStringSync() ?? '';
    convertDataToJson = json.decode(covidFileContents);
    setState(() {
      isData = false;
    });
  }

  void _showAlertBox(context) async {
    bool? result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Unable to fetch data!"),
          content:
              Text("Please check your internet connection andj try again."),
          actions: <Widget>[
            TextButton(
                onPressed: () => SystemNavigator.pop(), child: Text("OK")),
            TextButton(
                onPressed: () {
                  _showOldData();
                  Navigator.pop(context);
                },
                child: Text('Show Old Data!'))
          ],
        );
      },
    );
    print(result);
    if (result == false || result == null) {
      _showOldData();
    }
  }
}
