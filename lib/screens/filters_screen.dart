import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName='/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree=false;
  var _vegetarian=false;
  var _vegan=false;
  var _lactoseFree=false;

  @override
  initState(){
    _glutenFree=widget.currentFilters['gluten'];
    _lactoseFree=widget.currentFilters['lactose'];
    _vegan=widget.currentFilters['vegan'];
    _vegetarian=widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title,String description,bool currentValue,Function updateValue){
    return SwitchListTile(
                    title:Text(title),
                    value: currentValue,
                    subtitle: Text(description),
                    onChanged: updateValue,
                  );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Your Favourites'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),onPressed: (){
            final selectedfilters={
                  'gluten':_glutenFree,
                  'vegan':_vegan,
                  'vegetarian':_vegetarian,
                  'lactose':_lactoseFree,
                };
            widget.saveFilters(selectedfilters);
            },)
        ],
      ),
      drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding:EdgeInsets.all(20),
              child:Text('Adjust Your meal selection!',
              style:Theme.of(context).textTheme.title),
            ),
            Expanded(
              child:ListView(
                children: <Widget>[
                  _buildSwitchListTile('Gluten-Free', 'Onlu include Gluten free meals', _glutenFree,(newValue){
                    setState(() {
                      _glutenFree=newValue;
                    });
                  }),
                  _buildSwitchListTile('Lactose-Free', 'Onlu include Lactose free meals', _lactoseFree,(newValue){
                    setState(() {
                      _lactoseFree=newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian', 'Onlu include vegetarian meals', _vegetarian,(newValue){
                    setState(() {
                      _vegetarian=newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegan', 'Onlu include vegan meals', _vegan,(newValue){
                    setState(() {
                      _vegan=newValue;
                    });
                  }),
                ],
              ) )
          ],
        )
    );
  }
}