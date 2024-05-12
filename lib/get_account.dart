import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HiveAPIPage extends StatefulWidget {
  @override
  _HiveAPIPageState createState() => _HiveAPIPageState();
    static   String route ='/get-account';

}

class _HiveAPIPageState extends State<HiveAPIPage> {
  String output = "Output will appear here";
  bool isLoading = false;

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    // Make HTTP request
    var response = await http.post(
      Uri.parse('https://api.hive.blog'),
      body: '{"jsonrpc":"2.0", "method":"condenser_api.get_account_count", "params":[], "id":1}',
      headers: {'Content-Type': 'application/json'},
    );

    // Check if request was successful
    if (response.statusCode == 200) {
      // Update output with response data
      setState(() {
        output = response.body;
        isLoading = false;
      });
    } else {
      // Handle error
      print('Failed to fetch data: ${response.statusCode}');
      setState(() {
        output = "Failed to fetch data";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Blockchain API"),
        backgroundColor: Colors.red, // Red app bar color
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black, // Black background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "API Name:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), // White text color
                  ),
                  Text(
                    "condenser_api.get_account_count",
                    style: TextStyle(fontSize: 16, color: Colors.white), // White text color
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "API Description:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), // White text color
                  ),
                  Text(
                    "This API method retrieves the total number of accounts on the Hive blockchain.",
                    style: TextStyle(fontSize: 16, color: Colors.white), // White text color
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "API's cURL Command:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), // White text color
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black, // Black container background color
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red), // Red border color
                    ),
                    child: Text(
                      "curl -s --data '{\"jsonrpc\":\"2.0\", \"method\":\"condenser_api.get_account_count\", \"params\":[], \"id\":1}' https://api.hive.blog",
                      style: TextStyle(fontSize: 14, color: Colors.white), // White text color
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                onPressed: () {
                  fetchData();
                },
                child: Text(
                  "Run",
                  style: TextStyle(color: Colors.white), // White text color
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Red button color
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Output:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), // White text color
                  ),
                  isLoading
                      ?  CircularProgressIndicator(color: Colors.red,)
                        
                      : Container(decoration: BoxDecoration(border: Border.all(color: Colors.red,),borderRadius: BorderRadius.circular(8)),
                        child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              
                            ),
                            color: Colors.black, // Black card background color
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                output,
                                style: TextStyle(color: Colors.white), // White text color
                              ),
                            ),
                          ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}