// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, camel_case_types, unnecessary_new, prefer_const_constructors_in_immutables, avoid_returning_null_for_void, file_names

import 'dart:ffi';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getwidget/getwidget.dart';

Color renk = Colors.white;
Color dogru_isaretleme = Colors.white;
int puan = 0;
bool basildi = false;

class soru_cevap extends StatefulWidget {
  const soru_cevap({Key? key}) : super(key: key);

  @override
  State<soru_cevap> createState() => _soru_cevapState();
}

class _soru_cevapState extends State<soru_cevap> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> dataList = jsonDecode(sorular);
    int index_degeri = Random().nextInt(dataList.length);
    List butonlar = [
      yanlis_butonu(
        dataList: dataList,
        index_degeri: index_degeri,
        padding: 10,
        yanlis: "yanlis0",
      ),
      yanlis_butonu(
        dataList: dataList,
        index_degeri: index_degeri,
        padding: 10,
        yanlis: "yanlis1",
      ),
      ///////////////////////////////////////////////////////////////
      yanlis_butonu(
        dataList: dataList,
        index_degeri: index_degeri,
        padding: 10,
        yanlis: "yanlis2",
      ),

      ///////////////////////////////////////////////////////////////////

      ///////////////////////////////////////////////////////////////////////
      dogru_buton(dataList: dataList, index_degeri: index_degeri),
      ///////////////
    ];
    butonlar.shuffle();
    print(butonlar);

    return Scaffold(
      appBar: appbar(context),
      floatingActionButton: devam(dataList, butonlar),
      body: Center(
        child: Column(children: [
          Card(
            color: Colors.black,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.question_mark,
                    color: Colors.white,
                    size: 40,
                  ),
                  title: Text(
                    dataList[index_degeri]["Soru"],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Column(
                  children: [
                    butonlar[0],
                    butonlar[1],
                    butonlar[2],
                    butonlar[3],
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(100.0))),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.scoreboard),
                                  onPressed: () {},
                                ),
                                Text("Skor: $puan")
                              ],
                            ),
                          ),
                        ],
                      ),

                      ///////////////////////////////////////////////////////7
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  FloatingActionButton devam(List<dynamic> dataList, List siklar) {
    return FloatingActionButton(
        child: Icon(
          Icons.arrow_circle_right_outlined,
          size: 40,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          basildi = false;
          dogru_isaretleme = Colors.white;
          int index_degeri = Random().nextInt(dataList.length);
          renk = Colors.white;
          karistir(siklar);
          setState(() {});
        });
  }

  AppBar appbar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('Buz Dağı', style: TextStyle(fontStyle: FontStyle.normal)),
      backgroundColor: Colors.black,
      foregroundColor: Color.fromARGB(255, 80, 200, 255),
      actions: <Widget>[
        PopupMenuButton<int>(
          icon: Icon(Icons.home),
          iconSize: 42,
          padding: EdgeInsets.only(right: 20),
          onSelected: (item) {
            Navigator.of(context).pop();
          },
          itemBuilder: (context) => [
            PopupMenuItem<int>(value: 0, child: Text('Ana Sayfa')),
          ],
        ),
      ],
    );
  }
}

class dogru_buton extends StatefulWidget {
  const dogru_buton({
    Key? key,
    required this.dataList,
    required this.index_degeri,
  }) : super(key: key);

  final List dataList;
  final int index_degeri;

  @override
  State<dogru_buton> createState() => _dogru_butonState();
}

class _dogru_butonState extends State<dogru_buton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 15, left: 40, right: 40),
      child: ElevatedButton(
        onPressed: () async {
          if (basildi == true) {
            return null;
          } else {
            puan += 10;
          }
          basildi = true;
          dogru_isaretleme = Colors.green;
          await EasyLoading.showSuccess('Doğru Cevap!',
              duration: Duration(seconds: 1));
          setState(() {});
        },
        child: Text(widget.dataList[widget.index_degeri]["dogru"],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16)),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(300, 60),
          maximumSize: Size(300, 60),
          primary: dogru_isaretleme,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}

