import 'package:flutter/cupertino.dart';

class character {
  final String name;
  final String village;
  final String rank;
  final String age;
  final String firstAppearance;
  final String quote;
  final String signatureMove;
  final Image image;

  character(
    {
      this.name,
      this.village,
      this.rank,
      this.age,
      this.firstAppearance,
      this.quote,
      this.signatureMove,
      this.image,
    }
  );
}
