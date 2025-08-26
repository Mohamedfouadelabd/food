import 'package:flutter/material.dart';

import '../Theme/my_Theme.dart';
import 'Cubit/search_view.dart';

class SearchTap extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        color: MyTheme.white,
        child: Center(child: Text('What meal do you want to search for?')),
      );
    }
    return Column(
      children: [
        Expanded(child: SearchView(Mealname: query)),
      ],
    );
  }
}
