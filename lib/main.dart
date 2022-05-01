import 'package:destiny_app/story_brain.dart';
import 'package:flutter/material.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHome(),
    );
  }
}

//TODO: Step 9 - Create a new storyBrain object from the StoryBrain class.
StoryBrain storyBrain = StoryBrain();


class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {




  void next(int type){
    setState(() {

      storyBrain.nextStory(type);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/background.png'), fit: BoxFit.cover)
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //TODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
                  //Choice 1 made by user.
                  //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                  child: MyButton(text: storyBrain.getChoice1(),  press: (){
                    next(1);
                  }, color: Colors.lightGreen.shade600,)
              ),

              SizedBox(
                height: 20.0,
              ),
              Expanded(
                  flex: 2,
                  //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                  //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                  //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
                  //Choice 2 made by user.
                  //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                  child: Visibility(
                      visible: storyBrain.buttonShouldBeVisible(),
                      child: MyButton(text: storyBrain.getChoice2(), press: () => next(2), color: Colors.pinkAccent.shade700,))

              ),
            ],
          ),
        ),
      ),
    );
  }
}






class MyButton extends StatelessWidget {
  const MyButton({Key? key,required this.text, required this.press,required this.color}) : super(key: key);

  final String text;
  final Function press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ()=>press(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),

        padding: EdgeInsets.symmetric(vertical: 20),
        width: 350,
        height: 150,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}


//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/