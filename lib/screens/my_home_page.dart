import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_flutter/models/dept_info_provider.dart';
import 'package:provider_api_flutter/models/img_list.dart';
import 'package:provider_api_flutter/models/img_list_provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var info = Provider.of<Dept_Info_Provider>(context);
    var info_img = Provider.of<Img_List_Provider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Provider Api")),
      body: FutureBuilder(
        future: info.hitApi(),
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
      ),
    );
  }
}

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
