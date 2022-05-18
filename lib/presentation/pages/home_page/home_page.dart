part of 'widgets/widgets.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationAppBar(
        title: ApplicationTextValue.APP_NAME,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildCategory(),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: 4),
    );
  }
}
