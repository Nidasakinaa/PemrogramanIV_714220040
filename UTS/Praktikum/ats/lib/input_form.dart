import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:open_file/open_file.dart';

class MyInputForm extends StatefulWidget {
  const MyInputForm({super.key});

  @override
  State<MyInputForm> createState() => _MyInputFormState();
}

class _MyInputFormState extends State<MyInputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _myDataList = [];
  final TextEditingController _controllerNama = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();

  Color _currentColor = Colors.blue; // Default color
  Map<String, dynamic>? editedData;
  File? _imageFile;
  String? _dataFile;

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
              // Input Nama
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controllerNama,
                  validator: _validateNama,
                  decoration: const InputDecoration(
                    hintText: 'Write your name here...',
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    fillColor: Color.fromARGB(255, 222, 254, 255),
                    filled: true,
                  ),
                ),
              ),

              // Input Phone Number
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controllerPhone,
                  keyboardType: TextInputType.phone,
                  validator: _validatePhone,
                  decoration: const InputDecoration(
                    hintText: 'Enter your phone number...',
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    fillColor: Color.fromARGB(255, 255, 240, 220),
                    filled: true,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controllerDate,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      String formattedDate = "${pickedDate.toLocal()}".split(' ')[0];
                      setState(() {
                        _controllerDate.text = formattedDate;
                      });
                    }
                  },
                  validator: _validateDate, // Use the validation method here
                  decoration: const InputDecoration(
                    hintText: 'Select your date...',
                    labelText: 'Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    fillColor: Color.fromARGB(255, 240, 255, 220),
                    filled: true,
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                  ),
                ),
              ),

              // Color Picker
              buildColorPicker(context),

              // File Picker
              buildFilePicker(context),

              // Submit Button
              ElevatedButton(
                child: Text(editedData != null ? "Update" : "Submit"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addData();
                  }
                },
              ),

              // Display List Data
              const SizedBox(height: 20),
              const Text(
                'List Contact',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _myDataList.length,
                  itemBuilder: (context, index) {
                    final data = _myDataList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text(
                            data['name']?[0]?.toUpperCase() ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(data['name'] ?? ''),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone: ${data['phone']}'),
                            Text('Date: ${data['date']}'),
                            Row(
                              children: [
                                const Text('Color: '),
                                Container(
                                  width: 20,
                                  height: 20,
                                  color: data['color'],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('File: '),
                                if (data['filePreview'] != null)
                                  Image.file(
                                    data['filePreview']!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                else
                                  const Icon(Icons.insert_drive_file,
                                      color: Colors.grey),
                              ],
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _editData(data);
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                _deleteData(data);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
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

  // Color Picker Widget
  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _currentColor,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pick your color'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColorPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Pick Color'),
          ),
        )
      ],
    );
  }

  // File Picker Widget
  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        const Text('Pick File'),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: const Text('Pick and Open File'),
          ),
        ),
        if (_dataFile != null) Text('File: $_dataFile'),
        const SizedBox(height: 10),
        if (_imageFile != null)
          Image.file(
            _imageFile!,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
      ],
    );
  }

  // Validation Methods
  String? _validateNama(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama harus diisi';
    }

    // Cek apakah terdiri dari minimal 2 kata
    List<String> words = value.trim().split(' ');
    if (words.length < 2) {
      return 'Nama harus terdiri dari minimal 2 kata';
    }

    // Cek apakah setiap kata dimulai dengan huruf kapital dan tidak mengandung angka/karakter khusus
    for (String word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z]*$').hasMatch(word)) {
        return 'Setiap kata harus dimulai dengan huruf kapital dan tidak mengandung angka atau karakter khusus';
      }
    }

    return null;
  }

//validation phone
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon harus diisi';
    }

    // Cek apakah hanya terdiri dari angka
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Nomor telepon harus terdiri dari angka saja';
    }

    // Cek panjang nomor telepon
    if (value.length < 8 || value.length > 13) {
      return 'Nomor telepon harus memiliki panjang antara 8 hingga 13 digit';
    }

    // Cek apakah dimulai dengan "62"
    if (!value.startsWith('62')) {
      return 'Nomor telepon harus dimulai dengan angka 62';
    }

    return null;
  }

  // Validation Method for Date
  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tanggal harus diisi';
    }
    return null;
  }

  // File Picker Method
  void _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null) {
        final file = result.files.first;

        if (file.extension == 'jpg' ||
            file.extension == 'jpeg' ||
            file.extension == 'png') {
          setState(() {
            _imageFile = File(file.path!);
            _dataFile = file.name;
          });
        } else {
          setState(() {
            _imageFile = null;
            _dataFile = file.name; // File bukan gambar
          });
        }

        _openFile(file);
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
    }
  }

  // Open File Method
  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  

  // Add Data
  void _addData() {
    final data = {
      'name': _controllerNama.text,
      'phone': _controllerPhone.text,
      'date': _controllerDate.text,
      'color': _currentColor,
      'file': _dataFile,
      'filePreview': _imageFile,
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
    });
    _clearForm();
  }

  // Clear Form
  void _clearForm() {
    _controllerNama.clear();
    _controllerPhone.clear();
    _controllerDate.clear();
    _currentColor = Colors.blue;
    _imageFile = null;
    _dataFile = null;
  }

  // Edit Data
  void _editData(Map<String, dynamic> data) {
    setState(() {
      editedData = data;
      _controllerNama.text = data['name'];
      _controllerPhone.text = data['phone'];
      _controllerDate.text = data['date'];
      _currentColor = Color(int.parse(data['color'].split('(0x')[1].split(')')[0],
          radix: 16));
      _dataFile = data['file'];
    });
  }

  // Delete Data
  void _deleteData(Map<String, dynamic> data) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Data'),
        content: const Text('Apakah Anda yakin ingin menghapus data ini?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _myDataList.remove(data);
              });
              Navigator.of(context).pop();
            },
            child: const Text('Hapus'),
          ),
        ],
      );
    },
  );
}
}
