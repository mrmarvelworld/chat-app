import 'package:chat_app/screens/chat_room_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChatRoomScreen(
        chatRoom: chatRoom,
      ),
    );
  }
}

const userId1 = '33f771e2-311b-4d4f-9b14-d1e1c59936d3';
const userId2 = '94a6b01e-319e-494e-b454-98f22ab0d109';
const chatRoomId = '8d162274-6cb8-4776-815a-8e721ebfb76d';
final chatRoom = ChatRoom(
  id: '8d162274-6cb8-4776-815a-8e721ebfb76d',
  participants: const [
    User(
      id: userId1,
      username: 'User 1',
      phone: '1234512345',
      email: 'user1@email.com',
      avatarUrl:
          'https://images.unsplash.com/photo-1700493624764-f7524969037d?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      status: 'online',
    ),
    User(
      id: userId2,
      username: 'User 2',
      phone: '5432154321',
      email: 'user2@email.com',
      avatarUrl:
          'https://images.unsplash.com/photo-1700469880511-3ef0cee47985?q=80&w=3672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      status: 'online',
    ),
  ],
  lastMessage: Message(
    id: 'de120f3a-dbca-4330-9e2e-18b55a2fb9e5',
    chatRoomId: chatRoomId,
    senderUserId: userId1,
    receiverUserId: userId2,
    content: 'Hey! I am good, thanks.',
    createdAt: DateTime(2023, 12, 1, 1, 0, 0),
  ),
  unreadCount: 0,
);

// Create messages
final messages = <Message>[
  // Sender messages
  Message(
    chatRoomId: chatRoomId,
    senderUserId: userId1,
    receiverUserId: userId2,
    content: 'Hello there!',
    createdAt: DateTime.now(),
  ),
  Message(
    chatRoomId: chatRoomId,
    senderUserId: userId2,
    receiverUserId: userId1,
    content: 'How are you?',
    createdAt: DateTime.now().add(Duration(minutes: 5)),
  ),
  // Receiver messages
  Message(
    chatRoomId: chatRoomId,
    senderUserId: userId1,
    receiverUserId: userId2,
    content: 'My Bro I am fine',
    createdAt: DateTime.now().add(Duration(minutes: 10)),
  ),
  Message(
    chatRoomId: chatRoomId,
    senderUserId: userId1,
    receiverUserId: userId2,
    content: 'What about you?',
    createdAt: DateTime.now().add(Duration(minutes: 15)),
  ),
  Message(
    chatRoomId: chatRoomId,
    senderUserId: userId2,
    receiverUserId: userId1,
    content: 'Any plans for today?',
    createdAt: DateTime.now().add(Duration(minutes: 20)),
  ),
];
