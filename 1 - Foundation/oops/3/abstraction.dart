import 'structure.dart';

void main(List<String> args) {
  // ignore: unused_local_variable
  SportsMan sm = Manager();
  Human manager = Manager();
  if (manager is SportsMan) {
    // ignore: unused_local_variable
    SportsMan managerBanaSportsMan = manager as SportsMan;
    //managerBanaSportsMan.play();
  }

  //(manager as Graduate).study();

  (Teacher() as Graduate).study();

  "".meraExtensionWalaMethod();
  "".test;

  1.hello();
}

extension StringHelper1 on String {
  meraExtensionWalaMethod() {
    print("OK");
  }
}

extension StringHelper2 on String {
  int get test => 1;

  meraExtensionWalaMethod1() {
    print("OK");
  }
}

extension IntExt on int {
  hello() {
    print("Hello world");
  }
}
