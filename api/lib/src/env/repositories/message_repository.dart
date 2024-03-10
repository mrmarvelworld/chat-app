import 'package:supabase/supabase.dart';

class MessageRepository {
  final SupabaseClient dbClient;

  const MessageRepository({required this.dbClient});

  Future<List<Map<String, dynamic>>> fetchMessages(String chatRoomId) async {
    try {
      final messages = await dbClient
          .from('messages')
          .select()
          .eq('chat_room_id', chatRoomId);

      return messages;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
