import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CreateMaster extends StatefulWidget {
  const CreateMaster({Key? key}) : super(key: key);

  @override
  State<CreateMaster> createState() => _CreateMasterState();
}

class _CreateMasterState extends State<CreateMaster> {
  final masterBox = Hive.box('master');

  final createMasterPwdController1 = TextEditingController();
  final createMasterPwdController2 = TextEditingController();

  String errorMsg = "Both Password's don't match.";
  bool displayError = false;

  @override
  void dispose() {
    createMasterPwdController1.dispose();
    createMasterPwdController2.dispose();
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
              'Create Master Password',
              style: TextStyle(
                  color: Color(0xff766174),
                  fontSize: 23,
                  fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 58, 0),
            child: TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              cursorColor: const Color(0xff766174),
              controller: createMasterPwdController1,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24.0),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xff766174),
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 5, 0),
                  child: TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    cursorColor: const Color(0xff766174),
                    controller: createMasterPwdController2,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xff766174),
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
                      labelText: 'Re-Enter Password',
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
                    setState(() {
                      if ((createMasterPwdController1.text ==
                              createMasterPwdController2.text) &&
                          (createMasterPwdController1.text != '' &&
                              createMasterPwdController2.text != '')) {
                        masterBox.put('created', 'y');
                        masterBox.put('pwd', createMasterPwdController2.text);
                        displayError = false;
                        Navigator.pushReplacementNamed(context, '/');
                      } else {
                        displayError = true;
                        createMasterPwdController1.text = '';
                        createMasterPwdController2.text = '';
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    });
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
                    color: Color(0xff766174),
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                'Note: This master password is a single password that grants the user access to all their stored passwords. It is important to keep the master password secure and not share it with anyone.',
                style: TextStyle(
                    color: Color(0xffd3c7d5),
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                'It is important to remember the master password otherwise the stored passwords cannot be retrieved.',
                style: TextStyle(
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
