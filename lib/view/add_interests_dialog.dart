import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter/model/interest_hive.dart';

class TransactionDialog extends StatefulWidget {
  final InterestHive? interest;
  final Function(String name, double amount, bool isExpense) onClickedDone;

  const TransactionDialog({
    Key? key,
    this.interest,
    required this.onClickedDone,
  }) : super(key: key);

  @override
  _TransactionDialogState createState() => _TransactionDialogState();
}

class _TransactionDialogState extends State<TransactionDialog> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();

  bool isExpense = true;

  @override
  void initState() {
    super.initState();

    if (widget.interest != null) {
      final interests = widget.interest!;

      nameController.text = interests.name!!;
      idController.text = interests.id.toString();

    }
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.interest != null;
    final title = isEditing ? 'Edit Transaction' : 'Add Transaction';

    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              buildName(),
              const SizedBox(height: 8),
              buildAmount(),
              const SizedBox(height: 8),
              buildRadioButtons(),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        buildCancelButton(context),
        buildAddButton(context, isEditing: isEditing),
      ],
    );
  }

  Widget buildName() => TextFormField(
    controller: nameController,
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
      hintText: 'Enter Amount',
    ),
    keyboardType: TextInputType.number,
    validator: (amount) => amount != null && double.tryParse(amount) == null
        ? 'Enter a valid number'
        : null,
    controller: idController,
  );

  Widget buildRadioButtons() => Column(
    children: [
      RadioListTile<bool>(
        title: const Text('Expense'),
        value: true,
        groupValue: isExpense,
        onChanged: (value) => setState(() => isExpense = value!),
      ),
      RadioListTile<bool>(
        title: const Text('Income'),
        value: false,
        groupValue: isExpense,
        onChanged: (value) => setState(() => isExpense = value!),
      ),
    ],
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
          final name = nameController.text;
          final amount = double.tryParse(idController.text) ?? 0;

          widget.onClickedDone(name, amount, isExpense);

          Navigator.of(context).pop();
        }
      },
    );
  }
}