import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:road_map_project/presentation/helpers/presentation_helpers.dart';
import 'package:road_map_project/presentation/pages/authentication/reset_password/reset_password.dart';
import 'package:road_map_project/presentation/theme/fonts.dart';


import '../../../../../application/auth/login/cubit/cubit.dart';
import '../../../../../application/auth/login/cubit/states.dart';
import '../../../../../infrastructure/auth_with_google/auth_with_google.dart';
import '../../../../../infrastructure/local/manager.dart';
import '../../../../theme/colors.dart';
import '../../../navigation_bar_home/navigation_bar_home.dart';
import '../../sign_up_page/widgets/widgets.dart';
import '../../widgets/widgets.dart';

part '../login_page_body.dart';
part 'login_form_fields.dart';
part 'login_header.dart';
