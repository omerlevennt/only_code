part of 'reset_password_view.dart';

final class _ResetPasswordResources {
  _ResetPasswordResources._();
  static const title = 'Reset your password';
  static const subTitle = 'Lets reset your password';
  static const submit = 'Submit';
  static const eMail = ' Email';
}

final class _PagePadding {
  _PagePadding._();
  static const EdgeInsets onlyLeftNormal = EdgeInsets.only(left: 16);
  static const EdgeInsets symmetricHorizontalNormal =
      EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets symmetricVerticalNormal =
      EdgeInsets.symmetric(vertical: 16.0);
}

final class _PageColors {
  _PageColors._();
  static const Color blackColor = Colors.black;
  static const Color deeoPurpleColor = Colors.deepPurple;
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton(this.onPressed);
  final VoidCallback onPressed;
  static const double _buttonHeight = 56;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonHeight,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: _PageColors.deeoPurpleColor),
          onPressed: () {},
          child: const Center(child: Text(_ResetPasswordResources.submit))),
    );
  }
}

class _NewPassword extends StatefulWidget {
  const _NewPassword(this.controller);
  final TextEditingController controller;
  @override
  State<_NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<_NewPassword> {
  bool _isSecured = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          ResetPasswordValidator(value).controlAndMessage();
          return null;
        },
        obscureText: !_isSecured,
        decoration: InputDecoration(
          suffixIcon: VisibleEye(
            onChanged: (value) {
              setState(() {
                _isSecured = value;
              });
            },
          ),
          labelText: _ResetPasswordResources.eMail,
          labelStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: _PageColors.blackColor),
          hoverColor: _PageColors.blackColor,
          contentPadding: _PagePadding.onlyLeftNormal,
          border: _inputBorder(),
          enabledBorder: _inputBorder(),
          focusedBorder: _inputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: Colors.black));
  }
}
