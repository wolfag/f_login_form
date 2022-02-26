import 'package:f_login_form/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _unameController = TextEditingController();

  double _formProgress = 0.0;

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _unameController.dispose();
    super.dispose();
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed(WelcomeScreen.RouteName);
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _fnameController,
      _lnameController,
      _unameController,
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(
            value: _formProgress,
          ),
          Text(
            'Sign up',
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _fnameController,
              decoration: const InputDecoration(hintText: 'First name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _lnameController,
              decoration: const InputDecoration(hintText: 'Last name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _unameController,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
          ),
          TextButton(
            onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
            child: const Text('Sign up'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.white;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.blue;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
