import 'package:eirmuplb/reusable_widgets/my_farm_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'database/myfarm_db.dart';
import 'home.dart';
import 'main.dart';
import 'model/myfarm.dart';
import 'my_farm_detail.dart';
import 'my_farm_edit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyFarmPage extends StatefulWidget {
  const MyFarmPage({Key? key}) : super(key: key);


  @override
  State<MyFarmPage> createState() => _MyFarmPageState();
}

class _MyFarmPageState extends State<MyFarmPage> {
  late List<Farm> farms;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshMyFarm();
  }

  @override
  void dispose() {
    MyFarmDatabase.instance.close();

    super.dispose();
  }

  Future refreshMyFarm() async {
    setState(() => isLoading = true);

    farms = await MyFarmDatabase.instance.allFarm();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationMenuDrawer(),
    appBar: AppBar(
      backgroundColor: Color(0xFF27ae60),
      title: const Text(
        'My Farm',
        style: TextStyle(fontSize: 24),
      ),

    ),
    body: Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : farms.isEmpty

          ? const Text(
        'No Farm yet',
        style: TextStyle(color: Colors.black38, fontSize: 24),
      )
          : SingleChildScrollView(child: buildMyFarm()),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor:  Color(0xff0a2f19),
      child: const Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AddEditNotePage()),
        );

        refreshMyFarm();
      },
    ),
  );
  Widget buildMyFarm() => StaggeredGrid.count(
    // itemCount: notes.length,
    // staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: List.generate(
        farms.length,
            (index) {
          final farm = farms[index];

          return StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyFarmDetailPage(farmId: farm.id!),
                ));

                refreshMyFarm();
              },
  onLongPress: () {
         _showDialog(context, farm,);
         },
              child: MyFarmWidget(farm: farm, index: index),
            ),
          );
        },
      ));


}
void _showDialog(BuildContext context, Farm farm) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Prioritize', textAlign: TextAlign.center),
        content: const Text('Are you sure you want to put this in front page?', textAlign: TextAlign.center),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 60),
              TextButton(
                onPressed: () {
                  // Navigate to HomeRoute with the farm.title
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeRoute(),
                    ),
                  );
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
        ],
      );
    },
  );
}


