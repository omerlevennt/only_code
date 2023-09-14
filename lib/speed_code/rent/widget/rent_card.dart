import 'package:flutter/material.dart';
import 'package:only_code/speed_code/rent/modal/rent_modal.dart';
import 'package:only_code/speed_code/rent/utility/project_padding.dart';
import 'package:only_code/speed_code/rent/utility/project_radius.dart';

class RentCard extends StatelessWidget {
  const RentCard({super.key, required this.model});
  final RentModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: ClipRRect(
          borderRadius: ProjectRadius.borderRadiusCircularNormal,
          child: Image.network(fit: BoxFit.cover, model.imagePath),
        )),
        Expanded(
            child: Padding(
          padding: ProjectPadding.paddingOnlyLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              Text(model.subTitle),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.attach_money),
                  Text('${model.price}'),
                  const Spacer(),
                  const Text('Random')
                ],
              ),
            ],
          ),
        ))
      ],
    );
  }
}
