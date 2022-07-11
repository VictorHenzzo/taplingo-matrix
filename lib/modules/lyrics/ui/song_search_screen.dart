import 'package:flutter/material.dart';
import 'package:taplingo_matrix/modules/lyrics/navigation/directions/song_search_screen_directions.dart';
import 'package:taplingo_matrix/modules/lyrics/ui/components/custom_form_field.dart';

class SongSearchScreen extends StatelessWidget {
  const SongSearchScreen({
    required this.controller,
    required this.formKey,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Procure uma música! ;D',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 15),
          CustomFormField(controller: controller, formKey: formKey),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                _redirectToResult();
              }
            },
            child: const Text('Pesquisar'),
          )
        ],
      ),
    ));
  }

  void _redirectToResult() {
    SongSearchScreenDirections(this).goToResult(controller.text);
  }
}
