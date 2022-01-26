library pretty_json;

import 'package:flutter/material.dart';
import 'dart:convert';

late int _globalTabLength;

late Color _globalCommaColor;

late Color _globalKeyColor;

late Color _globalColonColor;

class PrettyJson extends StatelessWidget {
  PrettyJson({
    Key? key,
    required this.data,
    this.backgroundColor = Colors.transparent,
    this.stringColor = Colors.green,
    this.nullColor = Colors.red,
    this.intColor = Colors.purple,
    this.boolColor = Colors.pink,
    this.doubleColor = Colors.deepPurple,
    this.curlyBracketColor = Colors.black,
    this.squareBracketColor = Colors.black,
    this.textStyle = const TextStyle(),
    this.talL = 4,
    this.keyColor = Colors.blue,
    this.commaColor = Colors.black,
    this.colonColor = Colors.deepPurple,
  }) : super(key: key) {
    _globalTabLength = talL;
    _globalCommaColor = commaColor;
    _globalColonColor = colonColor;
    _globalKeyColor = keyColor;
  }

  /// Json String
  final String data;

  /// Background color of the Widget
  final Color backgroundColor;

  /// Color of value of type [String]
  final Color stringColor;

  /// Color of value of type null
  final Color nullColor;

  /// Color of value of type [int]
  final Color intColor;

  /// Color of value of type [bool]
  final Color boolColor;

  /// Color of value of type [double]
  final Color doubleColor;

  /// Color of Curly brackets
  final Color curlyBracketColor;

  /// Color of Curly brackets
  final Color squareBracketColor;

  /// Textstyle of parsed json data
  final TextStyle textStyle;

  /// Tab length in spaces, default to 4
  final int talL;

  /// Color of Json Color Key
  final Color keyColor;

  /// Color of comma
  final Color commaColor;

