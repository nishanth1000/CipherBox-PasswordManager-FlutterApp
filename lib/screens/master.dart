import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  final masterBox = Hive.box('master');
  final masterPwdController = TextEditingController();

  String errorMsg = "Incorrect Master Password";
  bool displayError = false;

  @override
  void dispose() {
    masterPwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              'Master Password',
              style: TextStyle(
                  color: Color(0xff766174),
                  fontSize: 23,
                  fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 5, 0),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    cursorColor: const Color(0xff766174),
                    controller: masterPwdController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Color(0xff766174),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.white70,
                          width: 2.0,
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: IconButton(
                  icon: const Icon(
                    Icons.navigate_next_outlined,
                    color: Color(0xff766174),
                    size: 34,
                  ),
                  splashRadius: 22,
                  onPressed: () {
                    if (masterPwdController.text == masterBox.get('pwd')) {
                      displayError = false;
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      masterPwdController.text = '';
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() {
                        displayError = true;
                      });
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side:
                            const BorderSide(color: Colors.white70, width: 1.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                displayError ? errorMsg : '',
                style: const TextStyle(
                    color: Color(0xffd3c7d5),
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
