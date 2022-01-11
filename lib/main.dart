import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'; //para llamada http

void main() => runApp(MetodoGet());


// class PantallaApp extends StatelessWidget{
//   @override 
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.red),
//       home: FirstScreen(),
//     );
//   }
// }

// class FirstScreen extends StatelessWidget {
//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menu de opciones'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text('abrir segunda pantalla'),
//           onPressed: () {
//             //navigator usa metodo push para mostrar segunda pagina
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => SecondScreen(),
//             ));
//           },
//         )
                
//       ),
            
      
//     );
//  }
// }

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('segunda pantalla')),
      body: Center(
        child: RaisedButton(
          child: Text('volver a primer pantalla'),
          onPressed: () {
            //estando en segunda pagina, navigator usa el metodo pop para ir para atras y volver a la pagina 1
            Navigator.of(context).pop(); 
          },
        )
      ),

    );
  }
}


//PANTALLA DE FORMULARIO
// class Form extends StatelessWidget{
//   @override 
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginForm(),
//     );
//   }
// }

// class LoginForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 15),
//           height: MediaQuery.of(context).size.height,
//           child: Form(
//             child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(hintText: 'Email'),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 obscureText: true,
//                 decoration: InputDecoration(hintText: 'Password'),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             Container(
//               height: 45,
//               width: MediaQuery.of(context).size.width,
//               child: RaisedButton(
//                 color: Colors.blueAccent,
//                 onPressed: () {},
//                 child: Text(
//                   'Login',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             )
//             ],  
//             ), 
//           )
//         ),
//       ),
//     );
//   }
// }



//LLAMADA HTTP

class MetodoGet extends StatefulWidget {

  @override
  _MetodoGetState createState() => _MetodoGetState();
}

class _MetodoGetState extends State<MetodoGet> {

  final url = 'https://jsonplaceholder.typicode.com/posts';
  var _postsJson = [];

  void fetchPost() async {

    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });

    } catch (err) {}
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: _postsJson.length,
          itemBuilder: (context, i) {
            final post = _postsJson[i];
            return Text('Title: ${post['title']}\n Body: ${post['body']}\n\n');
          }
        ),
      ),
    );
  }
}
