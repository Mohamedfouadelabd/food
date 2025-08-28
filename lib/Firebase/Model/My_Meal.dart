class MyMeal{
static  String collectionName='my_meal';
  String ?id;
  String ?title;
  String ?images;


MyMeal({required this.title,required this.images,required this.id});

MyMeal.fromFireStore(Map<String,dynamic>date){
  id=date['id'];
  title=date['titel'];
  images=date['images'];
}
Map<String,dynamic>toFireStore(){
  return{
    'id':id,
    'titel':title,
    'images':images

  };


}
}