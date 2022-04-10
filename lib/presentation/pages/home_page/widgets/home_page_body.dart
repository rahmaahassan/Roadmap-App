part of 'widgets.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ApplicationTextValue.APP_NAME),
        centerTitle: false,
        shadowColor: Colors.white54,
        elevation: 5,
      ),
      body: Container(),
    );
  }
}
