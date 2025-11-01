void main(){
  Cow cow = new Cow();
  cow.eat();
  cow.walking();
  cow.reproduction();
}
// work fine
// class Animal{
//   void walking(){}
//   void eat(){}
// }
// class Cow extends Animal{}

class Animal{
  void walking(){
    print("Walking");
  }
  void eat(){
    print("Eating");
  }
}
class Mammal{
  void reproduction(){}
}
// must override method
// multi inheritance posible
class Cow implements Animal, Mammal{
  void walking(){
    print("Walking Cow");
  }
  void eat(){
    print("Grass");
  }
  void reproduction(){
    print("Childs");
  }
}