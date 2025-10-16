import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_app/core/constants/color_assets.dart';
import 'package:tmdb_app/presentation/controllers/auth_controller.dart';
import 'package:tmdb_app/presentation/routes/app_route.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  Get.put(
    prefs,
  ); // Simpan instance SharedPreferences di GetX// ✅ Tambahkan ini agar plugin siap

  final auth = Get.put(AuthController(), permanent: true);
  await auth.initDummyUser();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparan atau warna tertentu
        statusBarIconBrightness: Brightness.dark, // Teks hitam
        statusBarBrightness: Brightness.light, // Untuk iOS
      ),
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.main, // Halaman pertama
        getPages: AppRoutes.pages, // Daftar rute
        // translations: AppTranslations(), // Menggunakan JSON sebagai sumber teks
        locale: Locale('id'), // Default ke Bahasa Indonesia
        // localizationsDelegates: const [
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   MonthYearPickerLocalizations.delegate,
        // ],
        fallbackLocale: Locale('en'),
        theme: ThemeData(
          fontFamily:
              "PlusJakartaSans", // Pastikan sesuai dengan `pubspec.yaml`
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            bodyMedium: TextStyle(fontSize: 16),
            bodySmall: TextStyle(fontSize: 14),
          ),
          visualDensity: VisualDensity.standard,
          primaryColor: ColorAsset.primaryColor, // Warna utama
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorAsset.primaryColor, // Warna dasar
            primary: ColorAsset.primaryColor, // Warna tombol utama
            secondary: Colors.orange, // Warna aksen/sekunder
          ),

          // Warna default untuk AppBar
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white, // Warna teks
          ),

          // Warna tombol
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorAsset.primaryColor, // Warna tombol
              foregroundColor: Colors.white, // Warna teks
            ),
          ),

          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: ColorAsset.primaryColor,
            unselectedItemColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
