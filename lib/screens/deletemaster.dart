import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DeleteMaster extends StatefulWidget {
  const DeleteMaster({Key? key}) : super(key: key);

  @override
  State<DeleteMaster> createState() => _DeleteMasterState();
}

class _DeleteMasterState extends State<DeleteMaster> {
  final masterBox = Hive.box('master');
  final deleteMasterPwdController = TextEditingController();

  String errorMsg = "Incorrect Master Password";
  bool displayError = false;

  @override
  void dispose() {
    deleteMasterPwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deletedata = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Delete Password',
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
                    cursorColor: const Color(0xff766174),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: deleteMasterPwdController,
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
                          color: Color(0xff766174),
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
                    size: 30,
                  ),
                  splashRadius: 22,
                  onPressed: () {
                    setState(() {
                      if (deleteMasterPwdController.text ==
                          masterBox.get('pwd')) {
                        final pwdBox = Hive.box('data');
                        List data = pwdBox.get('pwd');
                        data.removeAt(deletedata['index']);
                        pwdBox.put('pwd', data);
                        Navigator.pushReplacementNamed(context, '/home');
                        displayError = false;
                      } else {
                        deleteMasterPwdController.text = '';
                        displayError = true;
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
            height: 15,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                'Note: The selected Password will be deleted and cannot be recovered.',
                style: TextStyle(
                    color: Colors.white70,
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
