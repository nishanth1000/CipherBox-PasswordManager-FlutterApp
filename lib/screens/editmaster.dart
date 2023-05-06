import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

//import '../DataBase/masterdata.dart';
class EditMaster extends StatefulWidget {
  const EditMaster({Key? key}) : super(key: key);

  @override
  State<EditMaster> createState() => _EditMasterState();
}

class _EditMasterState extends State<EditMaster> {
  final masterBox = Hive.box('master');

  final editmasterPwdController1 = TextEditingController();
  final editmasterPwdController2 = TextEditingController();

  String errormsg = "Both Password's don't match.";
  bool displayerror = false;

  @override
  void dispose() {
    editmasterPwdController1.dispose();
    editmasterPwdController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'New Master Password',
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
              cursorColor: const Color(0xff766174),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: editmasterPwdController1,
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
                    cursorColor: const Color(0xff766174),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: editmasterPwdController2,
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
                      if ((editmasterPwdController1.text ==
                              editmasterPwdController2.text) &&
                          (editmasterPwdController1.text != '' &&
                              editmasterPwdController2.text != '')) {
                        masterBox.put('pwd', editmasterPwdController2.text);
                        Navigator.pushReplacementNamed(context, '/');
                        displayerror = false;
                      } else {
                        displayerror = true;
                        editmasterPwdController1.text = '';
                        editmasterPwdController2.text = '';
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
                displayerror ? errormsg : '',
                style: const TextStyle(
                    color: Color(0xff766174),
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                'This will be your New Master Password',
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
