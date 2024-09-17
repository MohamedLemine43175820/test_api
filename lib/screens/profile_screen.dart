import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_cubit.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit , UserState>(
      listener: (BuildContext context, UserState state) {



         if(state is GetUserErrorState) {
           ScaffoldMessenger.
           of(context).
           showSnackBar(SnackBar(content: Text(state.errorMessage)),
           );
         }


        
      },
      builder: (BuildContext context, UserState state) {


        return Scaffold(
          body: state is GetUserloadingState ? CircularProgressIndicator() : state is GetUserSuccessState ?ListView(
            children: [
              const SizedBox(height: 16),
              //! Profile Picture
              CircleAvatar(
                radius: 80,
               backgroundImage: NetworkImage(state.user.profilePic),
              ),
              const SizedBox(height: 16),

              //! Name
              ListTile(
                title: Text(state.user.name),
                leading: Icon(Icons.person),
              ),
              const SizedBox(height: 16),

              //! Email
               ListTile(
                title: Text(state.user.email),
                leading: Icon(Icons.email),
              ),
              const SizedBox(height: 16),

              //! Phone number
               ListTile(
                title: Text(state.user.phone),
                leading: Icon(Icons.phone),
              ),
              const SizedBox(height: 16),

              //! Address
               ListTile(
                title: Text(state.user.location['type']),
                leading: Icon(Icons.location_city),
              ),
              const SizedBox(height: 16),
            ],
          ) : Container(),
        );
      },

    );
  }
}
