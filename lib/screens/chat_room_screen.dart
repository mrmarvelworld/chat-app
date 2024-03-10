import 'package:chat_app/main.dart';
import 'package:chat_app/widgets/avatar.dart';
import 'package:chat_app/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key, required this.chatRoom});
  final ChatRoom chatRoom;
  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.viewInsetsOf(context);
    final currentParticipant =
        widget.chatRoom.participants.firstWhere((user) => user.id == userId1);

    final otherParticipant = widget.chatRoom.participants
        .firstWhere((user) => user.id != currentParticipant);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: <Widget>[
              Avatar(
                imageUrl: otherParticipant.avatarUrl,
                radius: 18,
              ),
              const SizedBox(height: 2.0),
              Text(
                otherParticipant.username,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))]),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8.0,
            bottom: viewInsets.bottom > 0 ? 8.0 : 0.0,
          ),
          child: Column(children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                final message = messages[index];
                final showImage = index + 1 == messages.length ||
                    messages[index + 1].senderUserId != message.senderUserId;
                return Row(
                    mainAxisAlignment: (message.senderUserId != userId1)
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: <Widget>[
                      if (showImage && message.senderUserId == userId1)
                        Avatar(
                            imageUrl: otherParticipant.avatarUrl, radius: 12),
                      MessageBubble(message: message),
                      if (showImage && message.senderUserId != userId1)
                        Avatar(imageUrl: otherParticipant.avatarUrl, radius: 12)
                    ]);
              },
              itemCount: messages.length,
            )),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    //TODO:send a message
                  },
                  icon: Icon(Icons.attach_file),
                ),
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.send),
                      fillColor:
                          Theme.of(context).colorScheme.primary.withAlpha(100),
                      hintText: 'Send a message',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
