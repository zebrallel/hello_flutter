import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/components/layout.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class FontDynamicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FontDynamicPageState();
  }
}

class _FontDynamicPageState extends State<FontDynamicPage> {
  Future<ByteData> fetchFontFromNetwork() async {
    final response = await http.get(
        'https://raw.githubusercontent.com/google/fonts/master/ofl/montserrat/Montserrat-Light.ttf');

    if (response.statusCode == 200) {
      return ByteData.view(response.bodyBytes.buffer);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load font');
    }
  }

  Future<ByteData> fetchFontFromFile() async {
    final file = File(
        '/Users/xuejianxu/matt/flutter/projects/hello_world/assets/fonts/ml.ttf');
    final List<int> bytes = await file.readAsBytes();
    final uint8List = Uint8List.fromList(bytes);

    return ByteData.view(uint8List.buffer);
  }

  Future<void> loadFont() async {
    var fontLoader = FontLoader('abc');
    // fontLoader.addFont(fetchFontFromNetwork());
    fontLoader.addFont(fetchFontFromFile());
    await fontLoader.load();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // loadFont();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        padding: 10,
        child: Column(children: [
          Text('this is a test line'),
          Text(
            'Montserrat is displayed here',
            style: TextStyle(fontFamily: 'abc'),
          )
        ]));
  }
}
