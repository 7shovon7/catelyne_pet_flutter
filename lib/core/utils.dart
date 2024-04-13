import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CoreUtils {
  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      // throw Exception('Could not launch $uri');
      debugPrint('WARNING: issue with launching url!');
    }
  }
}
