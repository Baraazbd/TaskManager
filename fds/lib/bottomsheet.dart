import 'package:fds/screens/sql_page.dart';
import 'package:fds/screens/start_page.dart';
import 'package:fds/widget/Bottun.dart';
import 'package:fds/widget/write_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

TextEditingController _note_title = TextEditingController();
TextEditingController _note_desc = TextEditingController();
DateTime _Date_time = DateTime.now();

Sql _sql = Sql();
List note = [];

class bottomsheet extends StatefulWidget {
  const bottomsheet({Key? key}) : super(key: key);

  @override
  State<bottomsheet> createState() => _bottomsheetState();
}

class _bottomsheetState extends State<bottomsheet> {
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
      body: modelbottonsheet(size),
    );
  }

  Container modelbottonsheet(Size size) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'NoteCreate',
                style: GoogleFonts.acme(
                    color: Color.fromARGB(255, 42, 145, 136),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              write_box(size, _note_title, 'bdjd', null, 'NoteTitle'),
              write_box(size, _note_desc, 'bdjd', null, 'Descrption'),
              write_box(
                  size,
                  null,
                  '',
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('nvi'),
                      IconButton(
                          onPressed: () => showDate(),
                          icon: Icon(Icons.date_range_outlined)),
                    ],
                  ),
                  'Date'),
              Row(
                children: [
                  Expanded(
                    child: write_box(size, null, 'Time', null, 'Time'),
                  ),
                  Expanded(child: write_box(size, null, '', null, ''))
                ],
              ),
              InkWell(
                  onTap: () async {
                    int response = await _sql.insertdata(
                        'INSERT INTO notes (title ,desc , date) VALUES("${_note_title.text}" , "${_note_desc.text}", "one" )');
                    print(response);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => notecreate()));
                  },
                  child: bottun(size, 'insert')),
            ],
          ),
        ),
      ),
    );
  }

  showDate() async {
    DateTime? _date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2030));
    if (_date != null) {
      setState(() {
        _Date_time = _date;
      });
    }
  }
}
