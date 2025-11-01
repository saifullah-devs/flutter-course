void main(){
  MobilePhone mobilePhone = new MobilePhone();
  mobilePhone.watch();
}
abstract class Electronic{
  String name="";
  void watch();
}
class MobilePhone extends Electronic{
  String name = "MobilePhone";
  @override
  void watch(){
     print("$name is being watched.");

  }
}