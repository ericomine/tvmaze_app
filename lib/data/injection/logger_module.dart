import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart' hide ConsoleOutput;

@module
abstract class LoggerModule {
  @LazySingleton()
  Logger get logger => Logger(
        printer: PrettyPrinter(
          printTime: true,
        ),
      );
}
