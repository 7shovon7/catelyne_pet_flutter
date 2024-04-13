import 'package:catelyne_pet_flutter/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:url_launcher/url_launcher.dart';

class CoreUtils {
  static void applyGenericMetaSEO({List<String>? keywords}) {
    keywords ??= CoreConstants.seoKeywords;
    MetaSEO meta = MetaSEO();
    meta.author(author: 'Mahmudur Rahman Shovon');
    meta.description(description: CoreConstants.companyDescriptionSmall);
    meta.keywords(keywords: keywords.join(', '));
  }

  static String preparePhoneNumberForCalling(String phoneNumber) =>
      phoneNumber.replaceAll(RegExp(r'[^\d\+]'), '');

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: preparePhoneNumberForCalling(phoneNumber),
    );
    await launchTheUrl(uri);
  }

  static Future<void> mail(String emailAddress) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    await launchTheUrl(uri);
  }

  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    launchTheUrl(uri);
  }

  static Future<void> launchTheUrl(Uri uri) async {
    if (!await canLaunchUrl(uri)) {
      // throw Exception('Could not launch $uri');
      debugPrint('WARNING: issue with launching url!');
    } else {
      launchUrl(uri);
    }
  }
}
