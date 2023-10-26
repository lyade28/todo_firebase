import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widget/task_widget.dart';

import '../data/firestore.dart';

class Stream_note extends StatelessWidget {
  bool done ;
   Stream_note(this.done , {super.key});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
            stream: Firestore_Datasource().stream(done),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final noteList = Firestore_Datasource().getNotes(snapshot);
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context ,index) {
                final note = noteList[index];
              return Dismissible( key: UniqueKey(), onDismissed: (direction) {
                Firestore_Datasource().delet_note(note.id);
              }, child: Task(note));
                  },
                  itemCount: noteList.length,
                  );
            }
          );
  }
}