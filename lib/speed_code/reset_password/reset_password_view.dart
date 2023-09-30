import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:only_code/speed_code/reset_password/reset_password_mixin.dart';
import 'package:only_code/speed_code/reset_password/reset_password_validator.dart';
import 'package:only_code/speed_code/reset_password/visible_eye.dart';

part 'reset_password_widget.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView>
    with ResetPasswordMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom) +
                _PagePadding.symmetricHorizontalNormal,
        child: SafeArea(
          child: _SubmitButton(onSubmitPressed),
        ),
      ),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: _PageColors.blackColor),
        leading: const Icon(Icons.chevron_left_outlined),
      ),
      body: Padding(
        padding: _PagePadding.symmetricHorizontalNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _ResetPasswordResources.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: _PagePadding.symmetricVerticalNormal,
              child: Text(_ResetPasswordResources.subTitle),
            ),
            _NewPassword(controller),
          ],
        ),
      ),
    );
  }
}
