import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart'
        show GoogleSignIn, GoogleSignInAccount, GoogleSignInAuthentication;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gg/pages/home.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;


  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

     GoogleSignInAccount googleUser = await googleSignIn.signIn();
     GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;

     AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
     FirebaseUser _firebaseUser = (await _auth.signInWithCredential(credential)).user;



    if (_firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance.collection(
          "users").where("id", isEqualTo: _firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        Firestore.instance.collection("users")
            .document(_firebaseUser.uid)
            .setData({"id": _firebaseUser.uid,
          "username": _firebaseUser.displayName,
          "profilePicture": _firebaseUser.photoUrl});
        await preferences.setString("id", _firebaseUser.uid);
        await preferences.setString("username", _firebaseUser.displayName);
        await preferences.setString("photUrl", _firebaseUser.displayName);
      }

      else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("username", documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: "Login was successful");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    else {
      Fluttertoast.showToast(msg: "Login Failed");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text("Login", style: TextStyle(color: Colors.red.shade700),),
        elevation: 0.2,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset('images/back.jpg', fit:BoxFit.cover, width: double.infinity,),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset('images/back.jpg',
            width: 150, height: 150,),

          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
            child : Padding(
              padding: const EdgeInsets.only(left:12, right:12, top:8, bottom: 8),

            child: FlatButton(
                color: Colors.red.shade700,
                onPressed: () {
                  handleSignIn();
                },
                child: Text("Sign in / Sign up with google",
                  style: TextStyle(color: Colors.white),)
          ),
        ),



      )
    );
  }
}


