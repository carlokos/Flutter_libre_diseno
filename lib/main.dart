import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: HomePage()
  )
);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Primero configuramos la barra de arriba, sera transparente con unos botones que no 
      //funcionan
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text("Shoes", style: TextStyle(color: Colors.black, fontSize: 25),),
        actions: <Widget>[
          IconButton(onPressed: null, 
            icon: Icon(Icons.notifications_none, color: Colors.black,),
            ),
          IconButton(onPressed: null, 
            icon: Icon(Icons.shopping_cart, color: Colors.black,),
            )
        ],
      ),
      //hacer aqui los objetos
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              //nosotros tenemos que crear las carpetas, no estan por defecto
              //entre objetos he puesto aunque se supone que cada "makeItem" ya lo lleva
              SizedBox(height: 20,),
              makeItem(image: 'assets/images/zapato1.jpg', identificador: '1', context: context),
              Padding(padding: EdgeInsets.all(10),),
              makeItem(image: 'assets/images/zapato2.jpg', identificador: '2', context: context),
              Padding(padding: EdgeInsets.all(10),),
              makeItem(image: 'assets/images/zapato3.jpg', identificador: '3', context: context),
            ],
          ),
        ),
      ),
    );
  }

  //widget que usaremos para crear los objetos de la lista
  Widget makeItem({image, identificador, context}) {
    //la clase hero permite usar animaciones y su tag actua como identificador,
    // en este caso no he usado nada mas que la animacion por defecto que tiene el widget
    // ya que la dependencia me daba errores
    return Hero(
      tag: identificador, 
      child: GestureDetector(
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              //la imagen ocupara toda la tarjeta
              image: AssetImage(image),
              fit: BoxFit.cover
            ),
            boxShadow: [
              //sombra que decora la tarjeta del objeto
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(0, 10)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      //al principio de cada columna (child) se escribira los siguientes textos
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Sneakers", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold,),),
                        SizedBox(height: 10,),
                        Text("Disponibles", style: TextStyle(color: Colors.white, fontSize: 20),),
                      ],
                    ),
                  ),
                  //Container con la imagen para añadir a favoritos
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: Center(
                      child: Icon(Icons.favorite_border, size: 20,),
                    ),
                  )
                ],
              ),
              Text("80€", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}

