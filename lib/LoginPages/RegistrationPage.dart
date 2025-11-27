import 'package:flutter/material.dart';
import 'package:gobek_gone/LoginPages/LoginPage.dart';
import 'package:gobek_gone/MainPages/Homepage.dart';

class RegistrationPage extends StatefulWidget {

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arkaplan görseli (Değişmedi)
          Positioned.fill(
            child: Image.asset(
              "images/Loginpage.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Ekranın Ana içeriği - TÜM DİKEY ALANI KAPLAMASI İÇİN Positioned.fill kullanıldı
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                // Column'ı ekranın alt ve üst kenarlarına yaymak için kullanılır
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Üst boşluk ve Logo
                  SizedBox(height: MediaQuery.of(context).padding.top + 20), // Status bar boşluğu eklendi
                  Center(
                    child: Image.asset(
                      "images/logo-Photoroom.png",
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20,),

                  // Başlık
                  const Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30,),

                  // Form Alanları (Kullanıcı Adı, Email, Şifre)
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Username",
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),

                  // Kayıt butonu
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  // Giriş (Login) Metni
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already Have an Account ?",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // ✨ ANA DÜZELTME: Kalan tüm boşluğu doldurmak ve alt linkleri aşağı itmek için Spacer kullanıldı.
                  const Spacer(),

                  // Terms of Service ve Privacy Policy (Alt kısım)
                  // Align kaldırıldı, çünkü Spacer zaten onu aşağı itti.
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 20), // Alt güvenli alan eklendi
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // 1. Terms of Service Pop-up
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Terms of Service"),
                                  content: const SingleChildScrollView(
                                    child: Text(
                                      "This is a sample Terms of Service text. Please read all terms carefully. By using the app, you agree to the terms.",
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Terms of Service",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),

                        // 2. Privacy Policy Pop-up
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Privacy Policy"),
                                  content: const Text(
                                    "Review our Privacy Policy for information about how your personal data is collected and used.",
                                    textAlign: TextAlign.justify,),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Privacy Policy",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}