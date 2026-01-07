class RegisterStates{
  final String userName;
  final String email;
  final String password;
  final String rePassword;
  const RegisterStates({required this.userName,required this.email,required this.password,required this.rePassword}); //{} makes parameters optional -optional named parameter-
  //with final and const, class becomes immutable. 
  RegisterStates copyWith(
  {
    String? userName, String? email, String? password, String? rePassword 
  }){
    return RegisterStates(userName:userName??this.userName, email:email??this.email, password:password??this.password, rePassword:rePassword??this.rePassword); 
  }
}