part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
class ChatActionState extends ChatState{}
class NewChatState extends ChatActionState{
  
}