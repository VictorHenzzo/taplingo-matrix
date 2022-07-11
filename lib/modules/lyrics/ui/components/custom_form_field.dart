import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key, required this.controller, required this.formKey})
      : super(key: key);
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                hintText: "Buscar",
                floatingLabelBehavior: FloatingLabelBehavior.always),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo não pode estar vazio!';
              }
              return null;
            },
          )),
    );
  }
}
