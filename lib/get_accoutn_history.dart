import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccountHistoryPage extends StatefulWidget {
  @override
  _AccountHistoryPageState createState() => _AccountHistoryPageState();
      static   String route ='/get-account-history';

}

class _AccountHistoryPageState extends State<AccountHistoryPage> {
  String output = "Output will appear here";
  bool isLoading = false;
  TextEditingController accountController = TextEditingController();

  void fetchData(String account) async {
    setState(() {
      isLoading = true;
    });

    // Make HTTP request
    var response = await http.post(
      Uri.parse('https://api.hive.blog'),
      body: '{"jsonrpc":"2.0", "method":"condenser_api.get_account_history", "params":["$account", 1000, 1000], "id":1}',
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
        title: Text("HIVE APPBASE API"),
        backgroundColor: Colors.red, // Red app bar color
      ),
      backgroundColor: Colors.black, // Black background color
      body: SingleChildScrollView(
        child: Container(height: 700,
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
                        "condenser_api.get_account_history",
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
                        "Returns a history of all operations for a given account.",
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
                          "curl -s --data '{\"jsonrpc\":\"2.0\", \"method\":\"condenser_api.get_account_history\", \"params\":[\"account_name\", -1, 1000, 0, 0], \"id\":1}' https://api.hive.blog",
                          style: TextStyle(fontSize: 14, color: Colors.white), // White text color
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: accountController,
                    style: TextStyle(color: Colors.white), // White text color
                    decoration: InputDecoration(
                      labelText: "Enter Account Name",
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
                      fetchData(accountController.text);
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
                    : SingleChildScrollView(
                      child: Container(height: 150,width: double.infinity,
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
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

