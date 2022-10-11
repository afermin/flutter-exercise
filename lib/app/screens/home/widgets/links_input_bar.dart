import 'package:flutter/material.dart';
import 'package:nubank_exercise/app/input_validator_error.dart';
import 'package:nubank_exercise/app/screens/home/home_widgets_keys.dart';

class LinkInputBar extends StatefulWidget {
  const LinkInputBar({
    Key? key,
    required this.isLoading,
    required this.onSubmit,
  }) : super(key: key);

  final bool isLoading;
  final void Function(String value) onSubmit;

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
                  key: HomeWidgetsKeys.linkTextField,
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
                        key: HomeWidgetsKeys.submitProgressIndicator,
                        strokeWidth: 2,
                      ),
                    )
                  : IconButton(
                      key: HomeWidgetsKeys.submitLinkButton,
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
      widget.onSubmit(_textEditingController.text);
    }
  }
}
