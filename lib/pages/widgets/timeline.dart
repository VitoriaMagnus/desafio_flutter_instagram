import 'package:flutter/material.dart';

class FeedWidget extends StatelessWidget {
  final String urlPerfil;
  final String userName;
  final String urlImage;
  final int curtidas;
  final int comentarios;
  final String descricao;

  const FeedWidget({
    Key? key,
    required this.urlPerfil,
    required this.userName,
    required this.urlImage,
    required this.curtidas,
    required this.comentarios,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(urlPerfil),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      userName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border_sharp),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.mode_comment_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.near_me_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.turned_in_not_outlined),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Text(
            '$curtidas curtidas',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '$userName ',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: descricao,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
          child: InkWell(
            child: Text('Ver todos os $comentarios comentarios',
                style: const TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
