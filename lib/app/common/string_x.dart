extension StringX on String {
  String removeHtmlTags() {
    final exp = RegExp("<[^>]*>", multiLine: true);
    return replaceAll(exp, '');
  }
}
