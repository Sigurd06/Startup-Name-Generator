import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class PushSaved extends StatelessWidget {
  const PushSaved({Key? key, required this.saved, required this.biggerFont})
      : super(key: key);

  final Set<WordPair> saved;
  final TextStyle biggerFont;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.list),
      onPressed: () => _pushSaved(context),
      tooltip: 'Saved Suggestions',
    );
  }

  void _pushSaved(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
