import 'dart:io';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'dart:typed_data';

class HospitalAdminForm extends StatefulWidget {
  const HospitalAdminForm({super.key});

  @override
  State<HospitalAdminForm> createState() => _HospitalAdminFormState();
}

class _HospitalAdminFormState extends State<HospitalAdminForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _patientDataList = [];

  // Controllers for form inputs
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerMedicalRecord = TextEditingController();
  final TextEditingController _controllerBirthDate = TextEditingController();
  final TextEditingController _controllerGender = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerDiagnosis = TextEditingController();

  Uint8List? _imageBytes; // Store patient's photo
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Administration Form'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Patient Name
                buildTextField(
                  controller: _controllerName,
                  label: 'Patient Name',
                  hint: 'Enter patient name...',
                  validator: _validateName,
                ),

                // Medical Record Number
                buildTextField(
                  controller: _controllerMedicalRecord,
                  label: 'Medical Record Number',
                  hint: 'Enter medical record number...',
                  validator: _validateMedicalRecord,
                ),

                // Birth Date
                buildDateField(
                  controller: _controllerBirthDate,
                  label: 'Birth Date',
                  hint: 'Select birth date...',
                  validator: _validateDate,
                ),

                // Gender
                buildDropdownField(
                  label: 'Gender',
                  value: _selectedGender,
                  items: const ['Male', 'Female'],
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) => value == null ? 'Please select gender' : null,
                ),

                // Address
                buildTextField(
                  controller: _controllerAddress,
                  label: 'Address',
                  hint: 'Enter address...',
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Address is required' : null,
                ),

                // Phone Number
                buildTextField(
                  controller: _controllerPhone,
                  label: 'Phone Number',
                  hint: 'Enter phone number...',
                  keyboardType: TextInputType.phone,
                  validator: _validatePhone,
                ),

                // Diagnosis
                buildTextField(
                  controller: _controllerDiagnosis,
                  label: 'Diagnosis',
                  hint: 'Enter diagnosis...',
                  validator: (value) => value == null || value.isEmpty
                      ? 'Diagnosis is required'
                      : null,
                ),

                // // Patient Photo
                // buildFilePicker(),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ),

                const SizedBox(height: 20),

                // Display Patient Data
                const Center(
                  child: Text(
                    'Patient List',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                buildPatientList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget buildDateField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            setState(() {
              controller.text =
                  "${pickedDate.toLocal()}".split(' ')[0];
            });
          }
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        validator: validator,
      ),
    );
  }

  Widget buildDropdownField({
    required String label,
    required List<String> items,
    required String? value,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }

  // Widget buildFilePicker() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text('Patient Photo'),
  //       const SizedBox(height: 10),
  //       Center(
  //         child: ElevatedButton(
  //           onPressed: _pickFile,
  //           child: const Text('Upload Photo'),
  //         ),
  //       ),
  //       if (_imageBytes != null)
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 10.0),
  //           child: Image.memory(
  //             _imageBytes!,
  //             height: 200,
  //             width: double.infinity,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //     ],
  //   );
  // }

  Widget buildPatientList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: _patientDataList.length,
        itemBuilder: (context, index) {
          final data = _patientDataList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                data['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Medical Record: ${data['medicalRecord']}'),
                  Text('Birth Date: ${data['birthDate']}'),
                  Text('Gender: ${data['gender']}'),
                  Text('Phone: ${data['phone']}'),
                  Text('Diagnosis: ${data['diagnosis']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Validation Methods
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? _validateMedicalRecord(String? value) {
    if (value == null || value.isEmpty) {
      return 'Medical record number is required';
    }
    return null;
  }

  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Birth date is required';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\d{8,13}\$').hasMatch(value)) {
      return 'Phone number must be 8-13 digits';
    }
    return null;
  }

  // // File Picker Method
  // void _pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(type: FileType.image);
  //   if (result != null) {
  //     setState(() {
  //       _imageBytes = result.files.first.bytes;
  //     });
  //   }
  // }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final data = {
        'name': _controllerName.text,
        'medicalRecord': _controllerMedicalRecord.text,
        'birthDate': _controllerBirthDate.text,
        'gender': _selectedGender,
        'address': _controllerAddress.text,
        'phone': _controllerPhone.text,
        'diagnosis': _controllerDiagnosis.text,
        'photo': _imageBytes,
      };
      setState(() {
        _patientDataList.add(data);
      });
      _clearForm();
    }
  }

  void _clearForm() {
    _controllerName.clear();
    _controllerMedicalRecord.clear();
    _controllerBirthDate.clear();
    _selectedGender = null;
    _controllerAddress.clear();
    _controllerPhone.clear();
    _controllerDiagnosis.clear();
    _imageBytes = null;
  }
}
