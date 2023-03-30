import 'dart:convert';

import 'package:desafio_flutter/models/timeline.dart';
import 'package:desafio_flutter/models/user.dart';
import 'package:desafio_flutter/pages/widgets/timeline.dart';
import 'package:desafio_flutter/pages/widgets/avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var stories = <User>[];
  var timeline = <Timeline>[];

  @override
  initState() {
    super.initState();
    _loadStores();
    _loadTimeline();
  }

  Future<void> _loadStores() async {
    final userJson = await rootBundle.loadString('assets/usuario.json');

    setState(() {
      var userList = json.decode(userJson);
      stories = userList.map<User>((storie) => User.fromMap(storie)).toList();
    });
  }

  Future<void> _loadTimeline() async {
    final timelineJson = await rootBundle.loadString('assets/timeline.json');

    setState(() {
      var timelineList = jsonDecode(timelineJson);
      timeline = timelineList
          .map<Timeline>((value) => Timeline.fromMap(value))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.maps_ugc_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    var storieAtual = stories[index];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ImageAvatar(
                        userName: storieAtual.userName,
                        aoVivo: storieAtual.aoVivo,
                        urlImage: storieAtual.urlImage,
                      ),
                    );
                  },
                ),
              ),
              Divider(
                height: 2,
                color: Colors.grey.withOpacity(0.9),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: timeline.length,
                  itemBuilder: (context, index) {
                    var postAtual = timeline[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 8.0),
                      child: FeedWidget(
                          urlPerfil: postAtual.urlPerfil,
                          userName: postAtual.userName,
                          urlImage: postAtual.urlImage,
                          curtidas: postAtual.curtidas,
                          comentarios: postAtual.comentarios,
                          descricao: postAtual.descricao),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        enableFeedback: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline_sharp),
            label: 'Hells',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Loja',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'Perfil',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
