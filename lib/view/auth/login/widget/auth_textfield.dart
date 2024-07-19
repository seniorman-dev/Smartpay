import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/utils/theme/app_theme.dart';










class AuthTextField extends StatefulWidget {
  const AuthTextField({super.key,required this.onChanged, required this.hintText, required this.keyboardType, required this.textInputAction, required this.textController, this.onFocusChanged, this.validator, this.onTap,});
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String hintText;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(bool)? onFocusChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: widget.onFocusChanged,
      child: TextFormField(
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        controller: widget.textController,
        keyboardType: widget.keyboardType,
        //maxLines: 2,
        minLines: 1,
        autocorrect: true,
        inputFormatters: const [],
        enableSuggestions: true,
        enableInteractiveSelection: true,
        cursorColor: AppColor.mainColor,
        style: GoogleFonts.roboto(color: AppColor.mainColor, fontSize: 16.sp, fontWeight: FontWeight.w600),             
        textCapitalization: TextCapitalization.sentences,
        textInputAction: widget.textInputAction,          
        scrollPhysics: const BouncingScrollPhysics(),
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(     
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),   
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.greenColor), // Set the color you prefer
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          fillColor: AppColor.fieldGreyColor, 
          filled: true,    
          hintText: widget.hintText,
          hintStyle: GoogleFonts.roboto(color: AppColor.hintTextGreyColor, fontSize: 16.sp, fontWeight: FontWeight.w400), 
          errorStyle: GoogleFonts.roboto(color: AppColor.mainColor, fontSize: 16.sp, fontWeight: FontWeight.w400), 
        ),
      ),
    );
  }
}




class AuthPhoneNumberTextField extends StatefulWidget {
  const AuthPhoneNumberTextField({super.key,required this.onChanged, required this.hintText, required this.keyboardType, required this.textInputAction, required this.textController, this.onFocusChanged, required this.icon, this.validator,});
  final Widget icon;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String hintText;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(bool)? onFocusChanged;
  final String? Function(String?)? validator;

  @override
  State<AuthPhoneNumberTextField> createState() => _AuthPhoneNumberTextFieldState();
}

class _AuthPhoneNumberTextFieldState extends State<AuthPhoneNumberTextField> {

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: widget.onFocusChanged,
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.textController,
        keyboardType: widget.keyboardType,
        //maxLines: 2,
        minLines: 1,
        autocorrect: true,
        inputFormatters: const [],
        enableSuggestions: true,
        enableInteractiveSelection: true,
        cursorColor: AppColor.mainColor,
        style: GoogleFonts.roboto(color: AppColor.mainColor, fontSize: 16.sp, fontWeight: FontWeight.w600),             
        textCapitalization: TextCapitalization.sentences,
        textInputAction: widget.textInputAction,          
        scrollPhysics: const BouncingScrollPhysics(),
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(     
          prefixIcon: widget.icon,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),   
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.greenColor), // Set the color you prefer
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          fillColor: AppColor.fieldGreyColor, 
          filled: true,    
          hintText: widget.hintText,
          hintStyle: GoogleFonts.roboto(color: AppColor.hintTextGreyColor, fontSize: 16.sp, fontWeight: FontWeight.w400), 
          errorStyle: GoogleFonts.roboto(color: AppColor.mainColor, fontSize: 16.sp, fontWeight: FontWeight.w400), 
        ),

      ),
    );
  }
}



class AuthPasswordTextField extends StatefulWidget {
  AuthPasswordTextField({super.key, required this.isObscured, required this.onChanged, required this.hintText, required this.keyboardType, required this.textInputAction, required this.textController, this.onFocusChanged, this.validator,});
  bool isObscured;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String hintText;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(bool)? onFocusChanged;
  final String? Function(String?)? validator;

  @override
  State<AuthPasswordTextField> createState() => _AuthPasswordTextFieldState();
}

class _AuthPasswordTextFieldState extends State<AuthPasswordTextField> {
  
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: widget.onFocusChanged,
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.textController,
        keyboardType: widget.keyboardType,
        //maxLines: 2,
        minLines: 1,
        autocorrect: true,
        inputFormatters: const [],
        enableSuggestions: true,
        enableInteractiveSelection: true,
        cursorColor: AppColor.mainColor,
        style: GoogleFonts.roboto(color: AppColor.mainColor, fontSize: 16.sp, fontWeight: FontWeight.w600),             
        textCapitalization: TextCapitalization.sentences,
        textInputAction: widget.textInputAction,          
        scrollPhysics: const BouncingScrollPhysics(),
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(     
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),   
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.greenColor), // Set the color you prefer
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColor.fieldGreyColor), // Set the color you prefer
          ),
          fillColor: AppColor.fieldGreyColor, 
          filled: true,    
          hintText: widget.hintText,
          hintStyle: GoogleFonts.roboto(color: AppColor.hintTextGreyColor, fontSize: 16.sp, fontWeight: FontWeight.w400), 
          errorStyle: GoogleFonts.roboto(color: AppColor.mainColor, fontSize: 16.sp, fontWeight: FontWeight.w400), 
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                widget.isObscured = !widget.isObscured;
              });
              debugPrint("${widget.isObscured}");
            },
            child: widget.isObscured 
            ?Icon(
              CupertinoIcons.eye_slash,
              color: AppColor.textGreyColor, 
              size: 24.r,
            ) 
            :Icon(
              CupertinoIcons.eye,
              //Icons.visibility_rounded, 
              color: AppColor.textGreyColor, 
              size: 24.r,
            ) 
          ),  
        ),
        obscureText: widget.isObscured,
        obscuringCharacter: '•',
      ),
    );
  }
}