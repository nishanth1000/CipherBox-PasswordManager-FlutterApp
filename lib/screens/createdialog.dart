import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Future<void> createDialogBuilder(BuildContext context, List data) {
  final appNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xff766174),
        title: const Text(
          'Add Password',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              const SizedBox(
                height: 5,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                textCapitalization: TextCapitalization.words,
                controller: appNameController,
                cursorColor: Colors.white70,
                cursorHeight: 22,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white70,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white70,
                    ),
                  ),
                  labelText: 'Application Name',
                  labelStyle: TextStyle(color: Colors.white70),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: userNameController,
                cursorColor: Colors.white70,
                cursorHeight: 22,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white70,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white70,
                    ),
                  ),
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white70),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: emailController,
                cursorColor: Colors.white70,
                cursorHeight: 22,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white70,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white70,
                    ),
                  ),
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.white70),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: pwdController,
                cursorColor: Colors.white70,
                cursorHeight: 22,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white70,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white70,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white70),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Required Application Name and Password.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Back',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              if (appNameController.text != '' && pwdController.text != '') {
                final pwdBox = Hive.box('data');

                if (userNameController.text == '') {
                  userNameController.text = 'None';
                }

                if (emailController.text == '') {
                  emailController.text = 'None';
                }
                data.add(
                  [
                    appNameController.text,
                    userNameController.text,
                    emailController.text,
                    pwdController.text
                  ],
                );
                pwdBox.put('pwd', data);
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
