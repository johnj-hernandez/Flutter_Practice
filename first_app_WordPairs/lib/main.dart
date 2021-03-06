import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home:RandomWords(),
      theme: new ThemeData(          // Add the 3 lines from here...
        primaryColor: Colors.white,
      ),                             // ... to here.
    );
  }
}


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}


class RandomWordsState extends State<RandomWords>{
  //lista de pares de palabras guardadas
  final Set<WordPair> _saved = new Set<WordPair>();
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[      // Add 3 lines from here...
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }


  void _pushSaved() {
    Navigator.of(context).push(
        new MaterialPageRoute<void>(   // Add 20 lines from here...
          builder: (BuildContext context) {
            final Iterable<ListTile> tiles = _saved.map(
                  (WordPair pair) {
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              },
            );
            final List<Widget> divided = ListTile
                .divideTiles(
              context: context,
              tiles: tiles,
            )
                .toList();

            return new Scaffold(         // Add 6 lines from here...
              appBar: new AppBar(
                title: const Text('Saved Suggestions'),
              ),
              body: new ListView(children: divided),
            );
          },
    ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/ //parece ser que por el divider entonces cada 2 i representa 1 item
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    //verifica si la palabra pasada como parametro ya esta como favorita
    final bool alreadySaved = _saved.contains(pair);  // Add this line.
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(   // Add the lines from here...
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {      // Add 9 lines from here...
        setState(() { // In Flutter's reactive style framework, calling setState() triggers a call to the build() method for the State object, resulting in an update to the UI.
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

}
