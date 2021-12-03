import 'package:flutter/material.dart';

import 'package:papakado/app.dart';
import 'package:papakado/store/store.dart';

void main() {
    runApp(
        App(
            store: store(),
        )
    );
}