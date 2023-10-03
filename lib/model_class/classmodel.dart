
import 'dart:core';

class Student{
  int? id;
  String? name;
  String? email;
  String? password;
  String? phoneNo;

  Student({
    this.id,this.name,this.email,this.password,this.phoneNo
  });

  toJson(){
    return{

      "name":name,
      "emal":email,
      "password":password,
      "phoneNo":phoneNo
    };
  }
}