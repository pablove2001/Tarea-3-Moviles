import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final List<Map<String, String>> _listElements = [
    {
      "nombre": "Barcelona",
      "imagen":
          "https://lanzateyviaja.com/wp-content/uploads/2019/09/barcelona-espa%C3%B1a.jpg?ezimgfmt=rs:693x390/rscb41/ng:webp/ngcb41",
    },
    {
      "nombre": "Dubái",
      "imagen":
          "https://lanzateyviaja.com/wp-content/uploads/2019/09/emiratos-arabes-unidos.jpg?ezimgfmt=rs:693x462/rscb41/ng:webp/ngcb41",
    },
    {
      "nombre": "Bali",
      "imagen":
          "https://lanzateyviaja.com/wp-content/uploads/2019/09/Bali-Indonesia.jpg?ezimgfmt=rs:693x520/rscb41/ng:webp/ngcb41",
    },
    {
      "nombre": "Machu Pichu",
      "imagen":
          "https://lanzateyviaja.com/wp-content/uploads/2019/09/machupichu-peru.jpg?ezimgfmt=rs:693x390/rscb41/ng:webp/ngcb41",
    },
    {
      "nombre": "Taj Mahal",
      "imagen":
          "https://lanzateyviaja.com/wp-content/uploads/2019/09/taj-mahal-india.jpg?ezimgfmt=rs:693x462/rscb41/ng:webp/ngcb41",
    },
    {
      "nombre": "Sevilla",
      "imagen":
          "https://lanzateyviaja.com/wp-content/uploads/2019/09/sevilla-espa%C3%B1a.jpg?ezimgfmt=rs:693x110/rscb41/ng:webp/ngcb41",
    },
    {
      "nombre": "Río de Janeiro",
      "imagen":
          "https://lanzateyviaja.com/wp-content/uploads/2019/09/rio-de-janeiro-brasil.jpg?ezimgfmt=rs:693x110/rscb41/ng:webp/ngcb41",
    },
    {
      "nombre": "Oslo",
      "imagen":
          "https://lanzateyviaja.com/wp-content/uploads/2019/09/oslo-noruega.jpg?ezimgfmt=rs:693x520/rscb41/ng:webp/ngcb41",
    },
    {
      "nombre": "Playa del Carmen",
      "imagen":
          "https://lanzateyviaja.com/wp-content/uploads/2019/09/playa-del-carmen-mexico.jpg?ezimgfmt=rs:693x520/rscb41/ng:webp/ngcb41",
    },
    {
      "nombre": "Marrakech",
      "imagen":
          "https://lanzateyviaja.com/wp-content/uploads/2019/09/marrakech-marruecos.jpg?ezimgfmt=rs:693x520/rscb41/ng:webp/ngcb41",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://imgs.search.brave.com/6oMq49hGXS-C5NVf4n4CyEqKG0J3M9em_xjVNbola8k/rs:fit:760:407:1/g:ce/aHR0cHM6Ly9jYXNh/eWRpc2Vuby5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMjAv/MDkvc3VpemEtaG90/ZWxlcy1sdWpvLmpw/Zw"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                            index: index,
                            nombre: _listElements[index]["nombre"]!,
                            imagen: _listElements[index]["imagen"]!,
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                              content: Text('Reservación en progreso')));
                      },
                      child: Text(
                        "Start booking",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
