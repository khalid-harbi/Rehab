int? supabaseValueToMillis(dynamic value) {
  if (value == null) return null;

  if (value is int) return value;

  if (value is String) {
    final parsed = DateTime.tryParse(value);
    if (parsed != null) return parsed.millisecondsSinceEpoch;
  }
  return null;
}
