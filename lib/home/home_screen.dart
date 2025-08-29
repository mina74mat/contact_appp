import 'package:flutter/material.dart';
import '../models/contact_models.dart';
import '../utils/app_colors.dart';
import '../widgets/add_contact_bottom_sheet.dart';
import '../widgets/custom_floating_action_button_widget.dart';
import '../widgets/placeholder_widget.dart';
import '../widgets/screen_contacts.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [
    ContactModel(
        userName: 'Messi',
        phone: '012222222',
        email: 'messi@example.com',
        imageFile: null),
    ContactModel(
        userName: 'Abo Thiago',
        phone: '0111111111',
        email: 'messiii@example.com',
        imageFile: null),
    ContactModel(
        userName: 'Goat',
        phone: '0100000000',
        email: 'goat@example.com',
        imageFile: null),
    ContactModel(
        userName: 'Leoo',
        phone: '0155555555',
        email: 'leo@example.com',
        imageFile: null),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset('assets/images/logo.png'),
        ),
        leadingWidth: width * 0.3,
      ),
      body: contacts.isEmpty
          ? const PlaceholderWidget()
          : ScreenContacts(
              contacts: contacts,
              onContactDeleteClicked: deleteContactByIndex,
            ),
      floatingActionButton: CustomFloatingActionButtonWidget(
        showDelete: contacts.isNotEmpty,
        addContactFun: showModalBottomSheetFun,
        deleteContactFun: deleteContact,
      ),
    );
  }

  void showModalBottomSheetFun(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return AddContactBottomSheet(
          contacts: contacts,
          onContactAdd: () {
            setState(() {});
          },
        );
      },
    );
  }

  void deleteContact() {
    contacts.removeLast();
    setState(() {});
  }

  void deleteContactByIndex(int index) {
    contacts.removeAt(index);
    setState(() {});
  }
}
