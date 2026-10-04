import 'package:cars/core/helpers/hive_helper.dart';
import 'package:flutter/material.dart';

class Notepage extends StatefulWidget {
  const Notepage({super.key});

  @override
  State<Notepage> createState() => _NotepageState();
}

class _NotepageState extends State<Notepage> {
  final _controller = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  bool _islooding = false;
  void didChangeDependencies() async {
    _islooding = true;
    await HiveHelper.getNote();
    _islooding = false;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Form(
                key: _key,
                child: AlertDialog(
                  title: const Text('Add Note'),

                  content: TextFormField(
                    controller: _controller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "You Should Add any content";
                      }
                    },
                  ),

                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                    TextButton(
                      child: const Text('Add'),
                      onPressed: () {
                        _key.currentState!.validate();
                        if (_controller.text.isNotEmpty) {
                          _controller.text;
                          HiveHelper.addNote(_controller.text);
                          setState(() {});
                          Navigator.pop(context);
                          _controller.text = "";
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF37474F),
        centerTitle: false,
        title: Text("Note App", style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              HiveHelper.deleteAllNote();
              setState(() {});
            },
            child: Text("Cleat All", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),

      body: _islooding
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: HiveHelper.MyNotes.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  InkWell(
                    onTap: () {
                      _controller.text = HiveHelper.MyNotes[index];
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Form(
                            key: _key,
                            child: AlertDialog(
                              title: const Text('Update Note'),

                              content: TextFormField(
                                controller: _controller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "You Should Add any content";
                                  }
                                },
                              ),

                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),

                                TextButton(
                                  child: const Text('Update'),
                                  onPressed: () {
                                    _key.currentState!.validate();
                                    if (_controller.text.isNotEmpty) {
                                      _controller.text;
                                      HiveHelper.UpdateNote(
                                        index,
                                        _controller.text,
                                      );
                                      setState(() {});
                                      Navigator.pop(context);
                                      _controller.text = "";
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: index == 0
                            ? Color(0xFFFFAB91)
                            : index % 2 == 0
                            ? Color(0xFF95D5B2)
                            : Color(0xFF90CAF9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          HiveHelper.MyNotes[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      HiveHelper.deleteNote(index);
                      setState(() {});
                    },
                    icon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
