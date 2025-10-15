import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/core/constants/color_assets.dart';
import 'package:tmdb_app/core/constants/image_assets.dart';
import 'package:tmdb_app/presentation/routes/app_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  bool _isObscure = true; // State untuk menyembunyikan/memperlihatkan password
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -30,
              child: Image.asset(
                ImageAssets.header,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          ImageAssets.logo,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                      SizedBox(height: 32),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          softWrap: true,
                          textAlign: TextAlign.center,
                          "Bersiaplah untuk terjun ke dalam kisah-kisah terhebat di TV dan Film",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 32),
                      Form(
                        key: key,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 44,
                              child: TextFormField(
                                controller: _emailController,
                                style: TextStyle(fontSize: 12),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Alamat Email",
                                  labelStyle: const TextStyle(fontSize: 12),

                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,

                                  // Mengatur tinggi dengan contentPadding
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),

                                  // Normal Border
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),

                                  // Focused Border (saat diklik)
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      color: ColorAsset.primaryColor,
                                      width: 2,
                                    ),
                                  ),

                                  // Error Border (saat ada error)
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                  ),

                                  // Border saat error dan sedang focus
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                      width: 2,
                                    ),
                                  ),

                                  // Style teks error
                                  errorStyle: const TextStyle(
                                    height: -5, // tinggi nol = tidak muncul
                                    color: Colors.red,
                                    fontSize: 0, // tidak terlihat
                                  ),
                                ),

                                // Validasi input
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 44,
                              child: TextFormField(
                                controller: _passwordController,
                                style: const TextStyle(fontSize: 12),
                                obscureText: _isObscure,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: const TextStyle(fontSize: 12),

                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,

                                  // Mengatur tinggi dengan contentPadding
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),

                                  // Normal Border
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),

                                  // Focused Border (saat diklik)
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                      color: ColorAsset.primaryColor,
                                      width: 2,
                                    ),
                                  ),

                                  // Error Border (saat ada error)
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                  ),

                                  // Border saat error dan sedang focus
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                  ),

                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure =
                                            !_isObscure; // Toggle antara true/false
                                      });
                                    },
                                  ),
                                  // Style teks error
                                  errorStyle: const TextStyle(
                                    height: -5, // tinggi nol = tidak muncul
                                    color: Colors.red, // warna transparan
                                    fontSize: 0, // tidak terlihat
                                  ),
                                ),

                                // Validasi input
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      //OBX
                      SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              // authController.login(
                              //   _emailController.text,
                              //   _passwordController.text,
                              // );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 6,
                            ),
                            minimumSize: const Size.fromHeight(45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            textStyle: TextStyle(fontSize: 12),
                            backgroundColor: ColorAsset.primaryColor,
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey, // Warna divider
                              thickness: 1, // Ketebalan divider
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "atau",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: Colors.grey, thickness: 1),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            minimumSize: const Size.fromHeight(45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            textStyle: const TextStyle(fontSize: 12),
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            "Masuk Sebagai Tamu",
                            style: const TextStyle(
                              color: ColorAsset.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow:
                                TextOverflow.ellipsis, // Mencegah overflow teks
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'Dengan membuat akun atau masuk, Anda setuju dengan ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: 'Ketentuan Layanan',
                                style: const TextStyle(
                                  color: ColorAsset
                                      .primaryColor, // ubah warna sesuai tema kamu
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // TODO: Arahkan ke halaman "Ketentuan Layanan"
                                    // Contoh:
                                    // Get.toNamed(Routes.terms);
                                    print('Ketentuan Layanan diklik');
                                  },
                              ),
                              const TextSpan(
                                text: ' dan ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Kebijakan Privasi',
                                style: const TextStyle(
                                  color: ColorAsset.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // TODO: Arahkan ke halaman "Kebijakan Privasi"
                                    print('Kebijakan Privasi diklik');
                                  },
                              ),
                              const TextSpan(
                                text: ' kami',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
