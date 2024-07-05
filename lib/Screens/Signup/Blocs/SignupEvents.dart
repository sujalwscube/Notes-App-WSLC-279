abstract class SignUpEvents{}
class UserSignUpEvents extends SignUpEvents{
  String email;
  String password;
  String username;
  String phonenumber;
  UserSignUpEvents({required this.email,required this.password,required this .phonenumber,required this .username});
}