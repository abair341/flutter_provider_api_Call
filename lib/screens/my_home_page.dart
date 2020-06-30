import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_flutter/models/dept_info.dart';
import 'package:provider_api_flutter/models/dept_info_provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  hitApi() async {
    Dept_Info dept_info =
        await Provider.of<Dept_Info_Provider>(context).hitApi();
    Provider.of<Dept_Info_Provider>(context).setData(dept_info);
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<Dept_Info_Provider>(context).list.toString().length);

    return Scaffold(
      appBar: AppBar(title: Text("Flutter Provider Api")),
      body: Provider.of<Dept_Info_Provider>(context).list.toString().length > 0
          ? ListView.builder(
              itemCount: Provider.of<Dept_Info_Provider>(context)
                  .list
                  .toString()
                  .length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Provider.of<Dept_Info_Provider>(context)
                              .getData()
                              .deptId ==
                          null
                      ? Text("null")
                      : Text(Provider.of<Dept_Info_Provider>(context)
                          .getData()
                          .deptId),
                );
              })
          : CircularProgressIndicator(),
    );
  }
}