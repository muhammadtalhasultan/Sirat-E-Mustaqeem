import 'package:share_plus/share_plus.dart';

Future<void> onShare(String text) async {
  await Share.share(text);
}
