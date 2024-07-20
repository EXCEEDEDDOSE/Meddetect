import 'package:meddetect/brain.dart';
import 'package:meddetect/lung.dart';
import 'package:meddetect/heart.dart';
import 'package:meddetect/skin.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select an Option'),
//       ),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               ElevatedButton(
//              onPressed: (){
//               Navigator.pushReplacement(
//                  context,
//                   MaterialPageRoute(builder: (context) => Brain()),
//                  );
//               },
//           style: ElevatedButton.styleFrom(
//           fixedSize: const Size(395, 55),
//           backgroundColor: const Color.fromARGB(255, 234, 7, 255),
          
//         ),
//         child: Text(
//           "Brain Tumor",
//           style: const TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//       ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//              onPressed: (){

//               },
//           style: ElevatedButton.styleFrom(
//           fixedSize: const Size(395, 55),
//           backgroundColor: const Color.fromARGB(255, 234, 7, 255),
          
//         ),
//         child: Text(
//           "Pneumonia",
//           style: const TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: bottomNavigation(),
      backgroundColor: Color.fromRGBO(24, 24, 32, 1), // Set background color here
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, top: 30),
              //   child: InkWell(
              //     onTap: () {},
              //     child: const Icon(
              //       Icons.arrow_back,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, top: 20),
              //   child: const Text(
              //     "Book Tickets",
              //     style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // listMenu(),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: const Text(
                  "Disease Detection",
                  style: TextStyle( color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              destinations(),
            ],
          ),
        ),
      ),
    );
  }

  Widget destinations() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        String text = "Brain Tumor";
        String imagePath = "assets/brain2.jpg";
        if (index == 1) {
          text = "Pneumonia"; // Change text for card 2
          imagePath = "assets/lungs.jpg"; // Change image for card 2
        } else if (index == 2) {
          text = "Cardiomegaly Disease"; // Change text for card 3
          imagePath = "assets/cardio.jpg"; // Change image for card 3
        } else if (index == 3) {
          text = "Skin Disease"; // Change text for card 4
          imagePath = "assets/skin.jpg"; // Change image for card 4
        }

        return InkWell(
          onTap: () {
            if (index == 0) {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Brain()),
              );
            } else if(index==1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Lung()),
              );

            } else if(index==2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Heart()),
              );

            } else if(index==3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Skin()),
              );

            }
            // Add onTap logic here if needed
            print('Card $index tapped');
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 350,
              child: Card(
                shadowColor: Color.fromARGB(255, 19, 67, 103),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          text,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget listMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          menuIcon(Icons.notifications, "Alert"),
          menuIcon(Icons.newspaper, "News"),
          menuIcon(Icons.sos, "Emergency"),
        ],
      ),
    );
  }

  Widget menuIcon(IconData icon, String text) {
    return InkWell(
      onTap: () {
        // Add your onTap logic here
        print('$text tapped');
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // BottomNavigationBar bottomNavigation() {
  //   return BottomNavigationBar(
  //     items: const <BottomNavigationBarItem>[
  //       BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.home,
  //           color: Colors.black,
  //         ),
  //         label: "",
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.phone,
  //           color: Colors.black,
  //         ),
  //         label: "",
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.mail,
  //           color: Colors.black,
  //         ),
  //         label: "",
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.person,
  //           color: Colors.black,
  //         ),
  //         label: "",
  //       ),
  //     ],
  //   );
  // }
}