  /// Color of color
  final Color colonColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      textStyle: textStyle,
      child: _prettyView(
        jsonString: data,
        indent: 0,
      ),
    );
  }

  Widget _prettyView({
    required String jsonString,
    required int indent,
  }) {
    final decodedData = jsonDecode(jsonString);
    if (decodedData is Map) {
      return _parseMap(
        data: decodedData,
        indent: indent,
        showComma: false,
      );
    } else if (decodedData is List) {
      return _parseList(
        data: decodedData,
        indent: indent,
        showComma: false,
      );
    } else {
      throw 'Not Correct type only List or Map allowed';
    }
  }

  Widget _parseMap({
    required Map data,
    required int indent,
    required bool showComma,
    String? jkey,
  }) {
    if (data.entries.isEmpty) {
      if (jkey != null) {
        return _KeyValueWidget(
          indent: indent,
          jsonKey: jkey,
          jsonValue: '{}',
          valueColor: curlyBracketColor,
          showComma: showComma,
        );
      } else {
        return Text(
          '{}',
          style: TextStyle(color: curlyBracketColor),
        );
      }
    } else {
      final wigs = <Widget>[];

      if (jkey == null) {
        wigs.add(Text('${_spaces(indent)}{',
            style: TextStyle(color: curlyBracketColor)));
      } else {
        wigs.add(_KeyValueWidget(
          indent: indent,
          jsonKey: jkey,
          jsonValue: '{',
          valueColor: curlyBracketColor,
          showComma: false,
        ));
      }

      final int newIndent = indent + 1;

      for (int i = 0; i < data.entries.length; i++) {
        final jKey = data.entries.toList()[i].key;
        final value = data.entries.toList()[i].value;

        final bool showComma = i != data.entries.length - 1;

        if (value is String) {
          wigs.add(
            _KeyValueWidget(
                indent: newIndent,
                jsonKey: jKey,
                jsonValue: '"$value"',
                valueColor: stringColor,
                showComma: showComma),
          );
        } else if (value is int) {
          wigs.add(
            _KeyValueWidget(
                indent: newIndent,
                jsonKey: jKey,
                jsonValue: value.toString(),
                valueColor: intColor,
                showComma: showComma),
          );
        } else if (value is double) {
          wigs.add(
            _KeyValueWidget(
              indent: newIndent,
              jsonKey: jKey,
              jsonValue: value.toString(),
              valueColor: doubleColor,
              showComma: showComma,
            ),
          );
        } else if (value is bool) {
          wigs.add(
            _KeyValueWidget(
              indent: newIndent,
              jsonKey: jKey,
              jsonValue: value.toString(),
              valueColor: boolColor,
              showComma: showComma,
            ),
          );
        } else if (value is List) {
          wigs.add(_parseList(
            data: value,
            indent: newIndent,
            jkey: jKey,
            showComma: showComma,
          ));
        } else if (value is Map) {
          wigs.add(_parseMap(
            data: (value),
            indent: newIndent,
            jkey: jKey,
            showComma: showComma,
          ));
        } else if (value == null) {
          wigs.add(
            _KeyValueWidget(
              indent: newIndent,
              jsonKey: jKey,
              jsonValue: 'null',
              valueColor: nullColor,
              showComma: showComma,
            ),
          );
        }
      }
      wigs.add(Text.rich(TextSpan(children: [
        TextSpan(text: _spaces(indent)),
        TextSpan(text: '}', style: TextStyle(color: curlyBracketColor)),
        if (showComma)
          TextSpan(text: ',', style: TextStyle(color: _globalCommaColor))
      ])));

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: wigs,
      );
    }
  }

  Widget _parseList({
    required List<dynamic> data,
    required int indent,
    required bool showComma,
    String? jkey,
  }) {
    if (data.isEmpty) {
      if (jkey != null) {
        return _KeyValueWidget(
          indent: indent,
          jsonKey: jkey,
          jsonValue: '[]',
          valueColor: squareBracketColor,
          showComma: showComma,
        );
      } else {
        return Text('[]', style: TextStyle(color: squareBracketColor));
      }
    } else {
      final wigs = <Widget>[];

      if (jkey == null) {
        wigs.add(Text('${_spaces(indent)}[',
            style: TextStyle(color: squareBracketColor)));
      } else {
        wigs.add(_KeyValueWidget(
          indent: indent,
          jsonKey: jkey,
          jsonValue: '[',
          valueColor: squareBracketColor,
          showComma: false,
        ));
      }

      final int newIndent = indent + 1;

      for (int j = 0; j < data.length; j++) {
        final i = data[j];
        final showComma = j != data.length - 1;

        if (i is String) {
          wigs.add(_KeyValueWidget(
            indent: newIndent,
            jsonValue: '"$i"',
            valueColor: stringColor,
            showComma: showComma,
          ));
        } else if (i is int) {
          wigs.add(_KeyValueWidget(
            indent: newIndent,
            jsonValue: i.toString(),
            valueColor: intColor,
            showComma: showComma,
          ));
        } else if (i is double) {
          wigs.add(_KeyValueWidget(
            indent: newIndent,
            jsonValue: i.toString(),
            valueColor: doubleColor,
            showComma: showComma,
          ));
        } else if (i is bool) {
          wigs.add(_KeyValueWidget(
            indent: newIndent,
            jsonValue: i.toString(),
            valueColor: boolColor,
            showComma: showComma,
          ));
        } else if (i is List) {
          wigs.add(_parseList(
            data: i,
            indent: newIndent,
            showComma: showComma,
          ));
        } else if (i is Map) {
          wigs.add(_parseMap(
              data: i as Map<String, dynamic>,
              indent: newIndent,
              showComma: showComma));
        } else if (i == null) {
          wigs.add(_KeyValueWidget(
            indent: newIndent,
            jsonValue: 'null',
            valueColor: nullColor,
            showComma: showComma,
          ));
        }
      }

      wigs.add(Text.rich(TextSpan(children: [
        TextSpan(text: _spaces(indent)),
        TextSpan(text: ']', style: TextStyle(color: squareBracketColor)),
        if (showComma)
          TextSpan(text: ',', style: TextStyle(color: _globalCommaColor))
      ])));

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: wigs,
      );
    }
  }
}

class _KeyValueWidget extends StatelessWidget {
  _KeyValueWidget({
    Key? key,
    required this.indent,
    this.jsonKey,
    required this.jsonValue,
    required this.valueColor,
    required this.showComma,
  }) : super(key: key);

  final int indent;
  final String? jsonKey;
  final String jsonValue;
  final Color valueColor;

  final Color keyColor = _globalKeyColor;

  final bool showComma;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      children: [
        TextSpan(text: _spaces(indent)),
        if (jsonKey != null)
          TextSpan(text: '"$jsonKey"', style: TextStyle(color: keyColor)),
        if (jsonKey != null)
          TextSpan(text: ' : ', style: TextStyle(color: _globalColonColor)),
        TextSpan(text: jsonValue, style: TextStyle(color: valueColor)),
        if (showComma)
          TextSpan(text: ',', style: TextStyle(color: _globalCommaColor)),
      ],
    ));
  }
}

String _spaces(int multiple) {
  return ' ' * _globalTabLength * multiple;
}
