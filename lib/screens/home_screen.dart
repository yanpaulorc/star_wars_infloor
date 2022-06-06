import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars/model/people.dart';
import 'package:star_wars/model/starship.dart';
import '../custom/text_style_custom.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String url = 'https://swapi.dev/api/people/?format=json';

  List _listaPersonagem = [];

  personagens() async {
    try {
      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);
      Map<String, dynamic> dados = json;
      final mapPersonagens = dados['results'];
      _listaPersonagem = mapPersonagens;
      setState(() {});
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    personagens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Star Wars',
          style: GoogleFonts.actor(),
        ),
      ),
      body: ListView.builder(
        itemCount: _listaPersonagem.length,
        itemBuilder: (context, index) {
          final dadosPersonagem = _listaPersonagem[index];
          List listaStarShips = dadosPersonagem['starships'];
          if (listaStarShips.isNotEmpty) {
            for (var item in listaStarShips) {
              _verirficarStarships(item);
            }
          } else {}
          return ListPeople(
              dadosPersonagem: dadosPersonagem, listaStarShips: listaStarShips);
        },
      ),
    );
  }

  Future<Starship> _verirficarStarships(String url) async {
    final resp = await http.get(Uri.parse(url));
    final decodedData = json.decode(resp.body);
    final startship = Starship.fromJsonMap(decodedData);
    print(startship.name);
    return startship;
  }
}
