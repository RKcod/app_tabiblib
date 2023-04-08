import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/home/widgets/my_praticiens.dart';
import 'package:tabiblib/features/meeting/views/praticien_detail.dart';

class SearchPraticien extends HookConsumerWidget {
  const SearchPraticien({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchController = useTextEditingController(text: "");
    var searchText = useState("");
    useEffect(() {
      searchController.addListener(() {
        searchText.value = searchController.text;
      });

      return null;
    }, [
      searchController,
    ]);

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Rechercher",
        isLeading: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top: 84, bottom: 16),
                child: searchText.value.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            const PraticienDetail()));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 24),
                                    child: CircleAvatar(
                                      radius: 24,
                                      backgroundColor: Palette.primaryColor,
                                      backgroundImage: AssetImage(
                                          "assets/images/doctor.png"),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        "Dr Delphine Hottin",
                                        style: TextStyle(
                                            color: Palette.primaryColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Angiologue",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Angiologue",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemCount: 20)
                    : const MyPraticiens(
                        centerTitle: true,
                      )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: searchController,
              cursorColor: Palette.primaryColor,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Nom, spécialité, établissement...",
                  suffixIconConstraints: BoxConstraints(maxWidth: 16),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
