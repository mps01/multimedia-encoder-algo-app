import 'dart:collection';
import 'package:adaproject_cryptic/Theme.dart' as Theme;
import 'package:adaproject_cryptic/screens/appbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adaproject_cryptic/algorithms/huffman_coding.dart';

class HuffmanCodingScreen extends StatefulWidget {
  @override
  _HuffmanCodingScreenState createState() => _HuffmanCodingScreenState();
}

class _HuffmanCodingScreenState extends State<HuffmanCodingScreen> {
  final _numOfVariablesController = TextEditingController();
  String _res = '';
  int numOfVar = 0;
  Map<String, String> _map;
  LinkedHashMap _frequencyMap;
  @override
  void dispose() {
    _numOfVariablesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.Colors.planetPageBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Huffman Coding',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _numOfVariablesController,
                decoration: InputDecoration(
                  hasFloatingPlaceholder: true,
                  labelText: 'Enter Code',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.amber,
                      onPressed: () => action(true),
                      child: Text(
                        'Encode',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DataTable(
                onSelectAll: null,
                columns: generateColumns(),
                rows: generateRows(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DataRow> generateRows() {
    List<DataRow> rows = [];

    if (_map != null &&
        _map.isNotEmpty &&
        _frequencyMap != null &&
        _frequencyMap.isNotEmpty) {
      _map.forEach((k, v) {
        List<DataCell> cells = [];
        cells.add(DataCell(Text(k)));
        cells.add(DataCell(Text(_frequencyMap[k].toString())));
        cells.add(DataCell(Text(v)));
        rows.add(DataRow(cells: cells));
      });
    }
    return rows;
  }

  List<DataColumn> generateColumns() {
    List<DataColumn> columns = [];

    columns.add(DataColumn(label: Text('Symbol')));
    columns.add(DataColumn(label: Text('Frequency')));
    columns.add(DataColumn(label: Text('Code')));
    return columns;
  }

  void action(bool isEncode) {
    if (_numOfVariablesController.text != null &&
        _numOfVariablesController.text.isNotEmpty) {
      if (isEncode) {
        final service = HuffmanCodingAlgorithm(_numOfVariablesController.text);
        setState(() {
          _frequencyMap = service.frequencyMap;
          _map = service.codeMap;
        });
      }
    }
  }
}
