import 'package:flutter/material.dart';
import 'package:myhttp/http/httpstudent.dart';
import 'package:myhttp/model/student.dart';

class DisplayStudentScreen extends StatefulWidget {
  const DisplayStudentScreen({Key? key}) : super(key: key);

  @override
  _DisplayStudentScreenState createState() => _DisplayStudentScreenState();
}

class _DisplayStudentScreenState extends State<DisplayStudentScreen> {
  late Future<List<Student>> futureStudent;
  String photourl = 'http://10.0.2.2:3000/uploads/';

  @override
  void initState() {
    super.initState();
    futureStudent = HttpConnectStudent().getStudents();
  }

  // desingning custom card widget
  Widget myCard(Student obj) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Card(
        child: Stack(
          children: [
            Image.network(
              photourl + obj.photo!,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              left: 80,
              bottom: 2,
              child: Row(
                children: [
                  Text(
                    '${obj.fullname}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    '${obj.address}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 5,
              right: 10,
              child: Icon(Icons.delete, color: Colors.red, size: 40),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Information'),
      ),
      body: FutureBuilder<List<Student>>(
        future: futureStudent,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: myCard(snapshot.data![index]),

                    //     ListTile(
                    //   title: Text('$index'),
                    //   subtitle: Text(
                    //     '${snapshot.data![index].fullname} \t ${snapshot.data![index].address}   ',
                    //   ),
                    // ),
                  );
                }
                // ListTile(
                //   title: Text('$index'),
                //   subtitle: Text(
                //     '${snapshot.data![index].fullname} \t ${snapshot.data![index].address}   ',
                //   ),
                // );

                );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
