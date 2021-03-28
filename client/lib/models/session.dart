import 'dart:io';

class Session {
  String session;

  Session({this.session = ''});

  bool get loggedIn => session.isNotEmpty;

  void fromSetCookie(String setCookie) {
    session = Cookie.fromSetCookieValue(setCookie).value;
  }
}
