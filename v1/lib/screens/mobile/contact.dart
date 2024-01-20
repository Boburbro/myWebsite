// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';


import '/provider/api.dart';
import 'mobile_screen.dart';

void sender(Map textList) async {
  String botToken = "5643648034:AAGwE7yU25NXwR7H8F_f2PNlG4-j1CIDD2E";
  final userName = (await Telegram(botToken).getMe()).username!;
  var teledart = TeleDart(botToken, Event(userName));

  var text = """
Name: ${textList['name']}

Text: 
${textList['text']}
""";

  await teledart.sendMessage("1581890707", text);
}

// ignore: must_be_immutable
class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  static const routeName = '/contact-me';

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  List contacts = [];

  var isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<APIHelper>(context, listen: false)
        .getContactLinks()
        .then((value) {
      setState(() {
        contacts = Provider.of<APIHelper>(context, listen: false).contacts;
        isLoading = false;
      });
    });
    super.initState();
  }

  final GlobalKey<FormState> formKey = GlobalKey();

  Map<String, String> submitList = {"name": "", "text": ""};

  void submit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        sender(submitList);
        ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(content: const Text("Successful!"), actions: [
          TextButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).clearMaterialBanners(),
              child: const Text("Dismiss"))
        ]));
      } catch (e) {
        ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(content: Text(e.toString()), actions: [
          ElevatedButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).clearMaterialBanners(),
              child: const Text("Dismiss"))
        ]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CupertinoActivityIndicator(
                color: CupertinoColors.activeBlue,
                radius: 50,
              ),
            )
          : MobileScreen(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  AppBar(
                    centerTitle: true,
                    title: const Text(
                      "Contact me!",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 700,
                    height: 700,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("Name"),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "It should not be empty";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  submitList['name'] = newValue!;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                maxLines: 10,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("Question or Offer"),
                                  alignLabelWithHint: true,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "It should not be empty";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  submitList['text'] = newValue!;
                                },
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                  onPressed: () => submit(context),
                                  child: const Text("SEND")),
                            ],
                          ),
                        ),
                        //
                        const SizedBox(height: 100),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: 
                          contacts.map((e) => IconButton(onPressed: ()=>html.window.open(e[2], '_blank'), icon: ImageIcon(NetworkImage(e[1])))).toList(),
                          // [
                          //   IconButton(
                          //     onPressed: () {},
                          //     icon:
                          //         const ImageIcon(AssetImage("/telegram.png")),
                          //   ),
                          //   IconButton(
                          //     onPressed: () {},
                          //     icon: const ImageIcon(AssetImage("/email.png")),
                          //   ),
                          //   IconButton(
                          //     onPressed: () {},
                          //     icon: const ImageIcon(AssetImage("/github.png")),
                          //   ),
                          // ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
