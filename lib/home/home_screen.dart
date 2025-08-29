// import 'package:contact_app/utils/app_colors.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatelessWidget {
//   static const String routeName = 'home_screen';
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryColor,
//         leading: Container(
//             margin: EdgeInsets.only(
//               left: width*0.04,
//             ),
//             child: Image.asset('assets/images/logo.png',)),
//         leadingWidth: width*0.34,
//       ),
//
//
//
//     );
//   }
// }

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
        userName: 'messi',
        phone: '012222222',
        email: 'mina@example.com',
        imageFile: null),
    ContactModel(
        userName: 'abo thiago',
        phone: '0111111111',
        email: 'youssef@example.com',
        imageFile: null),
    ContactModel(
        userName: 'goat',
        phone: '0100000000',
        email: 'ali@example.com',
        imageFile: null),
    ContactModel(
        userName: 'leo',
        phone: '01555555555',
        email: 'john@example.com',
        imageFile: null),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

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
          contacts: contacts, onContactDeleteClicked: deleteContactByIndex),
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
