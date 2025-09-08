// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:random_string/random_string.dart';

// import '../../services/database.dart';
// import '../../widgets/widget_support.dart';

// class AddContent extends StatefulWidget {
//   const AddContent({super.key});

//   @override
//   State<AddContent> createState() => _AddContentState();
// }

// class _AddContentState extends State<AddContent> {
//   final List<String> categories = ['Pdf', 'Notes', 'Questions', 'Important'];
//   String? value;
//   TextEditingController branchController = TextEditingController();
//   TextEditingController subjectController = TextEditingController();
//   TextEditingController contentController = TextEditingController();

//   File? selectedPDF;
//   String? pdfName;

//   // Future<String?> uploadPDF(File pdfFile) async {
//   //   try {
//   //     String fileName = "pdfs/${DateTime.now().millisecondsSinceEpoch}.pdf";
//   //     Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
//   //     UploadTask uploadTask = storageReference.putFile(pdfFile);
//   //     TaskSnapshot snapshot = await uploadTask;
//   //     String downloadUrl = await snapshot.ref.getDownloadURL();
//   //     return downloadUrl; // Return the URL
//   //   } catch (e) {
//   //     print("Error uploading PDF: $e");
//   //     return null;
//   //   }
//   // }

//   Future getPDF() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//     if (result != null) {
//       setState(() {
//         selectedPDF = File(result.files.single.path!);
//         pdfName = result.files.single.name;
//       });
//     }
//   }

//   uploadItem() async {
//     if (selectedPDF != null &&
//         branchController.text.isNotEmpty &&
//         subjectController.text.isNotEmpty &&
//         contentController.text.isNotEmpty) {
//       String addId = randomAlphaNumeric(10);

//       Map<String, dynamic> addItem = {
//         "PDF Name": pdfName,
//         "Branch": branchController.text,
//         "Subject": subjectController.text,
//         "Content": contentController.text,
//       };
//       await DatabaseMethods().addContent(addItem, value!).then((value) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "PDF has been added Successfully",
//               style: TextStyle(fontSize: 18.0),
//             ),
//           ),
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: Icon(
//             Icons.arrow_back_ios_new_outlined,
//             color: Color(0xFF373866),
//           ),
//         ),
//         centerTitle: true,
//         title: Text("Add Content", style: AppWidget.headlineTextFieldStyle()),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   "Upload the PDF",
//                   style: AppWidget.semiBoldTextFieldStyle(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               selectedPDF == null
//                   ? GestureDetector(
//                     onTap: getPDF,
//                     child: Center(
//                       child: Material(
//                         elevation: 4.0,
//                         borderRadius: BorderRadius.circular(20),
//                         child: Container(
//                           width: 150,
//                           height: 150,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black, width: 1.5),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Icon(
//                             Icons.picture_as_pdf_outlined,
//                             color: Color(0xFFff5c10),
//                             size: 90,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                   : Center(
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.picture_as_pdf_outlined,
//                           size: 90,
//                           color: Color(0xFFff5c10),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           pdfName ?? "PDF Selected",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//               SizedBox(height: 30.0),
//               buildTextField(
//                 "Branch Name",
//                 branchController,
//                 "Enter Branch Name",
//               ),
//               buildTextField(
//                 "Subject",
//                 subjectController,
//                 "Enter Subject Name",
//               ),
//               buildTextField(
//                 "Content",
//                 contentController,
//                 "Topic Explanation",
//                 maxLines: 6,
//               ),
//               buildDropdown(),
//               SizedBox(height: 30.0),
//               GestureDetector(
//                 onTap: uploadItem,
//                 child: Center(
//                   child: Material(
//                     elevation: 5.0,
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 10.0),
//                       width: 150,
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Add",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 22.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(
//     String label,
//     TextEditingController controller,
//     String hint, {
//     int maxLines = 1,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: AppWidget.semiBoldTextFieldStyle()),
//         SizedBox(height: 10.0),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.0),
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             color: Color(0xFFececf8),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: TextField(
//             controller: controller,
//             maxLines: maxLines,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               hintText: hint,
//               hintStyle: AppWidget.lightTextFieldStyle(),
//             ),
//           ),
//         ),
//         SizedBox(height: 20.0),
//       ],
//     );
//   }

//   Widget buildDropdown() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Select Category", style: AppWidget.semiBoldTextFieldStyle()),
//         SizedBox(height: 10.0),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 10.0),
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             color: Color(0xFFececf8),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//               items:
//                   categories
//                       .map(
//                         (item) =>
//                             DropdownMenuItem(value: item, child: Text(item)),
//                       )
//                       .toList(),
//               onChanged: (val) => setState(() => value = val),
//               dropdownColor: Colors.white,
//               hint: Text("Select Category"),
//               iconSize: 36,
//               icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//               value: value,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }