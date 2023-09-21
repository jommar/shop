import 'package:client_app/widgets/form/clearable_text_field.dart';
import 'package:flutter/material.dart';

class StoreSettings extends StatefulWidget {
  const StoreSettings({Key? key}) : super(key: key);

  @override
  State<StoreSettings> createState() => _StoreSettingsState();
}

class _StoreSettingsState extends State<StoreSettings> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> form = {
    'name': '',
    'headline': '',
    'currency': '',
  };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ClearableTextFormField(
            labelText: 'Name',
            onChanged: (val) {
              setState(
                () {
                  form['name'] = val;
                },
              );
            },
          ),
          ClearableTextFormField(
            labelText: 'Headline',
            onChanged: (val) {
              setState(
                () {
                  form['headline'] = val;
                },
              );
            },
          ),
          Text(form['name']),
          Text(form['headline']),
        ],
      ),
    );
  }
}
