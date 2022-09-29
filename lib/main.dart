import 'package:books/bloc/books_bloc.dart';
import 'package:books/com_widgets/com_list_tile.dart';
import 'package:books/com_widgets/com_loader.dart';
import 'package:books/model/books_model.dart';
import 'package:books/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => BooksBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      context.read<BooksBloc>().getBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: maincolor,
            elevation: 0.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Books',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Text(
                      'List of books',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<BooksBloc>().sortby();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Sort by Alphabetical order',
                  style: TextStyle(fontSize: 18, color: sortBtncolor),
                ),
                Icon(
                  Icons.sort_by_alpha_outlined,
                  size: 30,
                  color: sortBtncolor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: maincolor,
              thickness: 1,
            ),
          ),
          Expanded(
              child: context.watch<BooksBloc>().isLoading
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ComLoaderextends();
                      })
                  : context.watch<BooksBloc>().isError
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Something went wrong.'),
                            TextButton(
                                onPressed: () {
                                  context.read<BooksBloc>().getBooks();
                                },
                                child: Text('retry'))
                          ],
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: context.watch<BooksBloc>().listBooks.items!.length,
                          itemBuilder: (context, index) {
                            Item _item = context.watch<BooksBloc>().listBooks.items![index];
                            return ComListTile(
                              image: _item.volumeInfo!.imageLinks!.smallThumbnail!,
                              title: _item.volumeInfo!.title,
                              price:
                                  'Price: ${_item.saleInfo!.saleability == Saleability.FOR_SALE ? "${_item.saleInfo!.listPrice!.amount} ${_item.saleInfo!.listPrice!.currencyCode.toString()}" : Saleability.NOT_FOR_SALE.name}',
                            );
                          })),
        ]),
      ),
    );
  }
}
