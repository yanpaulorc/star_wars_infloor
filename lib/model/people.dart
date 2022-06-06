import 'package:flutter/material.dart';
import 'package:star_wars/custom/text_style_custom.dart';

class ListPeople extends StatelessWidget {
  const ListPeople({
    Key? key,
    required this.dadosPersonagem,
    required this.listaStarShips,
  }) : super(key: key);

  final Map dadosPersonagem;
  final List listaStarShips;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          dadosPersonagem['name'],
          style: CustomText().titulo,
        ),
        subtitle: Text(
          '${dadosPersonagem['birth_year']}',
          style: CustomText().subTituloLight,
        ),
        children: [
          SizedBox(
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        'Genre: ',
                        style: CustomText().subTituloBold,
                      ),
                      Text(
                        '${dadosPersonagem['gender']}',
                        style: CustomText().subTituloLight,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Row(
                    children: [
                      Text('Height: ', style: CustomText().subTituloBold),
                      Text(
                        '${dadosPersonagem['height']}cm',
                        style: CustomText().subTituloLight,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Row(
                    children: [
                      listaStarShips.isNotEmpty
                          ? Text(
                              'Possui nave',
                              style: CustomText().subTituloBold,
                            )
                          : Text(
                              'Não possui nave',
                              style: CustomText().subTituloBold,
                            )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
