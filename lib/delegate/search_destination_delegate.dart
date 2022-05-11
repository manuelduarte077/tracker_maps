import 'package:flutter/material.dart';

class SearchDestinationDelegate extends SearchDelegate {
  SearchDestinationDelegate()
      : super(
          searchFieldLabel: 'Search for a destination...',
          searchFieldStyle: const TextStyle(fontSize: 15),
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(child: Text('Search Results'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.location_on_outlined, color: Colors.black),
          title: const Text('Search Suggestion',
              style: TextStyle(color: Colors.black)),
          onTap: () {
            close(context, 'Search Suggestion');
          },
        ),
      ],
    );
  }
}
