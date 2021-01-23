import 'package:shop_app/models/user.dart';

abstract class AuthenticationState  {
  AuthenticationState([List props = const []]) : super();
}


class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';

//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}
class FirstOpenApp extends AuthenticationState {
  @override
  String toString() => 'FirstOpenApp';

//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}

class Authenticated extends AuthenticationState {
  final User userInfo;

  Authenticated({this.userInfo}) : super([userInfo.username]);

//  // TODO: implement props
  List<Object> get props => [userInfo.username];
}

class SignupPageState extends AuthenticationState {

//  // TODO: implement props
  List<Object> get props => [];
}

class Unauthenticated extends AuthenticationState {
  Unauthenticated();
//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}


class MostUpdateApp extends AuthenticationState {
    MostUpdateApp();
//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}
