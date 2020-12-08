import 'package:url_launcher/url_launcher.dart';

String cleanTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

asyncWebLauncher(String url) async {
  try {
    if (await canLaunch(url)) {
      await launch(url);
      return true;
    }
  } catch (e) {}
  return false;
}
