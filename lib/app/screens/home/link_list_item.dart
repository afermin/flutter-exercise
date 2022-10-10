import 'package:flutter/material.dart';
import 'package:nubank_exercise/domain/entities/link.dart';

class LinkListItem extends StatelessWidget {
  const LinkListItem(
    this.link, {
    Key? key,
  }) : super(key: key);

  final Link link;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            link.short,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            link.self,
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }
}
