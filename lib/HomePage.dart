import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Todo:import images
  AssetImage circle=AssetImage("images/circle.png");
  AssetImage lucky=AssetImage("images/rupee.png");
  AssetImage unlucky=AssetImage("images/sadFace.png");

  //Todo:get an array

  List<String> itemArray;  //we are not adding number here because there are 25 numbers(large amount of numbers)
  int luckyNumber;

  //Todo:init array with 25 elements
  @override
  void initState() {
    super.initState();
    itemArray=List<String>.generate(25, (index)=>"empty");
    generateRandomNumber();
  }
  generateRandomNumber(){
    int random=Random().nextInt(25);
    setState(() {
     luckyNumber=random; 
    });

  }

  //Tod0:define a get image method
  AssetImage getImage(int index){
    String currentState=itemArray[index];
    switch (currentState) {
      case "lucky":

        return lucky;
        break;

      case "unlucky":
        return unlucky;
        break;  
 
    }
    return circle;
  }

  //Todo:play game method
  playGame(int index){
    if(luckyNumber==index){
      setState(() {
       itemArray[index]="lucky"; 
      });
    }else{
      setState(() {
       itemArray[index]="unlucky"; 
      });
    }
  }

  //Todo:show all
  showAll(){
    setState(() {
     itemArray=List<String>.filled(25, "unlucky");
     itemArray[luckyNumber]="lucky"; 
    });
  }

  //Todo:reset
  resetGame(){
    setState(() {
     itemArray=List<String>.filled(25, "empty");                  //.generate function is used for the initialisation process only. after that we have to use filled function  
    });
    generateRandomNumber();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch and Win'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,  //crossAxisAlignment means left to right
        mainAxisAlignment: MainAxisAlignment.start,      //mainAxis means top to bottom
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray.length,    //how many items do we need
              itemBuilder:(context,i)=>SizedBox(
                width: 50.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: (){
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(i),
                  ),
                ),
              ) ,                  //what items do we need
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: RaisedButton(
              onPressed: (){
                this.showAll();
              },
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              child: Text('Show All',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),),
            ),

          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: RaisedButton(
              onPressed: (){
                this.resetGame();
              },
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              child: Text('Reset',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),),
            ),
          ),
          Container(
            
           color: Colors.black,
           padding: EdgeInsets.all(20.0),
           child: Text('Wizards.co.in',
           style: TextStyle(
             color: Colors.white,
             fontSize: 20.0
           ),),
           
          ),

          
        ],

      ),
      
    );
  }
}