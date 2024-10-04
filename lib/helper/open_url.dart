import 'package:url_launcher/url_launcher.dart';

Future<void> openBrowserWebView(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)) {
    throw Exception("Couldn't launch $url");
  }
}

Future<void> openWebView(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
    throw Exception("Couldn't launch $url");
  }
}
