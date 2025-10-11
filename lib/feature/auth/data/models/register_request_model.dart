class RegisterRequestModel {

  String email;
  String name;
  String password;
  String confirmPassword;
  String?city;
  String? address;
  



  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
     this.city,
     this.address,
  });


  toMap(){
    return {
      "name":name,
      "email":email,
      "password":password,
      "password_confirmation":confirmPassword,
      "city":city,
      "address":address
    };

  }
}



