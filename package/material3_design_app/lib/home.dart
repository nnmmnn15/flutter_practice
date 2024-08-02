import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material3 Design'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 50,
              color: Theme.of(context).colorScheme.primary,
              alignment: const Alignment(0, 0),
              child: Text(
                'Primary Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, // on은 보색
                ),
              ),
            ),
            Container(
              height: 50,
              color: Theme.of(context).colorScheme.secondary,
              alignment: const Alignment(0, 0),
              child: Text(
                'Secondary Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary, // on은 보색
                ),
              ),
            ),
            Container(
              height: 50,
              color: Theme.of(context).colorScheme.tertiary,
              alignment: const Alignment(0, 0),
              child: Text(
                'Tertiary Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiary, // on은 보색
                ),
              ),
            ),
            Container(
              height: 50,
              color: Theme.of(context).colorScheme.error,
              alignment: const Alignment(0, 0),
              child: Text(
                'Error Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onError, // on은 보색
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              color: Theme.of(context).colorScheme.primaryContainer,
              alignment: const Alignment(0, 0),
              child: Text(
                'Primary Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer, // on은 보색
                ),
              ),
            ),
            Container(
              height: 50,
              color: Theme.of(context).colorScheme.secondaryContainer,
              alignment: const Alignment(0, 0),
              child: Text(
                'Secondary Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer, // on은 보색
                ),
              ),
            ),
            Container(
              height: 50,
              color: Theme.of(context).colorScheme.tertiaryContainer,
              alignment: const Alignment(0, 0),
              child: Text(
                'Tertiary Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiaryContainer, // on은 보색
                ),
              ),
            ),
            Container(
              height: 50,
              color: Theme.of(context).colorScheme.errorContainer,
              alignment: const Alignment(0, 0),
              child: Text(
                'Error Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer, // on은 보색
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}