class Animal with Eating, Eating, reproduce{}
class Human with Eating, Eating, reproduce{}
mixin Walking{
  void walk(){}
}

mixin Eating{
  void eat(){}
}
mixin reproduce{
  void reproduction(){}
}