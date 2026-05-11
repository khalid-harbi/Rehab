import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'conversation_di.config.dart'; 

@InjectableInit(
  initializerName: 'initConversation',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/conversation'],
)
void configureConversation(GetIt getIt) {
  getIt.initConversation();
}
