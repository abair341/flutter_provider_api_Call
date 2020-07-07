import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_flutter/models/dept_info_provider.dart';

class Dept_Search extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      height: 100.0,
      child: Card(
        child: Text(
          query,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchinfo = Provider.of<Dept_Info_Provider>(context);
    // TODO: implement buildSuggestions
    return FutureBuilder(
      future: searchinfo.hitApi(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Text(
                snapshot.data[index].deptName,
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
