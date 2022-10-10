import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank_exercise/app/input_validator_error.dart';
import 'package:nubank_exercise/app/screens/home/state_management/home_cubit.dart';

class LinkInputBar extends StatefulWidget {
  const LinkInputBar({Key? key, required this.isLoading}) : super(key: key);

  final bool isLoading;

  @override
  State<LinkInputBar> createState() => _LinkInputBarState();
}

class _LinkInputBarState extends State<LinkInputBar> {
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
              widget.isLoading
                  ? Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : IconButton(
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
