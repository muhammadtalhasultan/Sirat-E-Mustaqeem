import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  await canLaunch(url) ? await launch(url) : throw 'cannot launch url';
}
