import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Heart Shape with Network Image')),
        body: const Center(
          child: ClipPathExample(),
          // child: HeartImage(
          //   imageUrl: 'https://fastly.picsum.photos/id/1/200/300.jpg?hmac=jH5bDkLr6Tgy3oAg5khKCHeunZMHq0ehBZr6vGifPLY',
          // ),
        ),
      ),
    );
  }

}



class ClipPathExample extends StatefulWidget {
  const ClipPathExample({Key? key}) : super(key: key);

  @override
  State<ClipPathExample> createState() => _ClipPathExampleState();
}

class _ClipPathExampleState extends State<ClipPathExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('ClipPath Example'),
      ),
      body: Center(
        child: ClipPath(
          // Define a custom path to clip the child
          clipper: MyClipper(),
          child: Container(
            width: 200,
            height: 200,
            decoration:const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.white, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                'ClipPath',
                style: TextStyle(
                  color: const Color.fromARGB(255, 117, 95, 95),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Define a custom path to create a stylish clipped shape
    var path = Path();
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(size.width * 0.8, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}