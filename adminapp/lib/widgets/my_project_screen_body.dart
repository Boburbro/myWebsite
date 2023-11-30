import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyProjectBody extends StatelessWidget {
  const MyProjectBody(
      {required this.data, required this.deleteProject, super.key});

  final List data;
  final Function deleteProject;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: data.length,
      itemBuilder: (ctx, index) {
        return Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.35,
            motion: const ScrollMotion(),
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 60),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => deleteProject(data[index][0]),
                child: const Text("Delete"),
              ),
            ],
          ),
          child: Card(
            child: ExpansionTile(
              title: Text(data[index][1].toString()),
              subtitle: Text(data[index][3].toString()),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: const Alignment(-0.9, -1),
              children: [
                Text("Id: ${data[index][0]}"),
                Text("Malumot:\n${data[index][2]}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
