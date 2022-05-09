import 'package:flutter/material.dart';

class CenterScreen extends StatefulWidget {
  const CenterScreen({Key? key}) : super(key: key);

  @override
  _CenterScreen createState() => _CenterScreen();
}

class _CenterScreen extends State<CenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
            ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.black,
                      ),
                  ),
                ],
              ),
          ),
      ),
          const SizedBox(height: 30,),
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 350),
    );
  }

                    child: TextButton.icon (
                    icon: const Icon(Icons.monetization_on_sharp,),
                    label: const Text("Receita"),
                    style: TextButton.styleFrom(
                      primary: Colors.green,
                      textStyle: const TextStyle(fontSize: 22, fontFamily: 'Raleway'),
                    ),
                    onPressed: () {},
                  )

                                    child: SizedBox.fromSize(
                    size: const Size(56, 56),
                    child: ClipOval(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          splashColor: Colors.green,
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.monetization_on_sharp, size: 35, color: Colors.green,),
                              Text("Receita", style: TextStyle(fontSize: 20, color: Colors.green, fontFamily: 'Raleway'),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )

                  ElevatedButton.icon(
                  icon: const Icon(
                    Icons.monetization_on_sharp,
                    size: 35,
                    color: Colors.green,
                  ),
                  label: const Text("Receita:",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {},

                          body: Container(
          height: 275,
          width: double.infinity,
          color: Colors.white,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
            child: Container(
                color: Colors.purple,
                //padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
                margin: const EdgeInsets.fromLTRB(30, 150, 200, 50),
                child: SizedBox.fromSize(
                  size: const Size(56, 56),
                  child: ClipOval(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.monetization_on_sharp,
                              size: 35,
                              color: Colors.green,
                            ),
                            Text(
                              "Receita",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ),
 */
