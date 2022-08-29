class Post{
  String name;
  String email;
  String password;
  String id;
  Post({required this.name,required this.email,required this.password,required this.id});
  Post.fromJson(Map<String,dynamic>json):
        name=json['name'],
        id=json['id'],
        email=json['email'],
        password=json['password'];
  Map<String,dynamic> toJson()=>{
   'name':name,
    'id':id,
    'email':email,
    'password':password
  };
}