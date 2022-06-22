import 'package:equatable/equatable.dart';

class Loginuser extends Equatable {
  const Loginuser({
    required this.status,
    required this.result,
    required this.message,
  });
  final bool status;
  final List<Userlogin> result;
  final String message;
  @override
  List<Object> get props => [status, result, message];
}

class Userlogin extends Equatable {
  final String uid;
  final String token;
  final String pin;
  final String displayname;
  final String email;
  final String telp;
  final int active;
  final int level;
  final String avatar;
  const Userlogin(
      {required this.uid,
      required this.token,
      required this.pin,
      required this.displayname,
      required this.email,
      required this.telp,
      required this.active,
      required this.level,
      required this.avatar});

  @override
  List<Object> get props => [uid, pin, displayname, email, telp, avatar];
}
