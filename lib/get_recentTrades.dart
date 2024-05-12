import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecentTradesPage extends StatefulWidget {
  @override
  _RecentTradesPageState createState() => _RecentTradesPageState();
          static   String route ='/get-trades';

}

class _RecentTradesPageState extends State<RecentTradesPage> {
  String output = "Output will appear here";
  bool isLoading = false;
  TextEditingController limitController = TextEditingController();

  void fetchData(int limit) async {
    setState(() {
      isLoading = true;
    });

    var response = await http.post(
      Uri.parse('https://api.hive.blog'),
      body: '{"jsonrpc":"2.0", "method":"market_history_api.get_recent_trades", "params":{"limit":$limit}, "id":1}',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      setState(() {
        output = response.body;
        isLoading = false;
      });
    } else {
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
        title: Text("HIVE APPBASE API"),
        backgroundColor: Colors.red, // Red app bar color
      ),
      backgroundColor: Colors.black, // Black background color
      body: SingleChildScrollView(
        child: Padding(
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
                      "market_history_api.get_recent_trades",
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
                      "Returns the most recent trades for the internal HBD:HIVE market.",
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
                        'curl -s --data \'{"jsonrpc":"2.0", "method":"market_history_api.get_recent_trades", "params":{"limit":your_limit_here}, "id":1}\' https://api.hive.blog',
                        style: TextStyle(fontSize: 14, color: Colors.white), // White text color
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: limitController,
                  style: TextStyle(color: Colors.white), // White text color
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter Limit",
                    labelStyle: TextStyle(color: Colors.white), // White text color
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red), // Red border color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red), // Red border color
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  onPressed: () {
                    int? limit = int.tryParse(limitController.text);
                    if (limit != null) {
                      fetchData(limit);
                    } else {
                      // Handle invalid input
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Invalid Input"),
                          content: Text("Please enter a valid limit."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
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
              isLoading
                  ? Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red, // Red container background color
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black, // Black container background color
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red), // Red border color
                      ),
                      child: Text(
                        output,
                        style: TextStyle(color: Colors.white), // White text color
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}


