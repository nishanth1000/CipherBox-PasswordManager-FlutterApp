import 'package:cipher_box/DataBase/pwddata.dart';
import 'package:cipher_box/Screens/viewdialog.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'createdialog.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pwdBox = Hive.box('data');
  PwdDB db = PwdDB();

  @override
  void initState() {
    super.initState();
    if (pwdBox.get('pwd') == null) {
      db.createData();
    } else {
      db.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: const Color(0xff212121),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () => createDialogBuilder(context, db.data),
                icon: const Icon(
                  Icons.add,
                  color: Color(0xff766174),
                ),
                splashRadius: 20,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/confirmmaster');
                },
                icon: const Icon(
                  Icons.edit_rounded,
                  size: 18,
                  color: Color(0xff766174),
                ),
                splashRadius: 20,
              ),
              const SizedBox(
                width: 5,
              ),
            ],
            title: const Text(
              'Cipher Box',
              style: TextStyle(
                color: Color(0xff766174),
                fontWeight: FontWeight.w300,
              ),
            ),
            centerTitle: true,
            expandedHeight: 190,
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: db.data.length,
              (context, index) => GestureDetector(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff766174),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    //color: Colors.red[400],
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                db.data[index][0],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: db.data[index][3]));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        "${db.data[index][0]} password copied to Clipboard."),
                                  ));
                                },
                                icon: const Icon(
                                  Icons.content_copy_rounded,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ],
                          ),
                          Text(db.data[index][1],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            db.data[index][2],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onLongPress: () =>
                    viewDialogBuilder(context, db.data[index][0], index),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
        ],
      ),
    );
  }
}
