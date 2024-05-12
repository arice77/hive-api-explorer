import 'package:flutter/material.dart';
import 'package:h_dapp/account_by_key.dart';
import 'package:h_dapp/broadcast_transaction.dart';
import 'package:h_dapp/get_account.dart';
import 'package:h_dapp/get_accoutn_history.dart';
import 'package:h_dapp/get_block.dart';
import 'package:h_dapp/get_recentTrades.dart';
import 'package:h_dapp/market_vokume.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HIVE Appbase API',
      theme: ThemeData(
        primarySwatch: Colors.red, 
        scaffoldBackgroundColor: Colors.black, 
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red, 
          foregroundColor: Colors.white, 
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(color: Colors.white), 
            backgroundColor: Colors.red, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), 
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
          ),
        ),
      ),     routes: {
        HiveAPIPage.route: (context) => HiveAPIPage(),
        AccountHistoryPage.route: (context) => AccountHistoryPage(),
        AccountByKeyPage.route: (context) => AccountByKeyPage(),
        BlockPage.route:(context)=>BlockPage(),
        RecentTradesPage.route:(context)=>RecentTradesPage(),
        MarketVolumePage.route:(context)=>MarketVolumePage(),
        BroadcastTransactionPage.route:(context)=>BroadcastTransactionPage(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HIVE Appbase API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, HiveAPIPage.route),
              child: Text("Get Account"),
              style: ElevatedButton.styleFrom(
                elevation: 8, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.red), 
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
                backgroundColor: Colors.red, 
                foregroundColor: Colors.white, 
                shadowColor: Colors.red, 
                minimumSize: Size(200, 50),
                textStyle: TextStyle(fontSize: 18), 
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.red.withOpacity(0.4)), 
              ),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AccountHistoryPage.route),
              child: Text("Get Account History"),
              style: ElevatedButton.styleFrom(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), 
                  side: BorderSide(color: Colors.red), 
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
                backgroundColor: Colors.red, 
                foregroundColor: Colors.white, 
                shadowColor: Colors.red, 
                minimumSize: Size(200, 50), 
                textStyle: TextStyle(fontSize: 18), 
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.red.withOpacity(0.4)), 
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AccountByKeyPage.route),
              child: Text("Get Account by Key"),
              style: ElevatedButton.styleFrom(
                elevation: 8, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), 
                  side: BorderSide(color: Colors.red), 
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
                backgroundColor: Colors.red, 
                foregroundColor: Colors.white, 
                shadowColor: Colors.red, 
                minimumSize: Size(200, 50), 
                textStyle: TextStyle(fontSize: 18),
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.red.withOpacity(0.4)), 
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, BlockPage.route),
              child: Text("Get Block"),
              style: ElevatedButton.styleFrom(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), 
                  side: BorderSide(color: Colors.red), 
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
                backgroundColor: Colors.red, 
                foregroundColor: Colors.white, 
                shadowColor: Colors.red, 
                minimumSize: Size(200, 50), 
                textStyle: TextStyle(fontSize: 18), 
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.red.withOpacity(0.4)),
              ),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, RecentTradesPage.route),
              child: Text("Get Recent Trades"),
              style: ElevatedButton.styleFrom(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), 
                  side: BorderSide(color: Colors.red), 
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
                backgroundColor: Colors.red, 
                foregroundColor: Colors.white, 
                shadowColor: Colors.red, 
                minimumSize: Size(200, 50), 
                textStyle: TextStyle(fontSize: 18), 
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.red.withOpacity(0.4)), 
              ),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, MarketVolumePage.route),
              child: Text("Get Market Volume"),
              style: ElevatedButton.styleFrom(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), 
                  side: BorderSide(color: Colors.red), 
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
                backgroundColor: Colors.red, 
                foregroundColor: Colors.white, 
                shadowColor: Colors.red, 
                minimumSize: Size(200, 50), 
                textStyle: TextStyle(fontSize: 18), 
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.red.withOpacity(0.4)), 
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, BroadcastTransactionPage.route),
              child: Text("Braodcast Transaction"),
              style: ElevatedButton.styleFrom(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), 
                  side: BorderSide(color: Colors.red), 
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
                backgroundColor: Colors.red, 
                foregroundColor: Colors.white, 
                shadowColor: Colors.red, 
                minimumSize: Size(200, 50), 
                textStyle: TextStyle(fontSize: 18), 
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.red.withOpacity(0.4)), 
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
