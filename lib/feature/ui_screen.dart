import 'package:assignment_task/models/api_model_class.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';

class UIScreen extends StatefulWidget {
  const UIScreen({super.key});

  @override
  State<UIScreen> createState() => _UIScreenState();
}

class _UIScreenState extends State<UIScreen> {

  late Future<ApiDataModel> futureApiData;

  @override
  void initState() {
    super.initState();
    futureApiData = ApiService.fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
                'American Chronicles',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),
            backgroundColor: Colors.blue.shade200,
            titleSpacing: 30,
          ),
          body: FutureBuilder<ApiDataModel>(
            future: futureApiData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.items!.isEmpty) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: const Center(
                        child: Text('No Data found')
                    )
                );
              } else {
                final item = snapshot.data!.items ?? [];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: ListView.builder(
                    itemCount: item.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final apiDataModel = item[index];
                        return Column(
                          children: [
                            Card(
                              elevation: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                ),
                                padding: const EdgeInsets.all(5),
                                width: double.infinity,
                                child: ListTile(
                                  title: Text(
                                      '${apiDataModel.title}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  subtitle: Text(
                                      'Publisher: '+'${apiDataModel.publisher}',
                                    style: const TextStyle(
                                      fontSize: 13
                                    ),
                                  ),
                                )
                              ),
                            ),

                            const SizedBox(height: 4),
                          ],
                        );
                      }
                  ),
                );
              }
            },
          ),
        )
    );
  }
}
