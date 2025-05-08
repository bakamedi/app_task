import 'package:flutter/material.dart';

import '../../domain/repositories/snackbar_repository.dart';

class SnackbarRepositoryImpl extends SnackbarRepository {
  late BuildContext _context;

  @override
  void showErrorSnackbar(String message) {
    // TODO: implement showErrorSnackbar
  }

  @override
  void showSnackbar(String message) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        duration: const Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  void showSuccessSnackbar(String message) {
    // TODO: implement showSuccessSnackbar
  }

  @override
  void setBuildContext(BuildContext context) {
    _context = context;
  }
}
