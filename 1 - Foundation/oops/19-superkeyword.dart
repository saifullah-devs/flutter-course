void main() {
  MobilePhone mobilePhone = new MobilePhone("Samsang", "S23");
  print(mobilePhone);
}

class Electronic {
  Electronic(String brand) {
    print("This is a Electronic Constructor - $brand");
  }
}

class MobilePhone extends Electronic {
  MobilePhone(String brand, String Model) : super(brand) {
    print("This is a Mobile Constructor - $Model");
  }
}
