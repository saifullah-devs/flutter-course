// Single Inheritance
// Electrionics-> height, eidth, thickness, aspectRatio, watch
// Mobile Phone extends Electrionics-> call, games

// Hirarical Inheritance
// Electrionics-> height, eidth, thickness, aspectRatio, watch
// Mobile Phone extends Electrionics-> call, games
// Television-> extends Electrionics-> call


// Multilevel Inheritance
// Electrionics-> height, eidth, thickness, aspectRatio, watch
// MobilePhone extends Electrionics-> call, games
// Television-> extends MobilePhone-> 



class Electrionics{
  String name = "Electrionics Item";

  void watch(){
    print("\n $name is being watched.");
  }
}
// Single Inheritance
class Car extends Electrionics{
  String name = "Car";
  void speed(){
    print("$name  speed is 120M/h.");
  }
}
// Hirarical Inheritance
class TelePhone extends Electrionics{
  String name = "TelePhone";
  void call(){
    print("Call through $name");
  }
}
// Multilevel Inheritance
class MobilePhone extends TelePhone{
  String name = "Mobile Phone";
  void playGames(){
        print("Play Games on $name.");
  }
}
void main(){
  Electrionics electro = new Electrionics();
  electro.watch();

  Car car  = new Car();
  car.watch();
  car.speed();

  TelePhone telePhone = new TelePhone();
  telePhone.watch();
  telePhone.call();

  MobilePhone mobile = new MobilePhone();
  mobile.watch();
  mobile.call();
  mobile.playGames();
}