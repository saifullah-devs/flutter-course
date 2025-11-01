import 'dart:io';

void main() {
  // infinite loop
  bool isRunning = true;
  while (isRunning) {
    String command = stdin.readLineSync()!;
    print("Your command is $command");
    if (command == "band hoja bhai") {
      print("done");
      isRunning = false;
    }
  }
}
