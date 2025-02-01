import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'user_list_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
      
      
        body: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,

                  ),
                  child:Column(
 children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(

                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
SizedBox(
  width:width*0.22
),
                          Text(
                            "Dating List",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width*0.06,


                            ),
                          ),
                        ],
                      ),


                    ),
 Padding(
   padding: const EdgeInsets.all(15),
   child: TextFormField(
       decoration: InputDecoration(
         fillColor: Colors.white,
          filled: true,
         hintText: "Search",
         hintStyle: TextStyle(
           color: Colors.black45,
         ),
         prefixIcon: Icon(
           Icons.search,
           color: Colors.black,
         ),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
         ),
       ),

     ),
 ),

],
                  ),

                  ),
                ),

              SizedBox(height: 10,),
              Expanded(
                child: Container(
      
                  height: height,
                  width: width,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (!userProvider.isLoading &&
                          scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                        userProvider.fetchUsers();
                      }
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: userProvider.users.length + 1,
      
                      itemBuilder: (context, index) {
                        if (index < userProvider.users.length) {
                          return UserListItem(user: userProvider.users[index]);
      
      
      
                        } else {
                          return userProvider.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
