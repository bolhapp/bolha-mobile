import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';

class ImagemPickerComponent extends StatefulWidget {
  const ImagemPickerComponent(
    {
      super.key, 
      this.handleImageSelected, 
      this.image, 
      required this.getImagePlaceholder
    });

  final void Function(XFile)? handleImageSelected;
  final Widget Function(ImageProvider? img) getImagePlaceholder;
  final XFile? image;

  @override
  State<ImagemPickerComponent> createState() => ImagemPickerComponentState();
}

class ImagemPickerComponentState extends State<ImagemPickerComponent> {
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;
  String? _retrieveDataError;

  Widget Function(ImageProvider? img) get getImagePlaceholder =>
      widget.getImagePlaceholder;
  void Function(XFile)? get handleImageSelected => widget.handleImageSelected;
  XFile? get image => widget.image;

  Future<void> _onImageButtonPressed() async {
    if (context.mounted) {
      try {
        final List<XFile> pickedFileList = <XFile>[];
        final XFile? media = await _picker.pickMedia(
          maxWidth: 100,
          maxHeight: 100,
          imageQuality: 100,
        );

        if (media != null) {
          if (handleImageSelected != null) {
            handleImageSelected!(media);
          }

          pickedFileList.add(media);
        }
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Widget _handlePreview() {
    return _previewImages();
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (image != null) {
      return getImagePlaceholder(
        kIsWeb
            ? NetworkImage(
                image!.path,
              )
            : FileImage(
                File(image!.path),
              ) as ImageProvider,
      );
    } else if (_pickImageError != null) {
      return getImagePlaceholder(null);
    } else {
      return getImagePlaceholder(null);
    }
  }

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
  }

  void _setImageFileListFromFile(XFile? value) {
    if(value != null) {
      handleImageSelected!(value);
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _setImageFileListFromFile(response.file);
      });
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // open camera ?
          _onImageButtonPressed();
        },
        child: FutureBuilder<void>(
          future: retrieveLostData(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return getImagePlaceholder(null);
              case ConnectionState.done:
                return _handlePreview();
              case ConnectionState.active:
                if (snapshot.hasError) {
                  return getImagePlaceholder(null);
                } else {
                  return getImagePlaceholder(null);
                }
            }
          },
        ));
  }
}
