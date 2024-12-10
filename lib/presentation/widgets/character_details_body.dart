import 'package:character_app/data/models/characters_model/CharactersModel.dart';
import 'package:character_app/data/models/characters_model/details_items_model.dart';
import 'package:flutter/material.dart';

import 'custom_text_rich.dart';

class CharactersDetailsBody extends StatelessWidget {
  const CharactersDetailsBody({super.key, required this.charactersModel});
  final CharactersModel charactersModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final details = <DetailItem>[
      DetailItem(label: 'Name', value: charactersModel.name!),
      DetailItem(label: 'Gender', value: charactersModel.gender!),
      DetailItem(label: 'Status', value: charactersModel.status!),
      DetailItem(label: 'Species', value: charactersModel.species!),
      DetailItem(label: 'Location Name', value: charactersModel.locationName!),
      DetailItem(label: 'Origin Name', value: charactersModel.originName!),
      if (charactersModel.type!.isNotEmpty)
        DetailItem(label: 'Type', value: charactersModel.type!),
      if (charactersModel.episode!.isNotEmpty)
        DetailItem(
          label: 'Episode',
          value: "\n${charactersModel.episode!.join(' \n ')}",
        ),
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,
      itemBuilder: (context, index) {
        final detail = details[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: detail.label,
              value: detail.value,
            ),
            if (index == details.length - 1) ...{SizedBox(height: width * 2)}
          ],
        );
      },
    );
  }
}
