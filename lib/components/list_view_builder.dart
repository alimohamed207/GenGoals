import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/components/list_tile.dart';
import 'package:flutter_samples/models/list_tile_model.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    super.key,
    required this.objectsList,
  });
  final List<ListTileModel> objectsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: objectsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListViewTile(
              object: objectsList[index],
            ),
          );
        },
      ),
    );
  }
}
