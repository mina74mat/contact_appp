import 'package:flutter/material.dart';
import '../models/contact_models.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';


class ContactCardWidget extends StatelessWidget {
  final ContactModel contact;
  final Function deleteContactByIndex;
  const ContactCardWidget({
  super.key,
  required this.deleteContactByIndex,
  required this.contact,
  required,
});

@override
Widget build(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return Container(
    margin:  EdgeInsets.only(bottom:height*0.02 ),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              contact.imageFile == null
               ? Container(
                  padding: EdgeInsets.only(
                    top: height*0.01
                  ),
                  child: Image.asset('assets/images/goat.png',))
                  // ? Lottie.asset(AppAnimations.user)
                  : ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.file(
                  contact.imageFile!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Container(
                margin:  EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  contact.userName,
                  style: AppStyles.cardUserNameTextStyle,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/icon_email.png',),
                   SizedBox(width: width*0.01,),
                  Expanded(
                    child: Text(
                      contact.email,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.cardContentTextStyle,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.01),
              Row(
                children: [
                  Image.asset('assets/images/icon_phone.png',),
                  SizedBox(width: width*0.02),
                  Text(
                    '+2${contact.phone}',
                    style: AppStyles.cardContentTextStyle,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  deleteContactByIndex();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.delete, color: Colors.white, size: 18),
                    SizedBox(width: width*0.01),
                    Text(
                      'Delete',
                      style: AppStyles.cardContentTextStyle
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}
