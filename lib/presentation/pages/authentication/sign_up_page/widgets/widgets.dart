import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:road_map_project/presentation/helpers/presentation_helpers.dart';

import '../../../../../application/auth/sign_up/cubit/cubit.dart';
import '../../../../../application/auth/sign_up/cubit/states.dart';
import '../../../../../infrastructure/auth_with_google/sign_out_with_google.dart';
import '../../../../../infrastructure/auth_with_google/auth_with_google.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/fonts.dart';
import '../../../navigation_bar_home/navigation_bar_home.dart';
import '../../widgets/widgets.dart';

part 'signup_form_fields.dart';
part 'sign_up_header.dart';
part '../../../../../infrastructure/auth_with_google/google_bottom.dart';