import 'package:flutter/material.dart';
import 'package:sport_ease/presentation/widget/custom_textcontroller.dart';
// import '../screen/indicator.dart';
import '../widget/custom_button.dart';
import 'login_screen.dart';

class OpeningScreen extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      //menampilkan logo 
        children: [Image.asset('assets/image/logo.png', width: 300,),
        SizedBox(height: 30),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
      //menampilkan text sambutan
        child: Text(
          'Mengelola acara olahraga \njadi lebih mudah dan efisien. \nYuk, eksplor fitur lengkapnya !',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold
          ),
        ),
        ),SizedBox(height: 70),
      //menampilkan button mengambil dari Custom Button 
        CustomButton(
          text: 'Mulai',
          borderColor: Colors.black,
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),
        );},),],),),
    );
  }
}