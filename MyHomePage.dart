import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          title: Text(
            tr("App_Title"),
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  onPressed: () {
                    chagelang();
                  },
                  icon: Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 30,
                  )),
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                tr("PageView_Title"),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  Image.asset(
                    "images/img1.jfif",
                    fit: BoxFit.fitWidth,
                  ),
                  Image.asset(
                    "images/img2.jfif",
                    fit: BoxFit.fitWidth,
                  ),
                  Image.asset(
                    "images/img3.jfif",
                    fit: BoxFit.fitWidth,
                  ),
                  Image.asset(
                    "images/img4.jfif",
                    fit: BoxFit.fitWidth,
                  ),
                  Image.asset(
                    "images/img5.jfif",
                    fit: BoxFit.fitWidth,
                  ),
                  Image.asset(
                    "images/img6.jfif",
                    fit: BoxFit.fitWidth,
                  ),
                  Image.asset(
                    "images/img7.jfif",
                    fit: BoxFit.fitWidth,
                  ),
                  Image.asset(
                    "images/img8.jfif",
                    fit: BoxFit.fitWidth,
                  )
                ],
              ),
            ),
            SizedBox(
                height: 400,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "images/img${index + 1}.jfif",
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 100,
                              ),
                            ),
                            Center(
                                child: Text(
                              "${tr("Product")}${index + 1}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                            IconButton(
                                onPressed: () {
                                  SnackBar snackBar =
                                      SnackBar(content: Text(tr("chart")));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(Icons.shopping_cart))
                          ],
                        ),
                      );
                    })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                tr("offers"),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: (Image.asset(
                            "images/img${index + 1}.jfif",
                            fit: BoxFit.cover,
                            width: 150,
                            height: 130,
                          )),
                        ),
                        Center(
                            child: Text(
                          "${tr("Offer")}${index + 1}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                      ],
                    );
                  }),
            )
          ],
        ));
  }

  chagelang() {
    if (context.locale == Locale('en', 'US')) {
      context.setLocale(Locale('ar', 'EG'));
    } else {
      context.setLocale(Locale('en', 'US'));
    }
  }
}
