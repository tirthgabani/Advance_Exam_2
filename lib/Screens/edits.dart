import 'package:exam_2/Collection/helper_collection.dart';
import 'package:exam_2/Modal_class/users_modal.dart';
import 'package:exam_2/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'globals.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  GlobalKey<FormState> edit = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.Name.clear();
    Global.Age.clear();
    Global.Post.clear();
  }

  @override
  Widget build(BuildContext context) {
    int? index = ModalRoute.of(context)?.settings.arguments as int?;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Global.Name.text = Global.data[index!]['Name'];
      Global.Age.text = Global.data[index]['Age'].toString();
      Global.Post.text = Global.data[index]['Post'];
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 25,
          icon: Icon(CupertinoIcons.back, color: MyColors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          (index.isNull) ? "Add User" : "Edit User",
          style: const TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: edit,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: Global.Name,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter the Name";
                  }
                },
                style: GoogleFonts.poppins(color: MyColors.black),
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  errorStyle: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: Global.Age,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter the Age";
                  }
                },
                style: GoogleFonts.poppins(color: MyColors.black),
                decoration: InputDecoration(
                  hintText: "Age",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  errorStyle: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: Global.Post,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter the Role";
                  }
                },
                style: GoogleFonts.poppins(color: MyColors.black),
                decoration: InputDecoration(
                  hintText: "Post",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  errorStyle: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 50),
              CupertinoButton.filled(
                child: Text((index.isNull) ? "Add" : "Update"),
                onPressed: () {
                  if (edit.currentState!.validate()) {
                    UserData userData = UserData(
                        Name: Global.Name.text,
                        Age: int.parse(Global.Age.text),
                        Post: Global.Post.text);
                    if (index.isNull) {
                      CollectionHelper.instance.insertData(userData);
                    } else {
                      CollectionHelper.instance
                          .updateData(index: index!, userData: userData);
                    }
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
