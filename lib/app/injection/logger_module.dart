import 'dart:io' as io;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart' hide ConsoleOutput;

@module
abstract class LoggerModule {
  @LazySingleton()
  Logger get logger => Logger(
        printer: PrettyPrinter(
          lineLength: io.stdout.terminalColumns ?? 120,
          colors: io.stdout.supportsAnsiEscapes ?? true,
          printTime: true,
        ),
      );
}
