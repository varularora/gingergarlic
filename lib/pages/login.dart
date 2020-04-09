import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gg/pages/home.dart';


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;


  @override
  void initState() {
    super.initState();
    isSignedIn();
  }
  void isSignedIn() async{
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLogedin = await _googleSignIn.isSignedIn();
    if(isLogedin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async{
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken,accessToken: googleAuth.accessToken);
      final FirebaseUser _firebaseUser = (await _auth.signInWithCredential(credential)).user;

      //final FirebaseUser firebaseUser = await _auth.SignInWithCredential(idToken:googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);


      if(_firebaseUser !=null) {
        final QuerySnapshot result = await Firestore.instance.collection(
            "users").where("id", isEqualTo: _firebaseUser.uid).getDocuments();
        final List<DocumentSnapshot> documents = result.documents;
        if (documents.length == 0) {
          Firestore.instance.collection("users")
              .document(_firebaseUser.uid)
              .setData({"id" : _firebaseUser.uid,
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
        }
        );

        }
        else{}
        return _firebaseUser;
   }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
