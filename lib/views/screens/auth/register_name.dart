import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/controllers/user_controller.dart';

class RegisterName extends StatefulWidget {
  const RegisterName({super.key});

  @override
  State<RegisterName> createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
  final firtNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userController = UserController();

  void submit() async {
    if (firtNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty) {
      try {
        await userController.register(
          firtNameController.text,
          lastNameController.text,
        );
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } on FirebaseAuthException catch (error) {
        Text(error.message ?? "Xatolik");
      } catch (e) {
        const Text("Tizimda xatolik");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "WELCOME",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: firtNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "First Name",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Last Name",
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: submit,
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
