void main(){
  Ali ali = new Ali();
  int result= ali.multx(2, 10);
  print(result);
  String sResult=ali.PlusHello("Ali");
  print(sResult);
}

class Ali{
  int multx(int a, int x){
    return a*x;
  }
  String PlusHello(String name){
    return name+" Hello";
  }
}