import 'package:flutter/material.dart';

Future<void> viewDialogBuilder(
    BuildContext context, String appname, var index) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xff766174),
        title: Text(
          appname,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        content: const Text(
          'Do you want to delete this Password ?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/deletemaster',
                  arguments: {'index': index});
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'No',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
