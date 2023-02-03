class AppHelper {
  static bool isNotEmpty(String? string) {
    return string != null && string.isNotEmpty;
  }

  static String replaceDollar({String? text}) {
    return text?.replaceAll("\$", "") ?? "";
  }
}
