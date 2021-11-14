import 'package:app_links/app_links.dart';

late AppLinks _appLinks;

class LinkManager {
  static void initDeepLinks() async {
    _appLinks = AppLinks(
      onAppLink: (Uri uri, String stringUri) {
        print('onAppLink: $stringUri');
      },
    );

    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null && appLink.hasFragment && appLink.fragment != '/') {
      print('getInitialAppLink: ${appLink.toString()}');
    }
  }
}
