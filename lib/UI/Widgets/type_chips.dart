import 'package:flutter/material.dart';

class TypeChip extends StatelessWidget {
  final String type;
  final double fontsize;
  const TypeChip({Key? key, required this.fontsize, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#1
    if (type == 'normal') {
      return TextChip(
          fontsize: fontsize,
          typeStr: 'Normal',
          backgroundColor: Color(0xFFA4ACAF),
          textColor: Color(0xFF212121));
    }
    //#2
    else if (type == 'fighting') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFFD56723),
          textColor: Colors.white,
          typeStr: 'Fighting');
    }
    //#3
    else if (type == 'flying') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFF3DC7EF),
          backgroundColor2: Color(0xFFBDB9B8),
          textColor: Color(0xFF212121),
          typeStr: 'Flying');
    }
    //#4
    else if (type == 'poison') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFFB97FC9),
          textColor: Color(0xFFFFFFFF),
          typeStr: 'Poison');
    }
    //#5
    else if (type == 'ground') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFFF7DE3F),
          backgroundColor2: Color(0xFFAB9842),
          textColor: Color(0xFF212121),
          typeStr: 'Ground');
    }
    //#6
    else if (type == 'rock') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFFA38C21),
          textColor: Color(0xFFFFFFFF),
          typeStr: 'Rock');
    }
    //#7
    else if (type == 'bug') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFF729F3F),
          textColor: Color(0xFFFFFFFF),
          typeStr: 'Bug');
    }
    //#8
    else if (type == 'ghost') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFF7B62A3),
          textColor: Color(0xFFFFFFFF),
          typeStr: 'Ghost');
    }
    //#8
    else if (type == 'steel') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFF9EB7B8),
          textColor: Color(0xFF212121),
          typeStr: 'Steel');
    }
    //#8
    else if (type == 'fire') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFFFD7D24),
          textColor: Color(0xFFFFFFFF),
          typeStr: 'Fire');
    }
    //#9
    else if (type == 'water') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFF4592C4),
          textColor: Color(0xFFFFFFFF),
          typeStr: 'Water');
    }
    //#10
    else if (type == 'grass') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFF9BCC50),
          textColor: Color(0xFF212121),
          typeStr: 'Grass');
    }
    //#11
    else if (type == 'electric') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFFEED535),
          textColor: Color(0xFF212121),
          typeStr: 'Electric');
    }
    //#12
    else if (type == 'psychic') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFFF366B9),
          textColor: Color(0xFFFFFFFF),
          typeStr: 'Psychic');
    }
    //#13
    else if (type == 'ice') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFF51C4E7),
          textColor: Color(0xFF212121),
          typeStr: 'ice');
    }
    //#14
    else if (type == 'dragon') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFF53A4CF),
          backgroundColor2: Color(0xFFF16E57),
          textColor: Color(0xFFFFFFFF),
          typeStr: 'Dragon');
    }
    //#15
    else if (type == 'dark') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFF707070),
          textColor: Color(0xFFFFFFFF),
          typeStr: 'Dark');
    }
    //#16
    else if (type == 'fairy') {
      return TextChip(
          fontsize: fontsize,
          backgroundColor: Color(0xFFFDB9E9),
          textColor: Color(0xFF212121),
          typeStr: 'Fairy');
    }
    //#17
    else if (type == 'unknown') {
      return Container();
    }
    //#18
    else if (type == 'shadow') {
      return Container();
    } else {
      return Container();
    }
  }
}

class TextChip extends StatelessWidget {
  final String typeStr;
  final Color backgroundColor;
  final Color? backgroundColor2;
  final double fontsize;
  final Color textColor;
  const TextChip(
      {Key? key,
      this.backgroundColor2,
      required this.backgroundColor,
      required this.fontsize,
      required this.textColor,
      required this.typeStr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: backgroundColor2 != null
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [backgroundColor, backgroundColor2!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(5.0),
              )
            : BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
        padding: EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          top: 1.0,
          bottom: 3.0,
        ),
        child: Text(
          typeStr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
