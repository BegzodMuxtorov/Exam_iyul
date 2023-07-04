import 'package:exam/provider/popular_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularTab extends StatefulWidget {
  const PopularTab({super.key});

  @override
  State<PopularTab> createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
  @override
  Widget build(BuildContext context) {
    PopularProvider popularProvider = Provider.of<PopularProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => PopularProvider(),
      builder: (context, child) {
        return Builder(builder: (context) {
          if (popularProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (popularProvider.error.isNotEmpty) {
            return Center(
              child: Text(popularProvider.error),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://i0.wp.com/www.opindia.com/wp-content/uploads/2021/01/News-Today-With-Rajdeep-Sardesai-Full-Video-0-4-screenshot.jpg?resize=696%2C380&ssl=1'),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            )),
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    Text(popularProvider.data[index].title.toString()),
                    
                  ],
                );
              },
              itemCount: popularProvider.data.length,
            );
          }
        });
      },
    );
  }
}
