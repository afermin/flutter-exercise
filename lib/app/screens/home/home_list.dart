import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank_exercise/app/screens/home/link_list_item.dart';
import 'package:nubank_exercise/app/screens/home/state_management/home_cubit.dart';
import 'package:nubank_exercise/app/screens/home/state_management/home_state.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (_, state) => state is ErrorState,
      listener: (context, state) {
        if (state is ErrorState) {}
      },
      builder: (context, state) {
        if (state is UpdateListState) {
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 16),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.links.length,
            itemBuilder: (context, index) => LinkListItem(
              state.links[index],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
