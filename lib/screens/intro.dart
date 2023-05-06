import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/createmaster');
      },
      child: Scaffold(
        backgroundColor: const Color(0xff212121),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        'Howdy  !!!',
                        style: TextStyle(
                          color: const Color(0xffd3c7d5).withOpacity(0.5),
                          fontSize: 35,
                          fontFamily: 'RubikVinyl',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Cipher Box',
                    style: TextStyle(
                      color: const Color(0xff766174).withOpacity(1),
                      fontSize: 50,
                      fontFamily: 'RubikVinyl',
                    ),
                  ),
                  Text(
                    'Password Manager',
                    style: TextStyle(
                      color: const Color(0xff766174).withOpacity(0.6),
                      fontSize: 25,
                      fontFamily: 'RubikVinyl',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: Column(
                        children: [
                          Text(
                            'Nishanth',
                            style: TextStyle(
                              color: const Color(0xffd3c7d5).withOpacity(0.3),
                              fontSize: 35,
                              fontFamily: 'RubikVinyl',
                            ),
                          ),
                          Text(
                            'Kanagaraj',
                            style: TextStyle(
                              color: const Color(0xffd3c7d5).withOpacity(0.3),
                              fontSize: 35,
                              fontFamily: 'RubikVinyl',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
