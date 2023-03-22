import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universities_list_api/utiles/data_model.dart';
import 'package:universities_list_api/utiles/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;

  @override
  void initState() {
    _getUniversitiesList();
    // TODO: implement initState
    super.initState();
  }

  void _getUniversitiesList() async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    setState(() {
      loading = true;
    });
    await homeProvider.getUniversitites();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final List<UniversitiesData> list = homeProvider.universitiesList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("US Universities"),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                UniversitiesData info = list[index];
                return Card(
                  child: ExpansionTile(
                    title: Text(
                      info.name,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              info.country,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              info.alphaTwoCode,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
