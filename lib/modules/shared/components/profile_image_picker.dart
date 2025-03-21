import 'package:bolha/modules/shared/components/profile_image_slot.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({super.key, this.handleImageSelected});

  final void Function(XFile)? handleImageSelected;

  @override
  State<ProfileImagePicker> createState() => ProfileImagePickerState();
}

class ProfileImagePickerState extends State<ProfileImagePicker> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _mediaFileList;
  dynamic _pickImageError;
  String? _retrieveDataError;

  void Function(XFile)? get handleImageSelected => widget.handleImageSelected;

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
          setState(() {
            _mediaFileList = pickedFileList;
          });
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
    if (_mediaFileList != null) {
      return ProfileImageSlot(
        image: kIsWeb
            ? NetworkImage(
                _mediaFileList![0].path,
              )
            : FileImage(
                File(_mediaFileList![0].path),
              ) as ImageProvider,
      );
    } else if (_pickImageError != null) {
      return const ProfileImageSlot();
    } else {
      return const ProfileImageSlot();
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
    _mediaFileList = value == null ? null : <XFile>[value];
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        if (response.files == null) {
          _setImageFileListFromFile(response.file);
        } else {
          _mediaFileList = response.files;
        }
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
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  FutureBuilder<void>(
                    future: retrieveLostData(),
                    builder:
                        (BuildContext context, AsyncSnapshot<void> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return const ProfileImageSlot();
                        case ConnectionState.done:
                          return _handlePreview();
                        case ConnectionState.active:
                          if (snapshot.hasError) {
                            return const ProfileImageSlot();
                          } else {
                            return const ProfileImageSlot();
                          }
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Icon(
                          size: 20,
                          color: Theme.of(context).colorScheme.onPrimary,
                          Icons.camera_alt_outlined),
                    ),
                  )
                ],
              )),
        ));
  }
}
