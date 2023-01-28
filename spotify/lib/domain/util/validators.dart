class Validators {
  static String? checkNotNull(String? title) {
    if (title == null || title == "") {
      return "Field cannot be empty";
    }
    return null;
  }
}
