
import 'package:flutter/material.dart';
import 'package:portfolio/colorconst.dart';
import 'package:portfolio/pages/blog_page.dart';
import 'package:portfolio/pages/pictures_screen.dart';



class HomePage extends StatefulWidget{

  HomePageState createState(){
    return HomePageState();
  }
}
class HomePageState extends State<HomePage>{
  int selectedIndex = 0;




  @override
  Widget build(BuildContext context) {
    var initWidth= MediaQuery.of(context).size.width;
    var initHidth= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,





      body:SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30.0),      
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
      
            if(MediaQuery.of(context).size.width >= 480)Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return BlogScreen();
                    }));
                   }, child: Text("Blog", style: TextStyle(color: textColor, fontSize: 24),)),
                   TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                      return PictScreenCamera();
                    }));
                   }, child: Text("Images",style: TextStyle(color: textColor, fontSize: 24),)),
                   TextButton(onPressed: (){}, child: Text("Education",style: TextStyle(color: textColor, fontSize: 24),)),
                   TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return BlogScreen();
                    }));
                   }, child: Text("Blog",style: TextStyle(color: textColor, fontSize: 24),)),
                   TextButton(onPressed: (){}, child: Text("Connect",style: TextStyle(color: textColor, fontSize: 24),)),
                  ],
                ),
      
              SizedBox(height: 100,),
      
              Padding(
                padding: const EdgeInsets.only(left:180, right: 10),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                  final screenWidth = initWidth*0.8;
                  final targetWidth = screenWidth <=  initWidth*0.8? initHidth*0.5 : initHidth * 1;
                  
      
                  return Center(
                    child: Container(
                      width: screenWidth,
                      height: targetWidth,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: borderColor),
                        borderRadius: BorderRadius.circular(29.0),
                      ),
                      
                              child: Center(
                                child: RichText(
                                                text: TextSpan(
                                                  style: DefaultTextStyle.of(context).style,
                                                  children:const  <TextSpan>[
                                                    TextSpan(
                                                      text: 'Hello, I am a Flutter Developer with a passion for crafting innovative .\n',
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                    TextSpan(
                                                      text:
                                'Second paragraph of text with a different style.\n',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.red,
                                                        fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Third paragraph of text.\n',
                                                    ),
                                                  ],
                                                ),
                                ),
                              ),
                            ),
                  );
      
                  }
                ),
          
            
              
              
              )
            
            ]
      
           
          ),
        ),
      ),



      bottomNavigationBar: MediaQuery.of(context).size.width <=480?BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (selectedIndex) => setState(() {
          this.selectedIndex = selectedIndex;
        }),
        items: [

          BottomNavigationBarItem(
            label: "Dashboard",
            icon: CircleAvatar(child: Icon(Icons.dashboard)),),
          BottomNavigationBarItem(
            label: "Email",
            icon: CircleAvatar(
              child:  Icon(Icons.email)),),
          BottomNavigationBarItem(
            label: "Contact",
            icon: CircleAvatar(child:  Icon(Icons.contact_mail)),),
          BottomNavigationBarItem(
            label: "Recent",
            icon: CircleAvatar(child:  Icon(Icons.recent_actors_sharp)),),
          BottomNavigationBarItem(
            label: "Projects",
            icon: CircleAvatar(child:  Icon(Icons.volunteer_activism)),),

      ]
      

      ):null,


      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
                      return BlogScreen();
                    }));
      }, child: Icon(Icons.read_more),),
    );



  }
}
