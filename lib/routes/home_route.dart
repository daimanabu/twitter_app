import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../header.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final String screenName = 'ホーム';
  String _data = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final res =
        await http.get('https://api.github.com/repositories/31792824/issues');
    setState(() {
      _data = res.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        headerTitle: screenName,
      ),
      body: Center(child: Text(_data)),
    );
  }
}
