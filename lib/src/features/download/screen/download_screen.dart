import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final databasesPath = await getDatabasesPath();
          final pathName = '$databasesPath/siratemustaqeem-db.db';

          await deleteDatabase(pathName);

          final response = await Dio().download(
            'https://raw.githubusercontent.com/muhammadtalhasultan/Sirat-e-Mustaqeem-Master/main/siratemustaqeem-db.db',
            pathName,
          );

          if (response.statusCode == 200) {
            var db = await openDatabase(pathName, readOnly: true);
            List<Map<String, Object?>> records = await db.query('allah_names');
            log(records.toString());
          }
        },
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
