import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/colors.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.sacffoldBG,
        title: Text(
          'Find Your News',
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            style: const TextStyle(height: 0.2),
            decoration: InputDecoration(
              // contentPadding: const EdgeInsets.all(10),
              hintText: "Search For News",
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
              ),
              fillColor: Colors.grey,
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.grey)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Top Results : ',
            style: TextStyle(color: AppColors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: AppColors.containerBG,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/user.jpg',
                            width: 160,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Man City stay perfect despitedsk Rodri red against Forest',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: AppColors.white),
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/read.png'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Read',
                                    style: TextStyle(color: AppColors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 5),
          ),
        ]),
      ),
    );
  }
}
