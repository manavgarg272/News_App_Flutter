import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/features/home_screen/presentation/manager/news_list_notifier.dart';
import 'package:new_app/features/home_screen/presentation/new_detail_page.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetNewsDataNotifier>().getNewsDataList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Basic News App")),
      body:  ListView.builder(
            itemCount:  context.watch<GetNewsDataNotifier>().newsDataList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(size.height/50),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
                ),
                padding: EdgeInsets.all(size.height/100),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("News ${index+1}"),
                    SizedBox(height: size.height/80,),
                    const Text("Title",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: size.height/140,),
                    Text(context.read<GetNewsDataNotifier>().newsDataList[index].title),
                    SizedBox(height: size.height/50,),
                    const Text("Discription",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: size.height/140,),
                    Text(context.read<GetNewsDataNotifier>().newsDataList[index].body,textAlign: TextAlign.justify,),
                    SizedBox(height: size.height/140,),
                    OutlinedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  NewsDetailsPage(id: context.read<GetNewsDataNotifier>().newsDataList[index].id,)),
                      );
                    }, child: Text("Show News"))

                  ],
                ),
              );
            }),
      
    );
  }
}
