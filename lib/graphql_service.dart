import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static final HttpLink httpLink = HttpLink(
    'https://graphqlzero.almansi.me/api',
  );

  static final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  );

  static final String getPosts = """
    query {
       posts {
        data {
          id
          title
          body
        }
      }
    }
  """;

  static Future<QueryResult> getPostsList() async {
    final QueryOptions options = QueryOptions(
      document: gql(getPosts),
    );

    final QueryResult result = await client.query(options);
    return result;
  }
}
