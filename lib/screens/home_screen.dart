import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http_hp/providers/data_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.title),
      ),
      body: Consumer<DataProvider>(
        builder: (_, snapshot, __) {
          if (snapshot.episodePage == null) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.errorMessage != null) {
            return Center(child: Text(snapshot.errorMessage));
          }

          if (snapshot.episodes.isEmpty) {
            return Center(child: Text('Empty list of episodes'));
          }

          final results = snapshot.episodes;
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (_, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    results[index].episode,
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                ),
                title: Text(results[index].name),
                subtitle: Text(results[index].airDate),
                trailing:
                    Text('Characters ${results[index].characters.length}'),
              );
            },
          );
        },
      ),
    );
  }
}
