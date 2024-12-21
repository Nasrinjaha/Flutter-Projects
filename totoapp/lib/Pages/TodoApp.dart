import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List Item = ["Item01","Item02"];
  TextEditingController titleTex = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller:titleTex,
          decoration: InputDecoration(hintText: "Add a Item"),
        ),
        actions: [
          ElevatedButton(onPressed: (){

         if(titleTex.text.isNotEmpty){
           setState(() {
             Item.add(titleTex.text);
          });
         }
          titleTex.clear();
          
          }, child: Text("Add Item"))
        ],
      ),
      body: ListView.builder(
        itemCount: Item.length,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(bottom: 2.0),
            child: ListTile(
              title: Text(Item[index],style: TextStyle(color:Colors.white),),
              tileColor: const Color.fromARGB(255, 28, 6, 90),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      Item.removeAt(index);

                    });
                  }, icon: Icon(Icons.delete,color: Colors.white,),),
                  IconButton(onPressed: (){
                    _showEdit(context,index);
                  }, icon: Icon(Icons.edit,color: Colors.white,),)
                ],
              ),
            
            ),
          );
        }),
    );
  }

  void _showEdit(BuildContext context,int index){
    TextEditingController editData = TextEditingController(text: Item[index]);
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Edit Data",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
        content: TextField(
          controller: editData,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: "At least one item have to be added"),
        ),
        actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child:Text("Cancel") ),
            ElevatedButton(onPressed: (){
              if(editData.text.isNotEmpty){
                setState(() {
                Item[index] = editData.text;
              });
              }
              Navigator.pop(context);
            }, child: Text("Save",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.green),)
        ],
      );
    });
  }
}