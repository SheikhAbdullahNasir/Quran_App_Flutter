// import 'package:flutter/material.dart';

// void main(List<String> args) {
  


//   runApp(const Myapp());
// }

// class Myapp extends StatefulWidget {
//   const Myapp({super.key});

//   @override
//   State<Myapp> createState() => _MyappState();
// }

// class _MyappState extends State<Myapp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: SurahIndexSCR(),);
//   }
// }



// class SurahIndexSCR extends StatefulWidget {
//   const SurahIndexSCR({super.key});

//   @override
//   State<SurahIndexSCR> createState() => _SurahIndexSCRState();
// }

// class _SurahIndexSCRState extends State<SurahIndexSCR> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: 114,
//         itemBuilder: (context, index) {
//           return ListTile(leading: CircleAvatar(child: Text("${index+1}"),),);
//         },
//       ),
//     );
//   }
// }




import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("QuranApp", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 114,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailSurah(index + 1)),
              );
            },
              leading: CircleAvatar(child: Text("${index + 1}")),
              
              // title: Center(child: Text(quran.getSurahName(index + 1))),
              title: Text(
                quran.getSurahName(index + 1), 
                style: GoogleFonts.amiriQuran(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold
                  ),
                ),

              subtitle: Text(
                quran.getSurahNameArabic(index + 1),
                style: GoogleFonts.notoNaskhArabic(
                  fontSize: 20, 
                  fontWeight: FontWeight.normal
                  ),
                ),
              // subtitle: Text(quran.getSurahNameArabic(index + 1)),
              // subtitleTextStyle: TextStyle(color: Colors.grey),

              trailing: Text(quran.getVerseCount(index+1).toString()),

              // iconColor: Colors.cyan,
              // textColor: Colors.black,
          );
        },
      ),
    );
  }
}

class DetailSurah extends StatefulWidget {
  var getSurahNum;
  DetailSurah(this.getSurahNum, {super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(quran.getSurahName(widget.getSurahNum),style: GoogleFonts.amiriQuran(fontSize: 30, fontWeight: FontWeight.bold),),),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView.builder(
            itemCount: quran.getVerseCount(widget.getSurahNum),
            itemBuilder: (context, index) {
              return ListTile(
              
                title: Text(
                  quran.getVerse(
                    widget.getSurahNum,
                    index + 1,
                    verseEndSymbol: true,
                  ),
                  textAlign: TextAlign.right,
                  style: GoogleFonts.amiriQuran(fontSize: 25, fontWeight: FontWeight.normal),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
