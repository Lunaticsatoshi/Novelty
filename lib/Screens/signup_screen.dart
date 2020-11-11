import 'package:Novelty/blocs/register_bloc/bloc.dart';
import 'package:Novelty/user_repository.dart';
import 'package:Novelty/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;
  const RegisterScreen({Key key, @required UserRepository userRepository}) : assert(userRepository != null),
        _userRepository = userRepository, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Color.fromRGBO(3, 8, 24, 3),
      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(userRepository: _userRepository),
        child: RegisterForm(userRepository: _userRepository),
        ),
    );
  }
}