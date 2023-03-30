import 'package:flutter/material.dart';

class ImageAvatar extends StatelessWidget {
  final String urlImage;
  final bool aoVivo;
  final String userName;

  const ImageAvatar({
    super.key,
    required this.urlImage,
    required this.aoVivo,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Colors.purple,
                Colors.pink,
                Colors.yellow,
                Colors.orange,
              ], begin: Alignment.topCenter),
              borderRadius: BorderRadius.circular(100),
              color: Colors.pink),
        ),
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(urlImage),
          ),
        ),
        aoVivo
            ? Container(
                width: 80,
                height: 80,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'AO VIVO',
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
                ),
              )
            : Container(
                color: Colors.transparent,
              ),
        Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              overflow: TextOverflow.ellipsis,
              userName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
