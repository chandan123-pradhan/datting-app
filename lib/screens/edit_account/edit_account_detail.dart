import 'package:dating_app/widgets/text_field_widgets.dart';
import 'package:flutter/material.dart';

class EditAccountDetail extends StatefulWidget {
  const EditAccountDetail({super.key});

  @override
  State<EditAccountDetail> createState() => _EditAccountDetailState();
}

class _EditAccountDetailState extends State<EditAccountDetail> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFieldWidgets.inputField(
                  context: context,
                  textFieldController: nameController,
                  hintText: '',
                  textInputType: TextInputType.text,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFieldWidgets.mobileNumberInputTextField(
                  context: context, textFieldController: phoneController),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFieldWidgets.inputField(
                  context: context,
                  textFieldController: bioController,
                  hintText: '',
                  textInputType: TextInputType.text,
                )),
          ],
        ),
      ),
    ));
  }
}
