part of 'widgets.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  onSubmit,
  onChange,
  onTap,
  validate,
  bool isPassword = false,
  required String label,
  IconData? suffix,
  IconData? prefix,
  suffixPressed,
  bool isClickable = true,
  bool isSearch = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      style: const TextStyle(color: ApplicationColor.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: ApplicationColor.white),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white54,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ApplicationColor.white,
          ),
        ),
        prefixIcon: prefix != null
            ? IconButton(
                icon: Icon(prefix),
                onPressed: () {},
                color: ApplicationColor.white,
              )
            : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
                color: ApplicationColor.white,
              )
            : null,
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required function,
  required text,
}) =>
    Container(
      width: width,
      height: 50.h,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
