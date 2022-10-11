import 'package:flutter/widgets.dart';
import 'package:nubank_exercise/app/screens/home/link_list_item.dart';
import 'package:nubank_exercise/domain/entities/link.dart';

class LinkList extends StatelessWidget {
  const LinkList(
    this.links, {
    Key? key,
  }) : super(key: key);
  final List<Link> links;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key('linkListView'),
      padding: const EdgeInsets.only(bottom: 16),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: links.length,
      itemBuilder: (context, index) => LinkListItem(links[index]),
    );
  }
}