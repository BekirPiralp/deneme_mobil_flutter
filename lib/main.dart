import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquee/marquee.dart';
import 'dart:async'; //sayaç kütüphanesi

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '17 nisan 2021',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mobil programlama'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //değişkenler

  int sayimiz = 2021;
  int _sayimiz2 = 12;
  int ekran = 0;
  int sure = 0, durdur = 0;
  var ekrandakiWidget;

  // fonksiyonlar

  void onGirisClick() {
    setState(() {
      ekran++;
      sure = 0;
      durdur =0;
    });
    // zamanlayıcı
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (durdur == 1) {
        timer.cancel();
      } else {
        setState(() {
          sure++;
        });
      }
    });
  }

  void onCikisClick() {
    setState(() {
      ekran--;
      durdur = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //değişkenler
    String metin = "2021 Uygulamamıza hoş geldiniz.";
    //tanımlamalar
    if (ekran == 0)
      ekrandakiWidget = <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Başlangıç Ekranı'),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Öğrenci numaranız",
            labelStyle: TextStyle(color:Colors.green,fontSize: 20,
            ),
          ),
          maxLength: 9,
          maxLines: 1,
          //sadece rakam alması için
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Şifrenizi girin',
          ),
          cursorColor: Colors.amber,
          // renk imleç
          cursorWidth: 10,
          // yükseklik imleç
          maxLength: 11,
          maxLines: 1, //en fazla kaç satır olduğu
        ),
        ElevatedButton(
            onPressed: onGirisClick,
            child: const Text(
              'Giriş',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ];
    else if (ekran == 1)
      ekrandakiWidget = <Widget>[
        Text(
          'Hoşgeldiniz!',
        ),
        Padding(padding: const EdgeInsets.all(20),
          child: Text(
              "Geçen Süre : $sure"
          ),
        ),
        ElevatedButton(
          onPressed: onCikisClick,
          child: Text(
            'Çıkış',
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
        ),
        ElevatedButton(
          child: Text('Bekir Piralp'),
          onPressed: () {
            print('consolda basıldığı zaman tetiklenir');
          },
        ),
        Text(
          'Sayimiz: $sayimiz',
        ),
        Text('Sayimiz2: $_sayimiz2'),
        Container(
          color: Colors.red,
          height: 20,
          child: Marquee(
            //text: 'Some sample text that takes some space.',
            text: metin,
            style: TextStyle(fontWeight: FontWeight.bold),
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 100.0,
            pauseAfterRound: Duration(seconds: 1),
            showFadingOnlyWhenScrolling: true,
            fadingEdgeStartFraction: 0.1,
            fadingEdgeEndFraction: 0.1,
            numberOfRounds: 3,
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
        ),
      ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //body:Center(
      //body: Padding(
      // padding: EdgeInsets.all(12.0),
      body: Center(
        child: Column(
          children: ekrandakiWidget,
        ),
      ),
    );
  }
}
