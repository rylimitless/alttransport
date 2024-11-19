import 'package:alt_transport/booking/booking.dart';
import 'package:alt_transport/services/pocketbase/pb_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:toastification/toastification.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginScreen();
}

class _LoginScreen extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            // leading: Text('Sign in to your Account'),
          
            // stretch: _stretch,
            onStretchTrigger: () async {
              // Triggers when stretching
            },
            // [stretchTriggerOffset] describes the amount of overscroll that must occur
            // to trigger [onStretchTrigger]
            //
            // Setting [stretchTriggerOffset] to a value of 300.0 will trigger
            // [onStretchTrigger] when the user has overscrolled by 300.0 pixels.
            stretchTriggerOffset: 300.0,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(

              titlePadding: const EdgeInsets.all(20),
              centerTitle: false,
              
              title: const Align(
                alignment: Alignment.bottomRight,
                child: Text('Sign in to your Account',
                style: TextStyle(
                  fontWeight: FontWeight.w500
                  
                ),
                ),
              ),
              
              background:  Image.asset(
                
                  "assets/image/file.jpg",
                  width: double.infinity,
                  height: 150,
                ),
            ),
          ),
          SliverFillRemaining(
            child:  Center(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
              
                const SizedBox(
                  height: 70,
                ),
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a value";
                                }
                                return null;
                              },
                            ),
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              // prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a value";
                              }
                              return null;
                            },
                          ),
                            
                            const Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: null,
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blue),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                final service = GetIt.I.get<PbService>();
                                final isLoggedin = await service.login(
                                    emailController.text,
                                    passwordController.text);
        
                                if (isLoggedin) {
                                  toastification.show(
                                    context:
                                        context, // optional if you use ToastificationWrapper
                                    title: Text('Welcome Back'),
                                    autoCloseDuration: const Duration(seconds: 1),
                                  );

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingPage()));
                                }else {
                                  toastification.show(
          context: context, // optional if you use ToastificationWrapper
          title: Text('Invalid Credentials'),
          autoCloseDuration: const Duration(seconds: 1),
        );
                                }
                                print("Hello");
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              } else {
                                print("mhmmm");
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(
                                    255,
                                    3,
                                    192,
                                    60,
                                  )),
                              child: const Center(
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      color: Colors.white,
                                      // color: Color.fromARGB(255, 211, 199, 199)
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                           Row(children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: (){
                          
                                //Go to sign up
                              },
                              child: const Text("Sign up instead",
                                
                                style: TextStyle(
                                  color: Colors.blue,
                                  
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  )
                              ),
                            )
                          ],)
                       
                        ],
                      ),
                    ))
        
                // Form(child: )
              ],
            ),
          ),
        ),
          )
         
        ]
      )
    
    );
  }
}
