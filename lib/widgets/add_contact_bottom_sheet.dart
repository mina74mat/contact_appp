import 'dart:io';
import 'package:flutter/material.dart';
import '../models/contact_models.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import '../utils/validation.dart';
import 'cutom_text_form_field.dart';


class AddContactBottomSheet extends StatefulWidget {
  const AddContactBottomSheet({
    required this.contacts,
    required this.onContactAdd,
    super.key,
  });

  final List<ContactModel> contacts;

  final Function onContactAdd;

  @override
  State<AddContactBottomSheet> createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    String userName = 'User Name';
    String email = 'test@example.com';
    String phoneNumber = '+2000000000000';

    return Container(
      decoration: const BoxDecoration(

        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: height * 0.16,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: pickedImage == null
                      ? Center(
                    child: GestureDetector(
                      onTap: () async {
                      },
                      child: Image.asset('assets/images/image_not_selected.png'),
                    ),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.file(pickedImage!, fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: userNameController,
                      builder: (context, value, _) {
                        return Text(
                          value.text.isEmpty ? userName : value.text,
                          style: AppStyles.font16WhiteMudium,
                        );
                      },
                    ),
                    const Divider(color: AppColors.white),
                    ValueListenableBuilder(
                      valueListenable: emailController,
                      builder: (context, value, _) {
                        return Text(
                          value.text.isEmpty ? email : value.text,
                          style: AppStyles.font16WhiteMudium,
                        );
                      },
                    ),
                    const Divider(color: AppColors.white),
                    ValueListenableBuilder(
                      valueListenable: phoneNumberController,
                      builder: (context, value, _) {
                        return Text(
                          value.text.isEmpty ? phoneNumber : value.text,
                          style: AppStyles.font16WhiteMudium,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'Enter User Name',
                  controller: userNameController,
                  validator: (value) {
                    return Validation.validateEmptyField(
                        value, "Please Enter a user name");
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: 'Enter User Email',
                  controller: emailController,
                  validator: (value) {
                    return Validation.validateEmailField(value);
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: 'Enter User Phone',
                  controller: phoneNumberController,
                  validator: (value) {
                    return Validation.validateEmptyField(
                        value, "Please Enter a user phone number");
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              addContact();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
            child: const Text(
              'Enter User',
              style: AppStyles.elevatedButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  void addContact() {
    if (formKey.currentState!.validate()) {
      widget.contacts.add(ContactModel(
          userName: userNameController.text,
          email: emailController.text,
          phone: phoneNumberController.text,
          imageFile: pickedImage));
      widget.onContactAdd();
      Navigator.pop(context);
    }
  }
}
