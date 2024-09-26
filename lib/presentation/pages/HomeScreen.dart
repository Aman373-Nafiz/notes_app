import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/data/model/WorkModel.dart';
import 'package:notes_app/data/repositories/Work%20repositort.dart'; // Import the GetX controller

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WorkRepository()); // Initialize the controller

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const Secondary(),
          ),
          // Add more GoRoutes for other screens as needed
        ],
      ),
    );
  }
}

class Secondary extends StatelessWidget {
  const Secondary({super.key});

  @override
  Widget build(BuildContext context) {
    final WorkRepository todoController = Get.put(WorkRepository());
    todoController.fetchData();

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          "My TODO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        shape: CircleBorder(),
        onPressed: () {
          context.go('/add-work');
        },
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: todoController.aw.length,
          itemBuilder: (BuildContext context, int index) {
            final item = todoController.aw[index];
            return Dismissible(
              key: ValueKey(item),
              background: Container(
                color: Colors.lightGreen,
                child: Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 36,
                  ),
                ),
              ),
              onDismissed: (DismissDirection direction) {
                todoController.deleteData(index);
              },
              child: Container(
                margin: EdgeInsets.all(15),
                height: 70,
                decoration: BoxDecoration(
                  color: item.isChecked ? Colors.red : Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                 
                  title: GestureDetector(
                    onTap: () {
                      context.go('/details/$index');
                    },
                    child: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        decoration: item.isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
