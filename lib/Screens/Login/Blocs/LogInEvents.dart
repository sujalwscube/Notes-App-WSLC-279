abstract class LogInEvents {}

class UserLogInEvents extends LogInEvents {
  String email;
  String password;

  UserLogInEvents({
    required this.email,
    required this.password,
  });
}
