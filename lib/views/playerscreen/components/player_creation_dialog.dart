import 'package:flutter/material.dart';
import 'package:fodinha_flutter/components/atoms/custom_field.dart';
import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';
import 'package:provider/provider.dart';

class PlayerCreationDialog extends StatelessWidget {

  const PlayerCreationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final inputController = TextEditingController();

    return AlertDialog(
      content: Form(
        key: formKey,
        child: CustomField(
          labelText: "Nome do jogador",
          autoFocus: true,
          controller: inputController,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Campo não preenchido";
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            inputController.text = "";
          },
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Provider.of<PlayerViewModel>(context, listen: false).createPlayer(PlayerModel(name: inputController.text));
              inputController.text = "";
              Navigator.pop(context, 3);
            }
          },
          child: const Text("Criar"),
        ),
      ],
    );
  }
}