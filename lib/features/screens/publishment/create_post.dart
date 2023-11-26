import 'dart:developer';
import 'dart:io';
import 'package:Freelanceri/features/providers/postProvider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/features/model/postModel.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  List<String> kohezgjatja = ['1-5 ditë', '1-4 javë', '1-3 muaj', '3-6 muaj'];
  List<String> qytetet = [
    'Prishtina',
    'Prizren',
    'Peja',
    'Mitrovica',
    'Gjakova',
    'Ferizaj',
    'Vushtrri',
    'Gjilan',
    'Rahovec',
    'Besianë',
    'Fushë Kosova',
    'Lipjan',
    'Istog',
    'Shtime',
    'Obiliq',
    'Drenas',
    'Skenderaj',
    'Kaçanik',
    'Klina',
    'Therandë',
    'Dragrash',
    'Viti',
    'Deçan',
    'Malishevë',
    'Shtërpcë',
    'Kamenica',
    'Leposaviq',
  ];
  List<String> postCategory = [
    'Punë ditore',
    'Mjeshtër',
    'Kontabilitet',
    'Zhvillim Softuerik',
    'Dizajn Mode',
    'Web zhvillim',
    'Dizajn grafik',
    'Video editim',
    'Ndërtim',
    'Inxhinieri',
    'Avokat',
    'Fotograf',
    'Mjekësi',
    'Këshillim',
    'Kontabilist',
    'Jurist',
    'Tjeter'
  ];

  String? jobCategoryController;//
  String? cityController;//
  String? durationController;
  String? experienceLevel;
  int jobCategoryId = 1;
  TextEditingController titleController = TextEditingController();//
  TextEditingController descriptionController = TextEditingController();//
  TextEditingController numberOfFreelancersController = TextEditingController();//
  TextEditingController budgetController = TextEditingController();//
  TextEditingController requirementsController = TextEditingController();//

  bool posting=false;

  String jobCategoryError = '';
  String cityError = '';
  String durationError = '';
  String experienceError = '';
  String jobCategoryIdError = '';
  String titleError = '';
  String descriptionError = '';
  String neededWorkersError = '';
  String budgetError = '';
  String requirementsError = '';
  File? _selectedImage;

  post(context) async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        numberOfFreelancersController.text.isEmpty ||
        budgetController.text.isEmpty ||
        requirementsController.text.isEmpty ||
        jobCategoryController!.isEmpty ||
        cityController!.isEmpty ||
        durationController!.isEmpty ||
        experienceLevel!.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Fill all the fields!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(snackBar);
      return;
    } else {
      setState(() => posting = true);
      var postProvider = Provider.of<PostProvider>(context, listen: false);
      PostModel postModel = PostModel(
        id: M.ObjectId(),
        title: titleController.text,
        description: descriptionController.text,
        duration: durationController!,
        neededWorkers: int.parse(numberOfFreelancersController.text),
        budget: int.parse(budgetController.text),
        city: cityController!,
        requirements: requirementsController.text,
        experienceLevel: experienceLevel!,
        postCategory: jobCategoryController.toString(),
        postCategoryID: "2", // Assuming this should be a string
        userId: "asdsadas",
      );

      await postProvider.createPost(postModel);
    }
  }

  // Future _pickImageFromGallery(context) async {
  //   try {
  //     final returnedImage =
  //         await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //     if (returnedImage == null) return;
  //
  //     setState(() {
  //       _selectedImage = File(returnedImage.path);
  //     });
  //
  //     if (_selectedImage != null) {
  //       await _uploadImage(context, _selectedImage!);
  //       print(_selectedImage!);
  //     }
  //   } catch (e) {
  //     log('Error picking image: $e');
  //   }
  // }
  //
  // Future<void> _uploadImage(context, File imageFile) async {
  //   var uri = Uri.parse('http://10.0.2.2:7000/posts');
  //   var request = http.MultipartRequest('POST', uri);
  //
  //   // Add image file to the request
  //   request.files.add(
  //     await http.MultipartFile.fromPath(
  //       'image',
  //       imageFile.path,
  //       contentType: MediaType('image', imageFile.path.split(".").last),
  //     ),
  //   );
  //
  //   try {
  //     var response = await request.send();
  //     String responseBody = await response.stream.bytesToString();
  //
  //     if (response.statusCode == 200) {
  //       print('Image uploaded successfully');
  //       print('Server Response: $responseBody');
  //     } else {
  //       print('Failed to upload image. Status code: ${response.statusCode}');
  //       print('Server Response: $responseBody');
  //     }
  //   } catch (e, stackTrace) {
  //     print('Error uploading image: $e');
  //     print('Stack trace: $stackTrace');
  //   }
  // }



  @override
  void initState() {
    super.initState();
  }

  final timestamp = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset("assets/svg/submit_txt.svg"),
        toolbarHeight: 80,
        elevation: 5,
        shadowColor: primaryBlue,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: const Text(
                "Krijo postim pune",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Text(
                "Titulli",
                style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  // bottom: size.height * 0.03,
                  right: size.width * 0.03,
                  top: size.height * 0.02),
              child: TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: const Color(0xffF5F5F5),
                    hintText: 'Front-End developer',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: primaryBlue, width: 1),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            titleError != ''
                ? Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: const Text(
                      'Ju lutëm plotësoni fushën',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Text(
                "Pershkrimi i punes",
                style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.03,
                  left: size.width * 0.03,
                  top: size.height * 0.02),
              child: SizedBox(
                height: size.height * 0.25,
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.symmetric(vertical: 50),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: const Color(0xffF5F5F5),
                      hintText: 'example',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.2), width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: primaryBlue, width: 1),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            descriptionError != ''
                ? Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: const Text(
                      'Ju lutëm plotësoni fushën',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Kohëzgjatja"),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: size.height * 0.1,
                        width: size.width * 0.38,
                        child: DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 0, color: Colors.transparent)),
                            // Add more decoration..
                          ),
                          hint: Text(
                            '1-2 ditë',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[500]),
                          ),
                          items: kohezgjatja
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Zgjedh kohëzgjatjen';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            durationController = value.toString();
                          },
                          onChanged: (String? value) {
                            setState(() {
                              durationController = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Numri i freelancereve"),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: size.height * 0.065,
                        width: size.width * 0.38,
                        child: TextFormField(
                          controller: numberOfFreelancersController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fillColor: const Color(0xffF5F5F5),
                              hintText: '0',
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: primaryBlue, width: 1),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            durationError != '' || neededWorkersError != ''
                ? Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: const Text(
                      'Ju lutem plotësoni dy fushat',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Text(
                "Bugjeti",
                style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.height * 0.03,
                  right: size.width * 0.03,
                  top: size.height * 0.02),
              child: TextFormField(
                controller: budgetController,
                decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: const Color(0xffF5F5F5),
                    hintText: '300.00',
                    suffixIcon: const Icon(
                      Icons.euro,
                      color: primaryBlue,
                    ),
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: primaryBlue, width: 1),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            budgetError != ''
                ? Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: const Text(
                      'Ju lutëm plotësoni fushën',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Text(
                "Qyteti",
                style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.height * 0.03,
                  right: size.width * 0.03,
                  top: size.height * 0.02),
              child: SizedBox(
                height: size.height * 0.1,
                width: size.width * 0.95,
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0, color: Colors.transparent)),
                    // Add more decoration..
                  ),
                  hint: Text(
                    'Qyteti',
                    style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                  ),
                  items: qytetet
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Zgjedh qytetin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cityController = value.toString();
                  },
                  onChanged: (String? value) {
                    setState(() {
                      cityController = value;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            cityError != ''
                ? Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: const Text(
                      'Ju lutëm plotësoni fushën',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Text(
                "Kërkesat për freelancerin",
                style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.03,
                  left: size.width * 0.03,
                  top: size.height * 0.02),
              child: SizedBox(
                height: size.height * 0.25,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  controller: requirementsController,
                  textAlignVertical: TextAlignVertical.top,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.symmetric(vertical: 50),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: const Color(0xffF5F5F5),
                      hintText: 'Degë bachelor...',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.2), width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: primaryBlue, width: 1),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            requirementsError != ''
                ? Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: const Text(
                      'Ju lutëm plotësoni fushën',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03, top: size.height * 0.03),
              child: Text(
                "Niveli i kërkuar i përvojes",
                style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.03,
                  left: size.width * 0.03,
                  top: size.height * 0.02),
              child: Column(
                children: [
                  ListTile(
                    leading: Radio(
                      activeColor: primaryBlue,
                      value: 'Fillestar',
                      groupValue: experienceLevel,
                      onChanged: (value) {
                        setState(() {
                          experienceLevel = value.toString();
                          log(experienceLevel!);
                        });
                      },
                    ),
                    title: const Text("Fillestar"),
                    subtitle: const Text(
                        "Kërkoj dikë relativisht të ri në ketë fushë"),
                  ),
                  ListTile(
                    leading: Radio(
                      activeColor: primaryBlue,
                      value: 'Mesatar',
                      groupValue: experienceLevel,
                      onChanged: (value) {
                        setState(() {
                          experienceLevel = value.toString();
                          log(experienceLevel!);
                        });
                      },
                    ),
                    title: const Text("Mesatar"),
                    subtitle: const Text(
                        "Kërkoj dikë me pervojë mesatare në ketë fushë"),
                  ),
                  ListTile(
                    leading: Radio(
                      activeColor: primaryBlue,
                      value: 'Ekspert',
                      groupValue: experienceLevel,
                      onChanged: (value) {
                        setState(() {
                          experienceLevel = value.toString();
                          print(experienceLevel);
                        });
                      },
                    ),
                    title: const Text("Ekspert"),
                    subtitle: const Text(
                        "Kërkoj ekspertizë gjithëpërfshirëse dhe të thellë në këtë fushë"),
                  ),
                ],
              ),
            ),
            experienceError != ''
                ? Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: const Text(
                      'Ju lutëm zgjedhni njerin opsion',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03, top: size.height * 0.03),
              child: Text(
                "Lloji i punës",
                style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.height * 0.03,
                  right: size.width * 0.03,
                  top: size.height * 0.02),
              child: SizedBox(
                height: size.height * 0.1,
                width: size.width * 0.95,
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0, color: Colors.transparent)),
                    // Add more decoration..
                  ),
                  hint: Text(
                    'Lloji i punës',
                    style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                  ),
                  items: postCategory
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Zgjedh llojin e punës';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    jobCategoryController = value.toString();
                    print(jobCategoryController);
                  },
                  onChanged: (String? value) {
                    setState(() {
                      jobCategoryController = value;
                      print(jobCategoryController);
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            jobCategoryError != ''
                ? Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: const Text(
                      'Ju lutëm plotësoni fushën',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            // Center(
            //   child: GestureDetector(
            //     onTap: () {
            //       _pickImageFromGallery(context);
            //       print("ASD");
            //     },
            //     child: Container(
            //       height: size.height * 0.07,
            //       width: size.width * 0.8,
            //       decoration: BoxDecoration(
            //           border: Border.all(width: 1, color: Colors.grey[500]!),
            //           borderRadius: BorderRadius.circular(10)),
            //       child: const Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Icon(
            //             Icons.upload,
            //             size: 30,
            //             color: primaryBlue,
            //           ),
            //           SizedBox(width: 10),
            //           Text(
            //             "Upload cover image",
            //             style: TextStyle(fontSize: 17),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                if (titleController.text.trim() == '') {
                  setState(() {
                    titleError = 'Ju lutëm plotësoni fushën';
                  });
                }
                if (descriptionController.text.trim() == '') {
                  setState(() {
                    descriptionError = 'Ju lutëm plotësoni fushën';
                  });
                }
                if (durationController == '') {
                  setState(() {
                    durationError = 'Ju lutëm zgjidhni një nga opsionet';
                  });
                }
                if (numberOfFreelancersController.text.trim() == '') {
                  setState(() {
                    neededWorkersError = 'Ju lutëm plotësoni fushën';
                  });
                }
                if (budgetController.text.trim() == '') {
                  setState(() {
                    budgetError = 'Ju lutëm plotësoni fushën';
                  });
                }
                if (experienceLevel == '') {
                  setState(() {
                    experienceError = 'Ju lutëm plotësoni fushën';
                  });
                }
                if (requirementsController.text == '') {
                  setState(() {
                    requirementsError = 'Ju lutëm plotësoni fushën';
                  });
                }
                if (cityController == '') {
                  setState(() {
                    cityError = 'Ju lutëm plotësoni fushën';
                  });
                }
                if (jobCategoryController == '') {
                  setState(() {
                    jobCategoryError = 'Ju lutëm plotësoni fushën';
                  });
                }
                if (jobCategoryId == '') {
                  setState(() {
                    jobCategoryIdError = 'Ju lutëm plotësoni fushën';
                  });
                }

                if (titleError == '' &&
                    descriptionError == '' &&
                    durationError == '' &&
                    neededWorkersError == '' &&
                    budgetError == '' &&
                    cityError == '' &&
                    requirementsError == '' &&
                    experienceError == '' &&
                    jobCategoryError == '' &&
                    jobCategoryIdError == '') {

                  print("Titulli: ${titleController.text}\nDescription:${descriptionController.text}\nDuration:${durationController}\nNumber of freelancers:${numberOfFreelancersController.text}\nBudget:${budgetController.text}\nCity:${cityController}\nRequirements: ${requirementsController.text}\nJob Category:${jobCategoryController}\nJob Category Id${jobCategoryId}\n Experience level:${experienceLevel}");
                  post(context);
                }
              },
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.04,
                      bottom: size.height * 0.04,
                      right: size.width * 0.03,
                      left: size.width * 0.03),
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Posto",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
