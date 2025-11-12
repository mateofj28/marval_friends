abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String documento;

  LoginSubmitted(this.documento);
}
