bool isArabic(String text) {
  // Checks if the text contains Arabic characters
  return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
}
