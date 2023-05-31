import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.bluetooth,
                  size: 40,
                ),
                Text(
                  'Guy\'s BT Exp.',
                ),
                Icon(Icons.home, size: 40),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[800]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Search Devices',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[800]),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Auto Detect',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/auto');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
