 void main(){
  // less confusing then positonal parameter
  Map userData = userMap(name: "Ali", userClass: 12, age: 22, gender: "M");
  print(userData);
 }

 Map userMap({required name,required int age,required String gender,required int userClass}){
  return{
    "name" : name,
    "age" : age,
    "gender" : gender,
    "userClass" : userClass
  };
 }