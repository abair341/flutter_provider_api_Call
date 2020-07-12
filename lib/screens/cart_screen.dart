import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_flutter/models/cart_info_provider.dart';

class Cartscreen extends StatefulWidget {
  @override
  _CartscreenState createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    var infoo = Provider.of<Cartinfoprovider>(context);
    print(infoo.cartlist.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen'),
      ),
      body: infoo.cartlist.length > 0
          ? ListView.builder(
              itemCount: infoo.cartlist.length,
              itemBuilder: (context, index) {
                return Text('ok');
              },
            )
          : Text('no Data'),
    );
  }
}
