import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_flutter/all_search.dart/dept_search.dart';
import 'package:provider_api_flutter/models/cart_info_provider.dart';
import 'package:provider_api_flutter/models/dept_info.dart';
import 'package:provider_api_flutter/models/dept_info_provider.dart';
import 'package:provider_api_flutter/screens/cart_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var info = Provider.of<Dept_Info_Provider>(context);
    var cartInfo = Provider.of<Cartinfoprovider>(context);
    //var info_img = Provider.of<Img_List_Provider>(context);
    return FutureBuilder(
        future: info.hitApi(),
        builder: (context, AsyncSnapshot<List<Dept_Info>> snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Flutter Provider Api"),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: !snapshot.hasData
                        ? null
                        : () {
                            showSearch(
                              context: context,
                              delegate: Dept_Search(snapshot.data),
                            );
                          }),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cartscreen()),
                    );
                  },
                ),
              ],
            ),
            body: Container(
              child: snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: snapshot.data.length > 0
                              ? cartInfo
                                  .addToCart(snapshot.data[index].deptName)
                              : () {},
                          //info.addToCart(snapshot.data[index].deptName),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                snapshot.data[index].deptName,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        });
  }
}

/*
return FutureBuilder(
        future: info.hitApi(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Flutter Provider Api"),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: !snapshot.hasData
                        ? null
                        : () {
                            showSearch(
                              context: context,
                              delegate: Dept_Search(snapshot.data),
                            );
                          }),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cartscreen()),
                    );
                  },
                ),
              ],
            ),
            body: Container(
              child: snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: info.addToCart(snapshot.data[index].deptName),
                          //info.addToCart(snapshot.data[index].deptName),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                snapshot.data[index].deptName,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        });
*/

/*
FutureBuilder<List<Dept_Info>>(
 CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
              ),
              items: snapshot.data.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Image.network(
                        'http://192.168.10.7/db_samples/images/' + i.img,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            );*/
