import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminders',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ReminderScreen(),
    );
  }
}

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  final List<Map<String, dynamic>> reminders = const [
    {
      'icon': Icons.flash_on,
      'color': Colors.green,
      'titulo': 'Quick Creation',
      'descripcion':
          'Simply type in your list, ask Siri, or add a reminder from your Calendar app.',
    },
    {
      'icon': Icons.shopping_cart_checkout,
      'color': Colors.orange,
      'titulo': 'Grocery Shopping',
      'descripcion':
          'Create a Grocery List that automatically sorts items you add by category.',
    },
    {
      'icon': Icons.people,
      'color': Colors.yellow,
      'titulo': 'Easy Sharing',
      'descripcion':
          'Collaborate on a list, and even assign individual tasks.',
    },
    {
      'icon': Icons.dashboard,
      'color': Colors.blue,
      'titulo': 'Powerful Organization',
      'descripcion':
          'Create new lists to match your needs, categorize reminders with tags, and manage reminders around your workflow with Smart Lists.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Reminders'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...reminders.map((item) => ReminderItem(item)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Continuando...')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReminderItem extends StatelessWidget {
  final Map<String, dynamic> data;
  const ReminderItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(data['icon'], size: 32, color: data['color']),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['titulo'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  data['descripcion'],
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}