import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class MyInputForm extends StatefulWidget {
  const MyInputForm({super.key});

  @override
  State<MyInputForm> createState() => _MyInputFormState();
}

class _MyInputFormState extends State<MyInputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _myDataList = [];
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  Color? _selectedColor;
  // XFile? _selectedFile;
  Map<String, dynamic>? editedData;

  // final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextFormField('Name', _controllerNama, _validateNama),
              _buildTextFormField('Phone Number', _controllerPhone, _validatePhone),
              _buildDatePicker(),
              // _buildColorPicker(),
              // _buildFilePicker(),
              ElevatedButton(
                child: Text(editedData != null ? "Update" : "Submit"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _addData();
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'List Contact',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _myDataList.length,
                  itemBuilder: (context, index) {
                    final data = _myDataList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Text(
                              data['name']?[0]?.toUpperCase() ?? '',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name: ${data['name']}'),
                                Text('Phone: ${data['phone']}'),
                                Text('Date: ${data['date']}'),
                                Text('Color: ${data['color']}'),
                                // Image.file(
                                //   // data['file'] != null ? File(data['file'].path) : File(''),
                                //   height: 50,
                                //   width: 50,
                                // ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _editData(data);
                              });
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _deleteData(data);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerNama.dispose();
    _controllerPhone.dispose();
    _controllerDate.dispose();
    super.dispose();
  }

  Widget _buildTextFormField(
      String label, TextEditingController controller, String? Function(String?) validator) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: 'Enter $label',
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Color.fromARGB(255, 222, 254, 255),
          filled: true,
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _controllerDate,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            setState(() {
              _controllerDate.text = "${pickedDate.toLocal()}".split(' ')[0];
            });
          }
        },
        validator: (value) => value?.isEmpty ?? true ? 'Please pick a date' : null,
        decoration: InputDecoration(
          labelText: 'Date',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Color.fromARGB(255, 222, 254, 255),
          filled: true,
        ),
      ),
    );
  }

  
  // Widget _buildColorPicker() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: GestureDetector(
  //       onTap: () async {
  //         Color? pickedColor = await showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               title: const Text("Pick a Color"),
  //               content: SingleChildScrollView(
  //                 child: BlockPicker(
  //                   pickerColor: _selectedColor ?? Colors.blue,
  //                   onColorChanged: (Color color) {
  //                     setState(() {
  //                       _selectedColor = color;
  //                     });
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //       child: Container(
  //         width: double.infinity,
  //         padding: const EdgeInsets.symmetric(vertical: 16.0),
  //         decoration: BoxDecoration(
  //           color: _selectedColor ?? Colors.blue,
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         child: Center(
  //           child: Text(
  //             'Pick a Color',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildFilePicker() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: ElevatedButton(
  //       onPressed: () async {
  //         final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //         setState(() {
  //           _selectedFile = pickedFile;
  //         });
  //       },
  //       child: Text(_selectedFile == null ? 'Pick a File' : 'File Selected'),
  //     ),
  //   );
  // }

  String? _validateNama(String? value) {
    if (value!.length < 3) {
      return 'Please enter at least 3 characters';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value!.length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  void _addData() {
    final data = {
      'name': _controllerNama.text,
      'phone': _controllerPhone.text,
      'date': _controllerDate.text,
      'color': _selectedColor?.toString(),
      // 'file': _selectedFile,
    };
    setState(() {
      if (editedData != null) {
        editedData!['name'] = data['name'];
        editedData!['phone'] = data['phone'];
        editedData!['date'] = data['date'];
        editedData!['color'] = data['color'];
        editedData!['file'] = data['file'];
        editedData = null;
      } else {
        _myDataList.add(data);
      }
      _controllerNama.clear();
      _controllerPhone.clear();
      _controllerDate.clear();
      _selectedColor = null;
      // _selectedFile = null;
    });
  }

  void _editData(Map<String, dynamic> data) {
    setState(() {
      _controllerNama.text = data['name'];
      _controllerPhone.text = data['phone'];
      _controllerDate.text = data['date'];
      _selectedColor = data['color'] != null ? Color(int.parse(data['color'])) : null;
      // _selectedFile = data['file'];
      editedData = data;
    });
  }

  void _deleteData(Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Data'),
          content: const Text('Are you sure you want to delete this data?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _myDataList.remove(data);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
