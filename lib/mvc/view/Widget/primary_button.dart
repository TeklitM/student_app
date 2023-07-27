part of mvc;

typedef ButtonCallback = Future Function();

class PrimaryButton extends StatelessWidget {
  final String text;
  final double minWidth;
  final double borderRadius;
  final ButtonCallback onPressed;
  final bool checkConnectivity;
  final bool showLoading;
  final String? loadingMessage;
  final BuildContext? context;
  const PrimaryButton(
      {Key? key,
      required this.text,
      this.minWidth = double.infinity,
      this.borderRadius = 50,
      required this.onPressed,
      this.checkConnectivity = true,
      this.showLoading = true,
      this.loadingMessage,
      this.context})
      : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        // if (checkConnectivity) {
        //   if (Internet.isConnected()) {
        //     await callOnPressed();
        //   } else {
        //     Message.noConnectionMessage();
        //   }
        // } else {
        await callOnPressed();
        // }
      },
      elevation: 1,
      height: 55,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      color: Keys.primaryColor,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  callOnPressed() async {
    if (context != null) {
      FocusManager.instance.primaryFocus?.unfocus();
      await Future.delayed(const Duration(milliseconds: 700));
    }

    if (showLoading) {
      EasyLoading.show(status: loadingMessage ?? "Please wait");
      await onPressed.call();
      EasyLoading.dismiss();
    } else {
      await onPressed.call();
    }
  }
}
