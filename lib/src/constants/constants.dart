const String PASSWORD_REGEX_PATTERN =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[ -/:-@\[-`{-~}]).{8,}$';
const String NUMBER_AND_STRING = r'^(?=.*?\d)(?=.*?[a-zA-Z])[a-zA-Z\d]+$';
const String EMAIL_REGEX_PATTERN =
    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
