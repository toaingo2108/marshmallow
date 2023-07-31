import 'package:flutter/material.dart';
import 'package:marshmallow/core/data_fake.dart';

final List<Tab> tabs = data1
    .map(
      (e) => Tab(
        text: e["title"],
      ),
    )
    .toList();
