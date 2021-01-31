extension StringX on String {
  String removeHtmlTags() {
    final exp = RegExp("<[^>]*>", multiLine: true);
    return replaceAll(exp, '');
  }

  int toDayOfWeek() {
    switch (this) {
      case 'Sunday':
        return DateTime.sunday;
      case 'Monday':
        return DateTime.monday;
      case 'Tuesday':
        return DateTime.tuesday;
      case 'Wednesday':
        return DateTime.wednesday;
      case 'Thursday':
        return DateTime.thursday;
      case 'Friday':
        return DateTime.friday;
      case 'Saturday':
        return DateTime.saturday;
      default:
        return null;
    }
  }
}
