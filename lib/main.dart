import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> titleList;

  @override
  void initState() {
    super.initState();
    initChaptersTitleScrap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Scrapping'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Scrapped data is: ',
                style: TextStyle(fontSize: 22, color: Colors.indigo),
              ),
              SizedBox(
                height: 16,
              ),
              if (titleList != null)
                for (final title in titleList)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '$title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              else
                CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  void initChaptersTitleScrap() async {
    final rawUrl =
        'https://unacademy.com/course/gravitation-for-iit-jee/D5A8YSAJ';
    final webScraper = WebScraper('https://unacademy.com');
    final endpoint = rawUrl.replaceAll(r'https://unacademy.com', '');
    if (await webScraper.loadWebPage(endpoint)) {
      final titleElements = webScraper.getElement(
          'div.Week__Wrapper-sc-1qeje5a-2 > a.Link__StyledAnchor-sc-1n9f3wx-0 '
          '> div.ItemCard__ItemInfo-xrh60s-1 '
          '> h6.H6-sc-1gn2suh-0',
          []);
      print(titleElements);
      final titleList = <String>[];
      titleElements.forEach((element) {
        final title = element['title'];
        titleList.add('$title');
      });
      print(titleList);
      if (mounted)
        setState(() {
          this.titleList = titleList;
        });
    } else {
      print('Cannot load url');
    }
  }
}
