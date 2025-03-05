import 'package:car_rentoo/allCarScreen.dart';
import 'package:flutter/material.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, 
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxPV9_fEDhNyiOogPDTFX35aJxi_yngJumxQ&s'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your perfect ride \nJust a tap away!!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Daily Travel or Tourist Ride \nMake every journey comfortable & affordable with us!",
                  style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 80),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCarScreen()));},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Let's Go",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



