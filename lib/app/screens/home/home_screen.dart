import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank_exercise/app/screens/home/home_input_bar.dart';
import 'package:nubank_exercise/app/screens/home/link_list.dart';
import 'package:nubank_exercise/app/screens/home/state_management/home_cubit.dart';
import 'package:nubank_exercise/app/screens/home/state_management/home_state.dart';
import 'package:nubank_exercise/di/init_di.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nubank exercise"),
      ),
      body: BlocProvider<HomeCubit>(
        create: (_) => getIt<HomeCubit>(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listenWhen: (_, state) => state is ErrorState,
          listener: (context, state) {
            if (state is ErrorState) {}
          },
          builder: (context, state) {
            return Column(
              children: [
                LinkInputBar(isLoading: state is LoadingState),
                Expanded(child: LinkList(state.links)),
              ],
            );
          },
        ),
      ),
    );
  }
}
