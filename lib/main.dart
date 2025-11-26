// import 'package:flutter/material.dart';
// // import 'package:practiceforgrowth/lapp_localizations.dart';
// import 'package:totto/l10n/app_localizations.dart';
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   Locale _locale = const Locale('en'); // default locale
//
//   void setLocale(Locale locale) {
//     setState(() {
//       _locale = locale;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Localization Demo',
//       locale: _locale, // set current locale
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       home: HomePage(onLocaleChange: setLocale),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final Function(Locale) onLocaleChange;
//
//   const HomePage({super.key, required this.onLocaleChange});
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(l10n.getStartedButton),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(l10n.chooseLanguage),
//             const SizedBox(height: 20),
//
//             // Buttons to switch language
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => onLocaleChange(const Locale('en')),
//                   child: const Text('English'),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () => onLocaleChange(const Locale('ne')),
//                   child: const Text('नेपाली'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 40),
//
//             ElevatedButton(
//               onPressed: () {},
//               child: Text(l10n.continueButton),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class CreateChatPage extens ConsumerstatefulWidget{
//
//
//   final UserProfile otherUser;
//   finl Ordeer? initialOrder;
//
//
//   CreateChatPage({
//   super.key,
// required this.otherUser,
// this.initialOrder,
// })
//
// @override
// ConsumerState<CreateChatPage> createState() =>_CreateChatPage();
//
// }
// class _CreateChaPageState extends ConsumerState<CreateChatPage>{
//   @override
// void initState(){
//     super.initState();
//
//     WidgetsBinding.instance.addPostFrameCallback((_){
// _findingOrCreateChat();
//
//
// })
//
//    @override Widget
// build(BuildContext context){
//       ref.listen<PersonalChange>
//
// }
// }
//
//
//
//
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/chat_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Groups App',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const ChatPage(),
    );
  }
}







