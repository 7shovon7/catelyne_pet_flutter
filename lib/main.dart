// import 'dart:html' as html;
import 'package:catelyne_pet_flutter/data/firebase/firebase_options.dart';
import 'package:catelyne_pet_flutter/ui/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';

void main() async {
  if (kIsWeb) {
    MetaSEO().config();
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
