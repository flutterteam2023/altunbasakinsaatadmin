import 'package:altunbasakinsaatadmin/features/BuildingAdd/ViewModel/building_add_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class VideoUploaderView extends StatefulWidget {
  @override
  _VideoUploaderViewState createState() => _VideoUploaderViewState();
}

class _VideoUploaderViewState extends State<VideoUploaderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: BuildAddViewManager().videoUrlList.value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.video_call), // Ön tarafta bir simge
                    title: Text(BuildAddViewManager()
                            .videoUrlList
                            .value[index]
                            .isNotEmpty
                        ? BuildAddViewManager().videoUrlList.value[index]
                        : "Video Url"), // Öğe başlığı
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Düzenleme butonuna tıklama işlemleri
                            _showEditDialog(context, index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Silme butonuna tıklama işlemleri
                            _showDeleteDialog(context, index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0, bottom: 85),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Bounceable(
                  onTap: () {
                    _showAddDialog(context);
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Color(0xffe31e24),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        BuildAddViewManager().screens[3].buttonText,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, int index) {
    String editedItem = BuildAddViewManager().videoUrlList.value[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Öğe Düzenle'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                editedItem = value;
              });
            },
            controller: TextEditingController(
                text: BuildAddViewManager().videoUrlList.value[index]),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Kaydet'),
              onPressed: () {
                setState(() {
                  if (editedItem.isNotEmpty) {
                    BuildAddViewManager().videoUrlList.value[index] =
                        editedItem;
                    Navigator.of(context).pop();
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Öğe Sil'),
          content: Text('Bu öğeyi silmek istediğinizden emin misiniz?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Sil'),
              onPressed: () {
                setState(() {
                  BuildAddViewManager().videoUrlList.value.removeAt(index);
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddDialog(BuildContext context) {
    String newItem = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Yeni Öğe Ekle'),
          content: TextField(
            onChanged: (value) {
              newItem = value;
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Ekle'),
              onPressed: () {
                setState(() {
                  if (newItem.isNotEmpty) {
                    BuildAddViewManager().videoUrlList.value.add(newItem);
                    Navigator.of(context).pop();
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }
}
