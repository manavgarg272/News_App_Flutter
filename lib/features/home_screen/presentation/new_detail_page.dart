



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/features/home_screen/presentation/manager/news_list_id_notifier.dart';
import 'package:provider/provider.dart';

class NewsDetailsPage extends StatefulWidget {
final int id;

  const NewsDetailsPage({super.key,required this.id});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetNewsDataByIdNotifier>().getNewsDataById(id: widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:  Text("News ${widget.id}")),
      body: Container(
        margin: EdgeInsets.all(size.height/50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Title",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: size.height/140,),
            Text('${ context.read<GetNewsDataByIdNotifier>().newsDataById.title}'),
            SizedBox(height: size.height/50,),
            const Text("Discription",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: size.height/140,),
            Text('${ context.read<GetNewsDataByIdNotifier>().newsDataById.body}')
          ],
        ),
      ),
    );
  }
}