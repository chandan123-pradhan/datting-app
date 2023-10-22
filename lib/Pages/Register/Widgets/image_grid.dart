// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// class ImageGrid extends StatefulWidget {
//   @override
//   _ImageGridState createState() => _ImageGridState();
// }
//
// class _ImageGridState extends State<ImageGrid> {
//   List<String> _imagePaths = [];
//
//   Future<void> _getImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: source);
//
//     if (pickedFile != null) {
//       setState(() {
//         _imagePaths.add(pickedFile.path);
//       });
//     }
//   }
//
//   void _deleteImage(int index) {
//     setState(() {
//       _imagePaths.removeAt(index);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Grid'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//               ),
//               itemCount: _imagePaths.length,
//               itemBuilder: (context, index) {
//                 return Stack(
//                   children: [
//                     Image.file(
//                       File(_imagePaths[index]),
//                       fit: BoxFit.cover,
//                     ),
//                     Positioned(
//                       top: 0,
//                       right: 0,
//                       child: IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () => _deleteImage(index),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           RaisedButton(
//             onPressed: () => _getImage(ImageSource.gallery),
//             child: Text('Pick from Gallery'),
//           ),
//           RaisedButton(
//             onPressed: () => _getImage(ImageSource.camera),
//             child: Text('Take a Photo'),
//           ),
//         ],
//       ),
//     );
//   }
// }
