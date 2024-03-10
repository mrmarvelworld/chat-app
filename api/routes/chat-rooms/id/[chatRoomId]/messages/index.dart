import 'dart:html';

import 'package:api/src/env/repositories/message_repository.dart';
import 'package:dart_frog/dart_frog.dart';
import 'dart:async';

Future<Response> onRequest(RequestContext context, String chatRoomId) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, chatRoomId);
    case HttpMethod.post:
    case HttpMethod.head:
    case HttpMethod.patch:
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, String chatRoomId) async {
  final messageRepository = context.read<MessageRepository>();
  try {
    final messages = messageRepository.fetchMessages(chatRoomId);
    return Response.json(
      body: {'messages': messages},
    );
  } catch (err) {
    return Response.json(
        body: {'error': err.toString()},
        statusCode: HttpStatus.internalServerError);
  }
}
