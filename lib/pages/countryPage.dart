import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countrydata;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countrydata = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Stats'),
      ),
      body: countrydata == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey[100],
                        blurRadius: 10,
                        offset: Offset(0, 10)),
                  ]),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              countrydata[index]['country'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                              countrydata[index]['countryInfo']['flag'],
                              height: 40,
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text('CONFIRMED:' + countrydata[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 12),),
                              Text('ACTIVE:' + countrydata[index]['active'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                              Text('RECOVERED:' + countrydata[index]['recovered'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),),
                              Text('DEATHS:' + countrydata[index]['deaths'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: countrydata == null ? 0 : countrydata.length,
            ),
    );
  }
}
