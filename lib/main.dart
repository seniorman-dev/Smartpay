import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartpay/utils/theme/app_theme.dart';
import 'package:smartpay/view/404page/unknown_route.dart';
import 'package:smartpay/view/auth/forgot_password/screen/fp_screen_1.dart';
import 'package:smartpay/view/auth/forgot_password/screen/fp_screen_2.dart';
import 'package:smartpay/view/auth/forgot_password/screen/fp_screen_3.dart';
import 'package:smartpay/view/auth/forgot_password/screen/fp_screen_4.dart';
import 'package:smartpay/view/auth/forgot_password/screen/fp_screen_success.dart';
import 'package:smartpay/view/auth/login/screen/login_screen.dart';
import 'package:smartpay/view/auth/register/screen/register_screen.dart';
import 'package:smartpay/view/auth/register/widget/more_details.dart';
import 'package:smartpay/view/auth/register/widget/registration_success.dart';
import 'package:smartpay/view/auth/register/widget/set_pincode.dart';
import 'package:smartpay/view/auth/register/widget/verify_email.dart';
import 'package:smartpay/view/home/home_page.dart';
import 'package:smartpay/view/routes/web_routes.dart';
import 'package:smartpay/view/auth/splash/layout_builder.dart';
import 'package:smartpay/view/auth/splash/splash_screen.dart';






void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  //keep beneath this widgetflutterbinding widget
  //usePathUrlStrategy();
  
  //to customize system overlay
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.bgColor,
      statusBarColor: Colors.transparent, //AppColor.bgColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  //initialize get_storage
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //Access a query parameter from the web url using "Get.parameters['']"
    /*String serviceName = Get.parameters['name'] ?? 'DefaultUserName';
    String serviceLink = Get.parameters['link'] ?? 'DefaultUserName';*/

    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) {
        return child!;
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smartpay',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.mainColor),
          useMaterial3: true,
        ),
        defaultTransition: Transition.rightToLeft,
        
        //incase user gets to an unknown route
        unknownRoute: GetPage(
          name: '/', 
          page: () => UnknownPage(
            onPressed: () {}     
          )
        ),
        
        //traditional way of registering routes without getx
        /*routes: {
          '/': (context) => HomeScreen(),
          '/destination': (context) => DestinationScreen(argument: ''),
        },*/

        initialRoute: SplashPageRoute,
        
        //register all routes for the app here
        getPages: [

          //SplashScreen
          GetPage(
            name: SplashPageRoute,
            page: () => const SplashScreen(route: LayoutPageRoute,),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),

          //Layout
          GetPage(
            name: LayoutPageRoute,
            page: () => const LayoutWidget(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),

          //home/mainscreen
          GetPage(
            name: MainScreenPageRoute,
            page: () => const MainScreen(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),
          
          //Login
          GetPage(
            name: LoginPageRoute,
            page: () => LoginScreen(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),

          //Register
          GetPage(
            name: RegisterPageRoute,
            page: () => RegisterScreen(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),

          GetPage(
            name: VerifyEmailPageRoute,
            page: () => const VerifyEmailScreen(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),
        
          GetPage(
            name: MoreDetailsPageRoute,
            page: () => MoreDetailsScreen(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),

          GetPage(
            name: SetPinCodePageRoute,
            page: () => SetPinCodeScreen(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),

          GetPage(
            name: CongratulationsPageRoute,
            page: () => RegistrationSuccesScreen(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),

          
          //Forgot Password
          GetPage(
            name: ForgotPasswordPageRoute,
            page: () => ForgotPasswordScreen1(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),

          GetPage(
            name: VerifyFPEmailRoute,
            page: () => ForgotPasswordScreen2(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),
          GetPage(
            name: OTPFPPageRoute,
            page: () => const ForgotPasswordScreen3(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),
          GetPage(
            name: CreateNewPasswordPageRoute,
            page: () => ForgotPasswordScreen4(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),
          GetPage(
            name: SuccessFPPageRoute,
            page: () => ForgotPasswordScreenSuccess(),
            curve: Curves.bounceInOut,
            transition: Transition.rightToLeft,
          ),



        ],

      
      ),
    );
  }
}

