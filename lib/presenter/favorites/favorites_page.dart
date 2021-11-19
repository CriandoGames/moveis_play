import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Meus Favoritos',
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
      ),
      body: Container(),
    );
  }
}
