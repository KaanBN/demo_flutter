import 'package:flutter/material.dart';
import 'user_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo App Ana Sayfa")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserPage(userId: "1")),
                );
              },
              child: const Text("Kullanıcı Bilgisini Göster"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Henüz eklenmedi!")),
                );
              },
              child: const Text("Fake API Çağrısı Yap"),
            ),
          ],
        ),
      ),
    );
  }
}
