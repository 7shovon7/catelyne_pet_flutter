// import 'dart:html' as html;
import 'package:catelyne_pet_flutter/ui/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';

void main() {
  if (kIsWeb) {
    MetaSEO().config();
    // MetaSEO().author(author: 'Mahmudur Rahman Shovon');
    // html.MetaElement meta = html.MetaElement();
    // meta.name = 'meta-name';
    // meta.content = 'meta-content';
    // html.document.head?.append(meta);
  }
  runApp(const MyApp());
}
