import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/services/auth_service.dart';
import 'package:messenger/views/screens/auth/register_name.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final authService = AuthService();

  void submit() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await authService.register(
          emailController.text,
          passwordController.text,
        );
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => const RegisterName()),
        );
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
              "REGISTER",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Parol",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordConfirmationController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Parolni tasdiqlang",
              ),
            ),
            const SizedBox(height: 20),
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
                child: const Text("REGISTER"),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
