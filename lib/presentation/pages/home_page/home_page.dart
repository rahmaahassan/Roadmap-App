part of 'widgets/widgets.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ApplicationAppBar(
        title: ApplicationTextValue.APP_NAME,
      ),
      body: HomeList()
    );
  }
}
