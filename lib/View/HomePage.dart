import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: CarouselSlider.builder(
                itemCount: categories.length,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 150,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  reverse: false,
                  aspectRatio: 5.0,
                ),
                itemBuilder: (context, i, id){
                  //for onTap to redirect to another screen
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white,)
                      ),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          categories[i],
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){
                      print(i);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 05,vertical: 02),
                    padding :const EdgeInsets.symmetric(horizontal: 05,vertical: 10),
                    decoration: BoxDecoration(
                      border:Border.all(color: Colors.white70,width: 1),
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                      child: Column(
                        children: const [
                          Text('Total Class',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                          SizedBox(height: 8,),
                          Text('25',style: TextStyle(fontSize: 14),),
                        ],
                      ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 05,vertical: 02),
                        padding :const EdgeInsets.symmetric(horizontal: 05,vertical: 10),
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.white70,width: 1),
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      child: Column(
                        children: const [
                          Text('Presence',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                          SizedBox(height: 8,),
                          Text('20',style: TextStyle(fontSize: 14),),
                        ],
                      ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 05,vertical: 02),
                        padding :const  EdgeInsets.symmetric(horizontal: 05,vertical: 10),
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.white70,width: 1),
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: const [
                            Text('Absence',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                            SizedBox(height: 8,),
                            Text('5',style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
  final List<String>  categories = [
    "assets/images/slider1.jpg","assets/images/slider2.JPG","assets/images/slider3.jpg",
    "assets/images/slider4.jpg","assets/images/slider5.jpg",
  ];
}
