import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _isLogin = false;

  void login() {
    setState(() {
      _isLogin = true;
    });
  }

  void logout() {
    setState(() {
      _isLogin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cache Sample'),
          actions: [
            InkWell(
              onTap: () {
                _isLogin ? logout() : login();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(_isLogin ? 'Sign-in' : 'Sign-out'),
                ),
              ),
            ),
          ],
        ),
        body: CachableCounter(),
      ),
    );
  }
}

class CachableCounter extends StatefulWidget {
  @override
  _CachableCounterState createState() => _CachableCounterState();
}

class _CachableCounterState extends State<CachableCounter> {
  Widget _cache;
  var _buildCount = 0;

  @override
  Widget build(BuildContext context) {
    if (_cache != null) {
      return _cache;
    }

    _buildCount++;

    return _cache = Center(
      child: Text(
        'Number of build => $_buildCount',
      ),
    );
  }
}
