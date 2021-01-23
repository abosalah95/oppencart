import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/resources/repository.dart';


import 'bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc() : super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isOpen = prefs.getBool('firstOpen') ?? false;
      if (!isOpen) {
        await prefs.setBool('firstOpen', true);
        yield FirstOpenApp();
      } else {
        yield* _mapAppStartedToState();
      }
    } else if (event is LoggedIn) {
      yield* _mapAppStartedToState();
    }else if (event is SignupPage) {
      yield* _mapAppSignupPageStartedToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    } else if (event is UnauthenticatedEvent) {
      yield Unauthenticated();
    }
    // else if (event is SendTokenFirebase && state is Authenticated) {
    //   await Repository().sendToken((state as Authenticated).userInfo.token, event.token);
    //   // yield state;
    // }
    else if (event is GetVersionApp && state is Authenticated) {
      var responseData = await Repository.instance.versionApp();
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      // String appName = packageInfo.appName;
      // String packageName = packageInfo.packageName;
      String version = packageInfo.version; // 1.0.0
      int buildNumber = int.parse(packageInfo.buildNumber); // 1
      if (Platform.isAndroid) {
        // Android-specific code
        int versionUpdate =  int.parse(responseData["current_android_version"]);
        if ( responseData["current_android_version_update_force"] == '1' &&  versionUpdate > buildNumber  ) {
          yield MostUpdateApp();
        }
      } else if (Platform.isIOS) {
        int versionUpdate =  int.parse(responseData["current_ios_version"]);
        // iOS-specific code
        if (responseData["current_ios_version_update_force"] == '1' && versionUpdate > buildNumber) {
          yield MostUpdateApp();
        }
      }
    } else if (event is UpdateLanguage && state is Authenticated) {
      // await Repository.instance.updateLanguage(
      //   (state as Authenticated).userInfo.token,
      //   event.language,
      // );
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      //final User user = await Repository.instance.getLoginUser();
      if (user != null) {
        yield Authenticated(userInfo: user);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }
  Stream<AuthenticationState> _mapAppSignupPageStartedToState() async* {
    try {
      yield SignupPageState();
    } catch (_) {
      yield Unauthenticated();
    }


  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    // final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
    // var firBaseToken = await firebaseMessaging.getToken();
    try {
   //   await Repository.instance.logoutOfLine();
      // await Repository().logout(token, firBaseToken);
      yield Unauthenticated();
    } catch(e) {
      yield Unauthenticated();
    }
//    Repository().deleteFireBaseToken(user.id);
  }
}
