import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModalShowGeneralWidget {
  static void show(
    BuildContext context, {
    required Widget bodyIn,
    double heightModel = 0.80,
  }) {
    final heigh = MediaQuery.of(context).size.height;

    final FocusNode inputNode = FocusNode();
    showModalBottomSheet(
      backgroundColor: Theme.of(context).cardTheme.color,
      isDismissible: true,
      useSafeArea: true,
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      )),
      builder: (context) {
        inputNode.requestFocus();

        return Container(
          height: heigh * heightModel,
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100.0),
              topRight: Radius.circular(100.0),
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: bodyIn,
                  ),
                ),
                const _OptionCloseWidget(),
                const _OptionCloseWidget(
                  isIconClose: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _OptionCloseWidget extends StatelessWidget {
  const _OptionCloseWidget({
    this.isIconClose = true,
  });
  final bool isIconClose;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.0,
      right: isIconClose ? 10.0 : null,
      left: !isIconClose ? 10.0 : null,
      child: InkWell(
        onTap: () => Modular.to.pop(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              isIconClose ? Icons.close : Icons.arrow_back,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
