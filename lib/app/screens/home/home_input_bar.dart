import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank_exercise/app/input_validator_error.dart';
import 'package:nubank_exercise/app/screens/home/state_management/home_cubit.dart';

class HomeInputBar extends StatefulWidget {
  const HomeInputBar({Key? key}) : super(key: key);

  @override
  State<HomeInputBar> createState() => _HomeInputBarState();
}

class _HomeInputBarState extends State<HomeInputBar> {
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _textEditingController,
                  validator: InputValidatorError.getLinkValidator,
                ),
              ),
              IconButton(
                onPressed: manageOnPressed,
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void manageOnPressed() {
    if (_formKey.currentState?.validate() == true) {
      context.read<HomeCubit>().shortenLink(_textEditingController.text);
    }
  }
}
