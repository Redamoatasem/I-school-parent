import 'package:flutter/material.dart';
import 'package:mobile_tracker_two/shared/constant.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Edit Profile',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/ahmed_moh.PNG'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                initialValue: 'Ahmed Mohamed',
              ),
              SizedBox(height: 10),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                initialValue: 'melpeters@gmail.com',
              ),
              SizedBox(height: 10),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                initialValue: '************',
                obscureText: true,
              ),
              SizedBox(height: 10),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                initialValue: '01002578666',
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     // Save changes action
              //   },
              //   child: Text('Save changes'),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.orange[600],
              //     padding: EdgeInsets.symmetric(vertical: 12),
              //     textStyle: TextStyle(fontSize: 18),
              //   ),
              // ),
              InkWell(
                child: Image.asset('assets/save_changes.PNG'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
