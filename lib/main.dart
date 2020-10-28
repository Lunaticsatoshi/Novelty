import 'dart:async';

import 'package:Novelty/Screens/screen.dart';
import 'package:Novelty/blocs/authentication_bloc/bloc.dart';
import 'package:Novelty/simple_bloc_delegate.dart';
import 'package:Novelty/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: MyApp(userRepository: userRepository),
      )
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final UserRepository _userRepository;
    MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Timer splashTimer;
  bool _viewSplash = true;

  @override
  void initState() {
    splashTimer = Timer(Duration(seconds: 5), onTimerEnd);
    super.initState();
  }

  void onTimerEnd() {
    setState(() {
      _viewSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(0xff135f6d),
            fontSize: 18,
          ),
          headline2: TextStyle(
            color: Color(0xff4aa5a7),
            fontSize: 18,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: _viewSplash ? SplashScreen() : FirstScreen(userRepository:  widget._userRepository,),
    );
  }
}

class FirstScreen extends StatelessWidget {
  final UserRepository _userRepository;
  const FirstScreen({Key key, @required UserRepository userRepository,}) :  _userRepository = userRepository, super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationInitial) {
          return SplashScreen();
        }
        if (state is Unauthenticated) {
          return LoginScreen(userRepository: _userRepository);
        }
        if (state is Authenticated) {
          return HomeScreen(uid: state.uid);
          // return HomeScreen(name: state.uid);
        }
      }
      );
  }
}

