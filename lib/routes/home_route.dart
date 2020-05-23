import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:twitter_1user/twitter_1user.dart';
import '../header.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final String screenName = 'ホーム';
  String _timelineData = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final String apiKey = 'WRDtEd2SC28QukDT93hBwsYH4';
    final String apiSecret =
        'UYxwK41Kog3sukKL4hYcmY8Hcc5wN2eUnyO44VnYPsUTKwi8KI';
    final String accessToken =
        '1187212857974218754-io8QWvTZNJC4p9X0ySUO992d3wZRNb';
    final String accessSecret = 'n0hK7fmNwKF5Md0VpodIKvPeQ3x6go1sKhmK6XeazZWAI';

    final String userTimelinePath = 'statuses/home_timeline.json';

    Twitter twitter = new Twitter(apiKey, apiSecret, accessToken, accessSecret);

    final res = jsonDecode(
        await twitter.request('GET', userTimelinePath, {'count': '30'}));
    setState(() {
      for (int i = 0; i < res.length; i++) {
        _timelineData += res[i]['text'] + '\n'; // textだけ取得
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        headerTitle: screenName,
      ),
      body: Center(child: Text(_timelineData)),
    );
  }
}
