import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/news/cubit/news_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit(),
        child: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.sacffoldBG,
              title: Text(
                'Find Your News',
                style: TextStyle(color: AppColors.lomanda),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          context.read<NewsCubit>().getSearch(value);
                        });
                      },
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
                    BlocBuilder<NewsCubit, NewsState>(
                      builder: (context, state) {
                        if (state is SearchSuccessState) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var data = state.model.articles![index];
                                    return GestureDetector(
                                      onTap: () async {
                                        if (await canLaunchUrl(
                                            Uri.parse(data.url!))) {
                                          await launchUrl(Uri.parse(data.url!));
                                        } else {
                                          throw 'Could not launch';
                                        }
                                      },
                                      child: Container(
                                        height: 110,
                                        decoration: BoxDecoration(
                                            color: AppColors.containerBG,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                data.urlToImage ?? "",
                                                width: 160,
                                                height: 100,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return const SizedBox(
                                                      width: 160,
                                                      height: 100,
                                                      child: Icon(
                                                        Icons.error,
                                                      ));
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    data.title ?? "",
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: AppColors.white),
                                                  ),
                                                  Text(
                                                    data.author ?? "",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: AppColors.grey),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                          'assets/read.png'),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Read',
                                                        style: TextStyle(
                                                            color:
                                                                AppColors.white,
                                                            fontSize: 13),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: state.model.articles!.length),
                            ),
                          );
                        } else if (state is SearchErrorState) {
                          return Text(state.error);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                                color: AppColors.lomanda),
                          );
                        }
                      },
                    ),
                  ]),
            ),
          );
        }));
  }
}
