const String passwordRegexPattern =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[ -/:-@\[-`{-~}]).{8,}$';
const String nameAndStringRegexPattern =
    r'^(?=.*?\d)(?=.*?[a-zA-Z])[a-zA-Z\d]+$';
const String emailRegexPattern =
    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
