import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';


class SourcePage extends StatefulWidget {
  const SourcePage({Key? key}) : super(key: key);

  @override
  _SourcePageState createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
  bool _isAdd=false;
  final fb = FirebaseDatabase.instance;
  TextEditingController _postController = TextEditingController();


  TextFormField buildPostFormField() {
    return TextFormField(
      controller: _postController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Post Name";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Post",
        hintText: "Enter your Post",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('poster');
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: [
            Visibility(
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width/1.2,
                            child: buildPostFormField()),
                        GestureDetector(
                          onTap: (){
                            if(_postController.text.isEmpty){}else {
                              ref.push().set(_postController.text,).asStream();
                              setState(() {
                                _isAdd=!_isAdd;
                              });
                            }
                          },
                          child: const CircleAvatar(
                            child:  Icon(Icons.arrow_forward_outlined),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Divider(thickness: 1,),
                  ],
                ),
              ),
              visible: _isAdd,
            ),
            FirebaseAnimatedList(
                query: ref,
                shrinkWrap: true,
                itemBuilder: (context, snapshot, animation, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // tileColor: Colors.white,
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            ref.child(snapshot.key!).remove();
                          },
                        ),
                        title: Text(
                          snapshot.value.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:   const Icon(Icons.add),
        onPressed: () {
          setState(() {
            _isAdd=!_isAdd;
          });
        },
      ),
    );
  }
}
