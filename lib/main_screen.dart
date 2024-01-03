import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_http/detail_screen.dart';
import 'package:bloc_http/models/user_model.dart';
import 'package:bloc_http/repos/repositories.dart';
import 'blocs/app_blocs.dart';
import 'blocs/app_events.dart';
import 'blocs/app_states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BLoC and HTTP App'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is UserLoadedState){
              List<UserModel> userList = state.users;
              return UserList(userList: userList);
            }

            if(state is UserErrorState){
              return const Center(child: Text("Error"),);
            }
            
            return Container();
          },
        ),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  final List<UserModel> userList;
  const UserList({Key? key, required this.userList}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        final UserModel user = userList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailScreen(user: user);
            }));
          },
          child: Card(
            color: Colors.blue,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 24.0, left: 12.0),
                    child: Text(
                      '${user.firstname} ${user.lastname}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                    radius: 25,
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: userList.length,
    );
  }
}