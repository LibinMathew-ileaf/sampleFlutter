import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dialog_controller.dart';

class DialogView extends GetView<DialogController> {
  final formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    const title = 'Add Transaction';

    return null!;
  }

  Widget buildName() => TextFormField(
        controller: controller.nameController.value,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Name',
        ),
        validator: (name) =>
            name != null && name.isEmpty ? 'Enter a name' : null,
      );

  Widget buildAmount() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Id',
        ),
        keyboardType: TextInputType.number,
        validator: (amount) => amount != null && double.tryParse(amount) == null
            ? 'Enter a valid number'
            : null,
        controller: controller.idController.value,
      );

  Widget buildCancelButton(BuildContext context) => TextButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(),
      );

  Widget buildAddButton(BuildContext context, {required bool isEditing}) {
    final text = isEditing ? 'Save' : 'Add';

    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState!.validate();

        if (isValid) {
          final name = controller.nameController.value.text;
          final amount = double.tryParse(controller.idController.value.text) ?? 0;

          //widget.onClickedDone(name, amount, isExpense);
          controller.saveInterests();

          Navigator.of(context).pop();
        }
      },
    );
  }
}
