import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:localization/DropDownItem.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'es']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
        builder: (locale) => MaterialApp(
              title: 'Localization Demo',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: Locales.delegates,
              supportedLocales: Locales.supportedLocales,
              locale: locale,
              home: HomeScreen(),
            ));
    // TODO: implement build
    throw UnimplementedError();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = ['English', 'Spanish'];
  String? selectedItems = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton<String>(
              value: selectedItems,
              items: items
                  .map((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) => setState(() {
                    if (item == 'English') {
                      Locales.change(context, 'en');
                    } else {
                      Locales.change(context, 'es');
                    }
                    selectedItems = item;
                  }))
        ],
        title: const LocaleText('welcome'),
        centerTitle: true,
      ),
      body: const Center(
          child: LocaleText(
        'hello',
        style: TextStyle(fontSize: 20),
      )),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
