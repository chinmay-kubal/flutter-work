import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_service.dart';

class GraphQLScreen extends StatefulWidget {
  @override
  _GraphQLScreenState createState() => _GraphQLScreenState();
}

class _GraphQLScreenState extends State<GraphQLScreen> {
  late Future<QueryResult> _future;

  @override
  void initState() {
    super.initState();
    _future = GraphQLService.getPostsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GraphQL Screen'),
      ),
      body: FutureBuilder<QueryResult>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<QueryResult> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.data!['posts']['data'];

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final post = data[index];

                return ListTile(
                  title: Text(post['title']),
                  subtitle: Text(post['body']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
