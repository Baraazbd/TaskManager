import 'package:fds/screens/sql_page.dart';
import 'package:fds/widget/Bottun.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../bottomsheet.dart';

List note = [];
Sql _sql = Sql();

class notecreate extends StatefulWidget {
  const notecreate({Key? key}) : super(key: key);

  @override
  State<notecreate> createState() => _notecreateState();
}

class _notecreateState extends State<notecreate> {
  Future readdata() async {
    List<Map> response = await _sql.readtdata('SELECT * FROM notes');
    note.addAll(response);
    if (this.mounted) setState(() {});
  }

  @override
  void initstate() {
    readdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 200, 232, 238),
      ),
      backgroundColor: Color.fromARGB(255, 200, 232, 238),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  ListView.builder(
                      itemCount: note.length,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.amber,
                              child: Text('${note[i]['title']}'),
                            ),
                          )),
                ],
              ),
              InkWell(
                  onTap: () {
                    readdata();
                  },
                  child: bottun(size, 'read')),
            ]),
      ),
    );
  }
}
