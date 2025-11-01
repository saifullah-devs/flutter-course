void main(){
  MobilePhone mobilePhone = new MobilePhone();
  mobilePhone.watch();
  mobilePhone.playGames();
}
class Electronic{
  double h=0;
  double w=0;
  double t=0;
  // String name = "Electrionics Item";

  void watch(){
    print("Electrionics Item is being watched.");
  }
}
class MobilePhone extends Electronic{
  // String name = "MobilePhone";
  
  @override
  void watch(){
    print("Mobile Phone is being watched.");
    super.watch();
  }
  void playGames(){
        print("Play Games on Mobile Phone.");
  }
}