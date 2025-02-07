import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rtu_mirea_app/domain/entities/update_info.dart';
import 'package:rtu_mirea_app/presentation/bloc/update_info_bloc/update_info_bloc.dart';
import 'package:rtu_mirea_app/presentation/theme.dart';
import 'package:rtu_mirea_app/presentation/typography.dart';
import 'package:rtu_mirea_app/presentation/widgets/buttons/primary_button.dart';

abstract class UpdateInfoDialog {
  static void checkAndShow(BuildContext context, UpdateInfoState state) {
    if (state is ShowUpdateDialog) {
      showDialog(
        context: context,
        builder: (context) => _UpdateInfo(
          data: state.data,
        ),
      );
      BlocProvider.of<UpdateInfoBloc>(context).add(
        DialogIsShown(
          versionToSave: state.data.appVersion,
        ),
      );
    }
  }
}

class _UpdateInfo extends StatelessWidget {
  final UpdateInfo data;

  const _UpdateInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(25.0),
      )),
      child: Material(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        )),
        child: Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: 24,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.5,
              color: AppTheme.colors.secondary,
            ),
            color: AppTheme.colors.background03,
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Вышла новая версия ${data.appVersion}',
                  style: AppTextStyle.captionS.copyWith(
                    color: AppTheme.colors.deactive,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.h5,
                ),
                if (data.description != null)
                  const Padding(padding: EdgeInsets.only(top: 24)),
                if (data.description != null)
                  Text(
                    data.description!,
                    style: AppTextStyle.bodyL,
                  ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 0,
                    minWidth: double.infinity,
                    maxHeight: 150,
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Text(
                        data.text,
                        style: AppTextStyle.body.copyWith(
                          color: AppTheme.colors.deactive,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                ),
                PrimaryButton(
                  text: 'Класс!',
                  onClick: () => Navigator.pop(context),
                  // backgroundColor: AppTheme.colors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
