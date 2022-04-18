import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiper/config/app_colors.dart';
import 'package:shiper/config/app_constants.dart';
import 'package:shiper/config/app_dimens.dart';
import 'package:shiper/config/app_images.dart';
import 'package:shiper/config/app_text_styles.dart';
import 'package:shiper/generated/l10n.dart';
import 'package:shiper/models/user.dart';
import 'package:shiper/providers/store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userName = "";
  String password = "";
  List<String> errors = <String>[];

  login(BuildContext context) {
    final newErrors = <String>[];
    if (isValidateEmpty(userName) || isValidateEmpty(password)) {
      newErrors.add(S.of(context).doNotEmpty);
    }

    if (isValidateEmail()) {
      newErrors.add(S.of(context).emailError);
    }

    if (isValidatePassword()) {
      newErrors.add(S.of(context).passwordError);
    }

    if (newErrors.isEmpty) {
      final store = Provider.of<Store>(context, listen: false);
      store.saveUser(User(userName, password));
      Navigator.pushReplacementNamed(context, "/");
      
    }
    setState(() {
      errors = newErrors;
    });
  }

  bool isValidateEmpty(String value) {
    return value.isEmpty;
  }

  bool isValidateEmail() {
    final regex = RegExp(AppConstants.regex);
    return !regex.hasMatch(userName);
  }

  bool isValidatePassword() {
    return password.length < 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFF4646,
      
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: [
              Image.asset(
                AppImages.logo,
                fit: BoxFit.contain,
                width: AppDimens.w250,
                height: AppDimens.w250,
              ),
              const SizedBox(height: 30),
              TextField(
                style: AppTextStyles.robotoR18cFFFFF,
                decoration: InputDecoration(
                  fillColor: AppColors.cFFFFFF,
                  label: Text("Tên đăng nhập", textAlign: TextAlign.center, style: AppTextStyles.robotoR18cFFFFF,),
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: AppColors.cFFFFFF),   
                  ),  
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.cFFFFFF),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.cFFFFFF),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onChanged: (value) => userName = value,
              ),
              const SizedBox(height: 20),
              
              TextField(
                style: AppTextStyles.robotoR18cFFFFF,
                decoration: InputDecoration(
                  label:  Text("Mật khẩu", style: AppTextStyles.robotoR18cFFFFF,),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: AppColors.cFFFFFF),   
                  ),  
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.cFFFFFF),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.cFFFFFF),
                  ),
                ),
                
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                onChanged: (value) => password = value,
              ),
              const SizedBox(height: 10),
              Text(
                errors.isNotEmpty ? errors[0] : "",
                style: TextStyle(
                  color: errors.isNotEmpty ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(45),
                  primary: AppColors.cFFFFFF
                ),
                onPressed: () => login(context),
                child: Text("Đăng nhập", style: AppTextStyles.robotoR25cFFFFF,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
