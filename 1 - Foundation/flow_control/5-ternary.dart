void main() {
  int age=10;
  String v= vote(age);
  print(v);
}

String vote(int age){
  String result = age>=18 && age<100?"You can vote"
    : age>=100?"Are you alive?"
      : age<=0?"Are you born?"
        : "You cannot vote";
  return result;
}
