
import 'package:flutter/material.dart';
import 'package:supachat/pages/auth/login_page.dart';
import 'package:supachat/pages/dashboard_page.dart';
import 'package:supachat/utils/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ super.key });

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  @override
  void initState() {    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {      
      _checkUserSession();
    },);
  }

void _checkUserSession() {
  try {
    final session = supabase.auth.currentSession;

    if (session == null) {
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (_) => const LoginPage()), 
        (route) => false,
      );      
    } else {
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (_) => const DashboardPage()), 
        (route) => false,
      );          
    }
  } catch (e) {
    print('Error checking user session: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}