class yanlis_butonu extends StatefulWidget {
  yanlis_butonu({
    Key? key,
    required this.dataList,
    required this.index_degeri,
    required this.padding,
    required this.yanlis,
  }) : super(key: key);

  final List dataList;
  final int index_degeri;
  final double padding;
  final String yanlis;

  @override
  State<yanlis_butonu> createState() => _yanlis_butonuState();
}

class _yanlis_butonuState extends State<yanlis_butonu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: widget.padding, bottom: 15, left: 40, right: 40),
      child: ElevatedButton(
        onPressed: () async {
          if (basildi == true) {
            return null;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Doğru Cevap: ${widget.dataList[widget.index_degeri]["dogru"]}",
                style: TextStyle(fontSize: 19),
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ));
            puan -= 10;
          }
          basildi = true;

          await EasyLoading.showError('Yanlış Cevap!',
              duration: Duration(seconds: 1));
          renk = Colors.red;
          dogru_isaretleme = Colors.green;
          setState(() {});
        },
        child: Text(widget.dataList[widget.index_degeri][widget.yanlis],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16)),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(300, 60),
          maximumSize: Size(300, 60),
          primary: renk,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}

void karistir(List liste) {
  liste.shuffle();
}

////////////////////////////////////////////////////////////////////////////////////////
String sorular = """[
  {
    "Soru": "Antartika hangi yarım kürededir?",
    "yanlis0":"Kuzey Yarım Küre",
    "yanlis1":"Batı Yarım Küre",
    "yanlis2":"Doğu Yarım Küre",
    "dogru":"Güney Yarım Küre"
  },
  {
    "Soru": "Antarktika’nın sözcük anlamı nedir?",
    "yanlis0":"Güney Bölgesi",
    "yanlis1":"Arktik Üstü Bölge",
    "yanlis2":"Beyaz Bölge",
    "dogru":"Arktik Tersi Bölge"
  },
  {
    "Soru": "Antarktika’da kimler yaşar?",
    "yanlis0":"Eskimolar",
    "yanlis1":"Hiç kimse",
    "yanlis2":"Denizciler",
    "dogru":"Araştırmacılar"
  },
  {
    "Soru": "Antarktika’da kimler yaşar?",
    "yanlis0":"Eskimolar",
    "yanlis1":"Hiç kimse",
    "yanlis2":"Denizciler",
    "dogru":"Araştırmacılar"
  },
  {
    "Soru": "Antarktika nereye veya kime aittir?",
    "yanlis0":"Avrupa Birliği",
    "yanlis1":"NATO",
    "yanlis2":"Amerika’ya",
    "dogru":"Hiçbiri"
  },
  {
    "Soru": "Antarktika neden soğuktur?",
    "yanlis0":"Sera gazı fazla olduğu için",
    "yanlis1":"Karın güneş ışınlarını yansıttığı için",
    "yanlis2":"Güneş’e çok uzak olduğu için",
    "dogru":"Güneş ışınları eğik açıyla geldiği için"
  },
  {
    "Soru": "Antarktika’da ölçülen en yüksek sıcaklık nedir?",
    "yanlis0":"30,4 derece",
    "yanlis1":"10,7 derece",
    "yanlis2":"18,5 derece",
    "dogru":"20,4 derece"
  },
  {
    "Soru": "Antarktika’da ölçülen en yüksek sıcaklık nedir?",
    "yanlis0":"30,4 derece",
    "yanlis1":"10,7 derece",
    "yanlis2":"18,5 derece",
    "dogru":"20,4 derece"
  },
  {
    "Soru": "Antarktika’da ölçülen en düşük sıcaklık nedir?",
    "yanlis0":"- 100,9 derece",
    "yanlis1":"- 18,3 derece",
    "yanlis2":"- 50 derece",
    "dogru":"- 89,2 derece"
  },
  {
    "Soru": "Güney Işıkları neden oluşur?",
    "yanlis0":"Işık atmosferde renkli görülecek biçimde kırılır",
    "yanlis1":"Yıldızların hareketi atmosferde ışık yansımaları oluşturur",
    "yanlis2":"Kutuplardaki hava durumu ışık kırılmalarını etkiler",
    "dogru":"Dünya’nın manyetik alanı elektrik yüklerini kutuplara çeker"
  },
 
  {
    "Soru": "Güney Işıklarına ne ad verilir?",
    "yanlis0":"Aurora Borealis",
    "yanlis1":"Aurora Layman",
    "yanlis2":"Aurora Antarktis",
    "dogru":"Aurora Australis"
  },
  {
    "Soru": "Antarktika’da hangi canlı türü yaşar?",
    "yanlis0":"Kutup Ayıları",
    "yanlis1":"Kutup Tilkileri",
    "yanlis2":"Morslar",
    "dogru":"Penguenler"
  },
  {
    "Soru": "Antarktika’da kaç tür penguen yaşar?",
    "yanlis0":"16",
    "yanlis1":"7",
    "yanlis2":"2",
    "dogru":"5"
  },
  {
    "Soru": "Antarktika’daki penguenler nasıl sayılır?",
    "yanlis0":"Elektronik Küpe Yöntemiyle",
    "yanlis1":"Sürü Takip Yöntemiyle",
    "yanlis2":"Sürü Takip Yöntemiyle",
    "dogru":"Uydu görüntüleri kullanılarak"
  },
  {
    "Soru": "Antarktika’da hangi tür balina yaşamaz?",
    "yanlis0":"Kambur Balina",
    "yanlis1":"Katil Balina",
    "yanlis2":"Mavi Balina",
    "dogru":"Beyaz Balina"
  },
  {
    "Soru": "Dünya için en çok oksijen üreten canlı sınıfı hangisidir?",
    "yanlis0":"Ağaçlar",
    "yanlis1":"Çimenler",
    "yanlis2":"Çiçekler",
    "dogru":"Planktonlar ve Algler"
  },
  {
    "Soru": "Bazı buzullar neden yeşil veya kırmızı renkte görünür?",
    "yanlis0":"Güneş ışınlarının kırılma şeklinden dolayı",
    "yanlis1":"İçlerindeki minerallerden dolayı",
    "yanlis2":"Çevre kirliliğinden dolayı",
    "dogru":"Üzerlerindeki planktonlardan dolayı"
  },
  {
    "Soru": "Albedo nedir?",
    "yanlis0":"Buzulların ışığı yansıtma durumu",
    "yanlis1":"Işığın parlaklık ölçütü",
    "yanlis2":"Güneş ışınlarının atmosferden yansıması",
    "dogru":"Bir cismin ışığı yansıtma kapasitesi"
  },
  {
    "Soru": "Buzkıranlar ne iş yapar?",
    "yanlis0":"Buzulları kırarak fok balıklarına yol açar",
    "yanlis1":"Araştırma örneği olarak buzul toplarlar",
    "yanlis2":"Petrole ulaşmak için buzulları kırarlar",
    "dogru":"Buzulları kırarak gemilere yol açarlar"
  },
  {
    "Soru": "Antarktika’yı çevreleyen denize ne ad verilir?",
    "yanlis0":"Kuzey Buz Denizi",
    "yanlis1":"Atlas Okyanusu",
    "yanlis2":"Pasifik Okyanusu",
    "dogru":"Antarktika Okyanusu"
  },
  {
    "Soru": "Buzulların mavi veya şeffaf görünmelerinin nedeni nedir?",
    "yanlis0":"Kırıcılık indisi yüksek buzullar mavi, düşük buzullar şeffaf görünür",
    "yanlis1":"Yüksekteki buzullar gökyüzünü yansıttığı için mavi görünür, alçaktakiler şeffaftır",
    "yanlis2":"Mineral oranı fazla olan buzullar mavi, az olanlar şeffaftır",
    "dogru":"Yeni buzullar beyaz, eski buzullar mavi renk görünür"
  },
  {
    "Soru": "Antarktika’yı kimler keşfetti?",
    "yanlis0":"Amerikalılar",
    "yanlis1":"Norveçliler",
    "yanlis2":"Vikingler",
    "dogru":"İngilizler"
  },
  {
    "Soru": "Kutuplar bizim için neden önemlidir?",
    "yanlis0":"Kültürel çeşitlilik sağladıkları için",
    "yanlis1":"Kutuplarda araştırma yapmak önemli olduğu için",
    "yanlis2":"Kutuplarda bolca petrol bulunduğu için",
    "dogru":"Kutuplardaki hava koşullarının değişmesi ekolojiyi etkilediği için"
  },
  {
    "Soru": "Buzullar erirse aşağıdaki olaylardan hangisi gerçekleşmez?",
    "yanlis0":"Kutuplardaki hayvanlar ölür",
    "yanlis1":"Deniz seviyesi yükselir",
    "yanlis2":"Ekosistem zarar görür",
    "dogru":"Dünyanın ekseni değişir"
  },
  {
    "Soru": "Kutupları korumak için aşağıdakilerden hangisi yapılmalıdır?",
    "yanlis0":"Enerji israfı yapmak",
    "yanlis1":"Kutuplardaki petrolü çıkarmak",
    "yanlis2":"Denizlere çöp atmak",
    "dogru":"Atıkları geri dönüştürmek"
  },
  {
    "Soru": "Svalbard Küresel Tohum Deposu nerededir?",
    "yanlis0":"Antarktika’da ",
    "yanlis1":"Kanada’da",
    "yanlis2":"CERN’de ",
    "dogru":"Arktik’te"
  },
  {
    "Soru": "Kutuplardaki Türkler hangi dili konuşur?",
    "yanlis0":"Kırgız Türkçesi ",
    "yanlis1":"Türkiye Türkçesi",
    "yanlis2":"Kazak Türkçesi",
    "dogru":"Yakut Türkçesi"
  },
  {
    "Soru": "Kutuplardaki Türkler hangi dili konuşur?",
    "yanlis0":"Kırgız Türkçesi ",
    "yanlis1":"Türkiye Türkçesi",
    "yanlis2":"Kazak Türkçesi",
    "dogru":"Yakut Türkçesi"
  },
  {
    "Soru": "Aşağıdaki bilim insanlarından hangisinin soyadı Antarktika’da bir bölgeye verilmiştir?",
    "yanlis0":"Burcu Özsoy",
    "yanlis1":"Sinan Yirmibeşoğlu",
    "yanlis2":"Aziz Sancar",
    "dogru":"Serap Tilav"
  },
  {
    "Soru": "İlk Türk Kutup Kampı hangi yıl kurulmuştur?",
    "yanlis0":"2010",
    "yanlis1":"2005",
    "yanlis2":"2010",
    "dogru":"2019"
  },
  {
    "Soru": "Okyanuslarda dolaşımı sağlayan akıntı döngüsünün tamamlanması ne kadar sürer?",
    "yanlis0":"120 yıl",
    "yanlis1":"18 ay",
    "yanlis2":"16 hafta",
    "dogru":"1000 yıl"
  },
  {
    "Soru": "Hangisi Antarktika’da yerleşik insan yaşamı olmamasına karşın kirlilik olmasının nedenlerinden biri değildir?",
    "yanlis0":"Hava kirliliğinin rüzgarlarla taşınması",
    "yanlis1":"Akıntıların kirliliği taşıması",
    "yanlis2":"Gemilerin petrol sızıntıları",
    "dogru":"Kutup Sumrularının gittikleri yerden getirdikleri"
  }
]""";
