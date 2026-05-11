import 'package:supabase_flutter/supabase_flutter.dart';

// Phone Book
// give it a Set of unique User IDs
// go to Supabase, looks up the names for those specific IDs
// hands back tha names
Future<Map<String, String>> loadUsersNameMap(
  SupabaseClient client,
  Set<String> userIds,
) async {
  if (userIds.isEmpty) return {};

  final response = await client
      .from('profiles')
      .select('id,name')
      .inFilter('id', userIds.toList());

  final Map<String, String> result = {};

  for (final row in List<Map<String, dynamic>>.from(response)) {
    final id = row['id']?.toString();
    final name = row['name']?.toString();
    if (id != null && name != null) {
      // Add 'key' = 'value' into result map
      result[id] = name;
    }
  }
  return result;
}
