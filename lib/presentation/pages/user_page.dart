import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/user_provider.dart';

class UserPage extends ConsumerWidget {
  final String userId;

  const UserPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider(userId));

    return Scaffold(
      appBar: AppBar(title: const Text("Kullanıcı Bilgileri")),
      body: userAsyncValue.when(
        data: (user) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ad: ${user.name}"),
              Text("E-posta: ${user.email}"),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Hata: $err")),
      ),
    );
  }
}