import 'package:altunbasakinsaatadmin/features/BuildingAdd/ViewModel/building_add_manager.dart';
import 'package:altunbasakinsaatadmin/features/BuildingAdd/list_pageView.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class BuildingAddView extends StatefulWidget {
  const BuildingAddView({super.key});

  @override
  State<BuildingAddView> createState() => _BuildingAddViewState();
}

class _BuildingAddViewState extends State<BuildingAddView> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    BuildAddViewManager().inPhotos.value.clear();
    BuildAddViewManager().aciklama =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().aidat =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().banyoSayisi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().binaninYasi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().bulunduguKat =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().cepheSecenekleri =
        ValueNotifier<TextEditingController>(TextEditingController());

    BuildAddViewManager().ilanBasligi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().ilanFiyat =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().ilanNo =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().ilanTarihi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().ilanTarihi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().ilanTipi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().isinmaTipi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().kat =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().kiraGetirisi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().kat =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().kiraGetirisi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().konutSekli =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().krediyeUygunluk =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().kullanimDurumu =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().metreKare =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().odaSayisi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().siteIcerisinde =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().takas =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().yakitTipi =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().yapininDurumu =
        ValueNotifier<TextEditingController>(TextEditingController());
    BuildAddViewManager().yapitipi =
        ValueNotifier<TextEditingController>(TextEditingController());

    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe31e24),
        iconTheme: IconThemeData(color: Colors.black, size: 32),
        centerTitle: true,
        title: Text(
          "İlan Oluştur",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: BuildAddViewManager().screens.length,
            itemBuilder: (BuildContext context, int index) {
              return screen[index];
            },
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 55),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PageViewDotIndicator(
                currentItem: currentIndex,
                count: BuildAddViewManager().screens.length,
                unselectedColor: Colors.black26,
                selectedColor: Color(0xffe31e24),
              ),
            ),
          )
        ],
      ),
    );
  }
}
