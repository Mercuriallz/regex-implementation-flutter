import 'package:belajarregex/output.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> fbkey = GlobalKey<FormState>();
  String? empty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: fbkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                onChanged: (value) {
                  setState(() {
                    empty = value;
                  });
                },
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Harap isi terlebih dahulu";
                  } else if (v.isNotEmpty) {
                    bool validInput = RegExp(
                            "(?=.?[A-Z])(?=.?[a-z])(?=.*?[0-9])[a-zA-Z0-9]{8,}[^ws]")
                        .hasMatch(v);
                    return validInput
                        ? null
                        : "Wajib mengandung 8 character, huruf besar dan angka";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    errorText: errorUsername,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () async {
                    if (fbkey.currentState!.validate()) {
                      Get.to(
                        OutputScreen(
                        username: usernameController.text,
                       )
                      );
                    }
                  },
                  child: const Text("Kirim"))
            ],
          ),
        ),
      ),
    );
  }

  String? get errorUsername {
    final text = usernameController.value.text;
    if (text.isNotEmpty) {
      bool validInput =
          RegExp("(?=.?[A-Z])(?=.?[a-z])(?=.*?[0-9])[a-zA-Z0-9]{8,}[^ws]")
              .hasMatch(text);
      return validInput
          ? null
          : "Wajib mengandung 8 character, huruf besar dan angka";
    } else {
      return null;
    }
  }
}
