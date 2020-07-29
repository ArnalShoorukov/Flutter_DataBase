import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/great_places.dart';
import 'package:todo/screens/add_place_screen.dart';

class PlacesListScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(AddPlaceScreen.routName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting ?  Center(child: CircularProgressIndicator(),) : Consumer<GreatPlaces>(
          child: Center(
            child: const Text('Got no places yet, start adding some'),
          ),
          builder: (ctx, greatpplace, ch) => greatpplace.items.length <= 0
          ? ch
          : ListView.builder(
            itemCount: greatpplace.items.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(backgroundImage: FileImage(
                    greatpplace.items[i].image),
                ),
                title: Text(greatpplace.items[i].title),
                onTap: (){
                  ///Go to detail page
                },
              ),
          ),
        ),
      ),
    );
  }
}
