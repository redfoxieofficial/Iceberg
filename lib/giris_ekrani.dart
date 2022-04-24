// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:app/soru-cevap.dart';
import 'package:flutter/material.dart';

class giris_ekrani extends StatelessWidget {
  const giris_ekrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      logo(),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(0)),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => soru_cevap())));
              },
              child: Text("Başla",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 80, 200, 255),
                      fontSize: 25)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 50),
                primary: Colors.black,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          ///////////////////////////////////////////////////////////
          Container(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Yardım"),
                        content: SingleChildScrollView(
                          child: Text(
                              "Buz Dağı uygulaması bir soru çözme uygulamasıdır. Gelen soru karşısında dört şıktan birini seçerek bir cevap vermek ya da boş geçmek zorundasınız. Doğru yapıldığı taktirde 10 puan kazanılacak, yanlış yapıldığı taktirde 10 puan kaybedilecektir. Aynı zamanda yanlış yapıldığında doğru cevap gösterilecektir."),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Kapat"))
                        ],
                      );
                    });
              },
              child: Text("Yardım",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 80, 200, 255),
                      fontSize: 25)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 50),
                primary: Colors.black,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          ///////////////////////////////////////////////
          Container(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Çık",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 80, 200, 255),
                      fontSize: 25)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 50),
                primary: Colors.black,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          versiyon()
        ],
      )
    ]);
  }

  Container versiyon() {
    return Container(
        margin: EdgeInsets.all(36),
        alignment: Alignment(0.0, -1.0),
        child: Text("Version 1.0"));
  }

  Container logo() {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 40),
      alignment: Alignment.center,
      child: CircleAvatar(
          radius: 100,
          foregroundColor: Color.fromARGB(255, 80, 200, 255),
          backgroundColor: Colors.black,
          backgroundImage: AssetImage("assets/iceberg.jpg")
          // child: Icon(
          //   Icons.question_answer_outlined,
          //   size: 70,
          // ),
          ),
    );
  }
}
