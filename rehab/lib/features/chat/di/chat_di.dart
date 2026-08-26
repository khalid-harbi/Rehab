import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'chat_di.config.dart';

@InjectableInit(
  initializerName: 'initChat',
  // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/chat'],
)
void configureChat(GetIt getIt) {
  getIt.initChat();
}
