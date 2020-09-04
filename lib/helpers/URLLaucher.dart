import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class URLLauncher {
  launchUrl(String url) {
    if (canLaunch(url) != null) {
      launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchTel(String mobNo) {
    launch("tel://" + mobNo);
  }
}
