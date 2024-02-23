import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(new MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget{
@override
State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles>{
late List<Widget> tiles;

@override
void initState(){
	super.initState();
	tiles = [
	StatefulColorfulTile(key: UniqueKey()),
	StatefulColorfulTile(key: UniqueKey()),
	];
}

@override
Widget build(BuildContext context) {
	return Scaffold(
		appBar: AppBar(
		title: Text("KEYS"),
		backgroundColor: Colors.blue,
		) ,
	body: SafeArea(child: Row(children: tiles)),
	floatingActionButton: FloatingActionButton(
		child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
	);
}

swapTiles(){
	setState(() {
	tiles.insert(1, tiles.removeAt(0));
	});
}
}

class StatefulColorfulTile extends StatefulWidget {
StatefulColorfulTile({required Key key}) : super(key: key);
@override
State<StatefulWidget> createState() => StatefulColorfulTileState();
}
class StatefulColorfulTileState extends State<StatefulColorfulTile> {
late Color myColor;
@override
void initState() {
	super.initState();
	myColor = UniqueColorGenerator.getColor();
}
@override
Widget build(BuildContext context) {
	return Container(
		color: myColor,
		child: Padding(
		padding: EdgeInsets.all(70.0),
		)
    );
}
}

class UniqueColorGenerator {
static List colorOptions = [
	Colors.blue,
	Colors.red,
	Colors.green,
	Colors.yellow,
	Colors.purple,
	Colors.orange,
	Colors.indigo,
	Colors.amber,
	Colors.black,
];
static Random random = new Random();
static Color getColor() {
	if (colorOptions.length > 0) {
	return colorOptions.removeAt(random.nextInt(colorOptions.length));
	} else {
	return Color.fromARGB(random.nextInt(256), random.nextInt(256),
		random.nextInt(256), random.nextInt(256));
	}
}
}
