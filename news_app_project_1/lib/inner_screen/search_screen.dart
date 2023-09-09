import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_app_project_1/consts/enum_vars.dart';

import '../services/utils.dart';
import '../widgets/empty_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController searchController;
  late final FocusNode focusNode;

  @override
  void initState() {
    searchController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      searchController.dispose();
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        focusNode.unfocus();
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        IconlyLight.arrowLeft2,
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        controller: searchController,
                        focusNode: focusNode,
                        autofocus: true,
                        textInputAction: TextInputAction.search,
                        onEditingComplete: () {},
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 6),
                          hintText: 'Search',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffix: GestureDetector(
                            onTap: () {
                              searchController.clear();
                              // focusNode.unfocus();
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
               Expanded(
                    child: MasonryGridView.count(
                      itemCount: searchKeyWords.length,
                      crossAxisCount: 4,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 1,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  searchKeyWords[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 0.8,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              
                            ),
                          ),
                        );
                      },
                    ),
                    
                  ),
              
                const EmptyScreenWidget(
                  text: 'Ops!! No search result',
                  imagePath: 'assets/search.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
