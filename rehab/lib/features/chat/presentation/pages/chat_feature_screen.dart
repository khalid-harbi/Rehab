import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';

class ChatFeatureScreen extends StatelessWidget {
  const ChatFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<ChatCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
