import 'package:flutter/material.dart';

class AddModalBottom extends StatelessWidget {
  const AddModalBottom({
    required this.nameController,
    required this.descriptionController,
    required this.urlController,
    required this.save,
    super.key,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController urlController;
  final Function save;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).viewInsets.bottom == 0
          ? 400
          : MediaQuery.of(context).viewInsets.bottom + 400,
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Nomi"),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: descriptionController,
            maxLines: 3,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Tarif"),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: urlController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Url"),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Bekor qilish")),
              ElevatedButton(
                  onPressed: () => save(), child: const Text("Saqlash"))
            ],
          )
        ],
      ),
    );
  }
}
