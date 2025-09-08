import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

import '../../services/database.dart';
import '../../widgets/widget_support.dart';

class AddContent extends StatefulWidget {
  const AddContent({super.key});

  @override
  State<AddContent> createState() => _AddContentState();
}

class _AddContentState extends State<AddContent> {
  // Fixed: Match category names exactly with HomeScreen
  final List<String> categories = [
    'HeadPhone',
    'TV',
    'Kitchen Appliances',
    'Living Appliances',
  ];

  String? value;
  TextEditingController productNameController = TextEditingController();
  TextEditingController productBrandController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  File? selectedImage;

  Future getImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        setState(() {
          selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error selecting image: $e")));
    }
  }

  uploadItem() async {
    if (productNameController.text.isNotEmpty &&
        productBrandController.text.isNotEmpty &&
        contentController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        value != null) {
      try {
        String addId = randomAlphaNumeric(10);

        Map<String, dynamic> addItem = {
          "product_name": productNameController.text.trim(),
          "product_brand": productBrandController.text.trim(),
          "product_specification": contentController.text.trim(),
          "price": double.tryParse(priceController.text) ?? 0.0,
          "category": value,
          "image": selectedImage?.path ?? "",
        };

        await DatabaseMethods().addContent(addItem, value!).then((_) {
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Product has been added successfully",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );

          clearForm();
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Error adding product: $e"),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all required fields")),
      );
    }
  }

  void clearForm() {
    setState(() {
      selectedImage = null;
      productNameController.clear();
      productBrandController.clear();
      contentController.clear();
      priceController.clear();
      value = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: Text("Add Product", style: AppWidget.headlineTextFieldStyle()),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Upload the Image",
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
              ),
              SizedBox(height: 20.0),
              selectedImage == null
                  ? GestureDetector(
                      onTap: getImage,
                      child: Center(
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.image_outlined,
                              color: Color(0xFFff5c10),
                              size: 90,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.file(
                              selectedImage!,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Image Selected",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedImage = null;
                              });
                            },
                            child: Text("Remove Image"),
                          ),
                        ],
                      ),
                    ),

              SizedBox(height: 30.0),
              buildTextField(
                "Product Name *",
                productNameController,
                "Enter Product Name",
              ),
              buildTextField(
                "Product Brand *",
                productBrandController,
                "Enter Product Brand Name",
              ),
              buildTextField("Price *", priceController, "Enter Price"),
              buildTextField(
                "Specifications *",
                contentController,
                "Product Specifications",
                maxLines: 6,
              ),

              buildDropdown(),
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: uploadItem,
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Add Product",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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

  Widget buildTextField(
    String label,
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppWidget.semiBoldTextFieldStyle()),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFFececf8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: AppWidget.lightTextFieldStyle(),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Category *", style: AppWidget.semiBoldTextFieldStyle()),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFFececf8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: categories
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (val) => setState(() => value = val),
              dropdownColor: Colors.white,
              hint: Text("Select Category"),
              iconSize: 36,
              icon: Icon(Icons.arrow_drop_down, color: Colors.black),
              value: value,
            ),
          ),
        ),
      ],
    );
  }
}

