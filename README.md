import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smartbazar/common/appbar_widget.dart';
import 'package:smartbazar/constant/color_constant.dart';
import 'package:smartbazar/constant/image_constant.dart';
import 'package:smartbazar/features/add_to_cart/view/adde_to_card_screeen.dart';
import 'package:smartbazar/features/brand_bazar/brand_bazar_screen.dart';
import 'package:smartbazar/features/bussiness_tab_screen/view/business_tab_screen.dart';
import 'package:smartbazar/features/create_listing/view/create_new_listing_screen.dart';
import 'package:smartbazar/features/feed_page/widget/not_a_story_widget.dart';
import 'package:smartbazar/features/feed_page/widget/story_add_widget.dart';
import 'package:smartbazar/features/home/api/get_story_provider.dart';
import 'package:smartbazar/features/home/api/home_posts_proivider.dart';
import 'package:smartbazar/features/home/api/sponsored_provider.dart';
import 'package:smartbazar/features/home/api/buy_or_now_provider.dart';
import 'package:smartbazar/features/home/api/home_slider_provider.dart';
import 'package:smartbazar/features/home/api/search_product.dart';
import 'package:smartbazar/features/home/api/shopzone_provider.dart';
import 'package:smartbazar/features/home/model/home_posts_model.dart';
import 'package:smartbazar/features/home/model/product_model.dart';
import 'package:smartbazar/features/home/view/buyorwin_widget.dart';
import 'package:smartbazar/features/home/view/header.dart';
import 'package:smartbazar/features/my_order/view/my_order_screen.dart';
import 'package:smartbazar/features/pending_approval/pending_approval.dart';
import 'package:smartbazar/features/product_details/constant/all_product_detail_widget.dart';
import 'package:smartbazar/features/product_details/constant/product_detail_widget.dart';
import 'package:smartbazar/features/product_details/product_deatials_screen.dart';
import 'package:smartbazar/features/scratch_win/screen/subscribe_win_every_day_screen.dart';
import 'package:smartbazar/features/vendor/vendor_profile/view/vendor_profile_screen.dart';
import 'package:smartbazar/features/vendor/view/my_subscribe_and_win_page.dart';
import 'package:smartbazar/features/widgets/product_card.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smartbazar/features/b2b_screen/view/b2b_screen.dart';
import 'package:smartbazar/features/events_screen/view/events_screen.dart';
import 'package:smartbazar/features/grocessary_screen/view/grocary_screen.dart';
import 'package:smartbazar/features/jobs_screen/view/jobs_screen.dart';
import 'package:smartbazar/features/services_screen/service_screen.dart';
import 'package:smartbazar/features/socio_screen/view/socio_screen.dart';
import 'package:smartbazar/features/used_screen/view/used_screen.dart';

import '../../../general_widget/story_search_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _isPopupVisible = false;
  int currentPageIndex = 0;
  int selectedIndex = 0; // State variable for selected index
  final ValueNotifier<bool> _showSideBar = ValueNotifier<bool>(true);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController _searchController = TextEditingController();
  final _debouncer = BehaviorSubject<String>();
  bool _showSearchProductModels = false;
  late TabController dynamictabController;
  final ScrollController _scrollController = ScrollController();
  bool _isSectionsVisible = true;
  double _lastScrollOffset = 1;
  Offset _initialDragPosition = Offset.zero; // Track initial drag position
  PageController _pageController = PageController(viewportFraction: 0.3);
  final double _currentHeight = 500; // Default height for first tab

  final List<Map<String, dynamic>> _items = [
    {
      'icon': 'assets/icon/b2bIcon.svg',
      'label': 'TradeHub',
      'screen': const B2bScreen()
    },
    {
      'icon': 'assets/icon/loading.svg',
      'label': 'Everything',
      'screen': const HomeScreen()
    },
    {
      'icon': 'assets/icon/brandBazarIcon.svg',
      'label': 'Brandbazaar',
      'screen': const BrandBazarScreen()
    },
    {
      'icon': 'assets/icon/usedIcon.svg',
      'label': 'Used',
      'screen': const UsedScreen()
    },
    {
      'icon': 'assets/icon/openCartIcon.svg',
      'label': 'SocioShop',
      'screen': const SocioShopScreen()
    },
    {
      'icon': 'assets/icon/box.svg',
      'label': 'ServiceHub',
      'screen': const ServicesScreen()
    },
    {
      'icon': 'assets/icon/vectors.svg',
      'label': 'Job',
      'screen': const JobssScreen()
    },
    {
      'icon': 'assets/icon/groceryIcon.svg',
      'label': 'Grocery',
      'screen': const GrocarysScreen()
    },
    {
      'icon': 'assets/icon/eventIcon.svg',
      'label': 'Events',
      'screen': const EventsScreen()
    },
  ];

  @override
  void initState() {
    super.initState();
    dynamictabController = TabController(length: 3, vsync: this);
    // fetchStoryHome().then(
    //   (value) {
    //     print("lala");
    //   },
    // );
    // Default selected index to 3 (HomeScreen)
    // selectedIndex = 3;
    dynamictabController.addListener(() {
      setState(() {});
    });

    // Initialize the PageController with the selected page
    _pageController = PageController(
      viewportFraction: 0.3,
      initialPage: selectedIndex,
    );
    _searchController.addListener(() {
      _debouncer.add(_searchController.text);
    });
    _debouncer.debounceTime(const Duration(milliseconds: 300)).listen((query) {
      debugPrint("Search query: $query");
      ref.refresh(searchProvider(query));
      setState(() {
        _showSearchProductModels = query.isNotEmpty;
      });
    });
    // Use the addPostFrameCallback to jump to the selected page after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(selectedIndex);
    });

    // Set up debounce for search functionality
    _searchController.addListener(() {
      _debouncer.add(_searchController.text);
    });

    _debouncer.debounceTime(const Duration(milliseconds: 100)).listen((query) {
      debugPrint("Search query: $query");
      ref.refresh(searchProvider(query));
      setState(() {
        _showSearchProductModels = query.isNotEmpty;
      });
    });

    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final scrollOffset = _scrollController.offset;

    if (scrollOffset > _lastScrollOffset && scrollOffset > 100) {
      setState(() {
        _isSectionsVisible = false;
      });
    } else if (scrollOffset < _lastScrollOffset && scrollOffset < 50) {
      setState(() {
        _isSectionsVisible = true;
      });
    }

    _lastScrollOffset = scrollOffset;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final dragDistance = details.globalPosition.dy - _initialDragPosition.dy;
    if (dragDistance > 50 && !_isSectionsVisible) {
      setState(() {
        _isSectionsVisible = true;
      });
    } else if (dragDistance < -50 && _isSectionsVisible) {
      setState(() {
        _isSectionsVisible = false;
      });
    }
  }

  void _onDragStart(DragStartDetails details) {
    _initialDragPosition = details.globalPosition;
  }

  void _onSearchFocusChanged(bool hasFocus) {
    setState(() {
      _showSearchProductModels = hasFocus;
    });
  }

  final List<String> _images = ['assets/images/home.png'];
  final List<Map<String, dynamic>> _services = [
    {'label': 'SHOPZONE', 'id': 1},
    {'label': 'TRADEHUB', 'id': 2},
    {'label': 'SERVICES', 'id': 3},
    {'label': 'USED', 'id': 4},
    {'label': 'JOB', 'id': 5},
    {'label': 'Event', 'id': 6},
    {'label': 'Grocery', 'id': 7},
  ];
  int _currentIndex = 0;

  @override
  void dispose() {
    dynamictabController.dispose();
    _debouncer.close();
    _searchController.dispose();
    super.dispose();
    _scrollController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories =
        _services.map((e) => e['label'] as String).toList();
    final randomstory = ref.watch(fetchStoryHomeProvider);
    // final adsList = ref.watch(fetchAdsProvider);
    // double _mediaheight = MediaQuery.of(context).size.height;
    // final AsyncValue<HomePosts> homePostsData = ref.watch(homePostsProvider);
    final sliders = ref.watch(fetchAdvertisementsProvider);
    final category = ref.watch(homeCategoryProvider);
    // ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);
    final buyorwin = ref.watch(fetchBuyAndHotProvider);
    final getSponsored = ref.watch(fetchSponsoredProvider);
    final AsyncValue<HomePosts> homePostsData = ref.watch(homePostsProvider);
    int currentPageIndex = 0;

    // category.when(
    //   data: (data) {
    //     print("bibash ${data.jobs.first.id}");
    //   },
    //   error: (error, stackTrace) {},
    //   loading: () {},
    // );

    // ads.when(
    //   data: (data) {
    //     print("ram $data");
    //   },
    //   error: (error, stackTrace) {},
    //   loading: () {},
    // );
    // ref.watch(fetchAdvertisementsProvider);
    // print(homePostsData.when(
    //   data: (data) {
    //     print("data is $data");
    //   },
    //   error: (error, stackTrace) {},
    //   loading: () {},
    // ));
    // final brandbajarAsyncValue = ref.watch(getBrandBazaarResponseProvider);

    final SearchProductModels =
        ref.watch(searchProvider(_searchController.text));
    debugPrint('Search Results: ${SearchProductModels.asData?.value}');

    return Scaffold(
        extendBody: true,
        key: _key,
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteColor,
        // drawer: const CustomDrawer(),
        body: Stack(children: [
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 170,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF392574),
                              Color(0xFF681b4e),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const VendorProfileScreen(),
                                        ));
                                  },
                                  child:
                                      Image.asset('assets/images/group.png')),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                  height: 40,
                                  child: NewSearchWidget(
                                    onSearchFocusChanged: _onSearchFocusChanged,
                                    searchController: _searchController,
                                    ontapped: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BusinessTabScreen(
                                              query: _searchController.text,
                                            ),
                                          ));
                                    },
                                    onchnage: (p0) {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           const BusinessTabScreen(),
                                      //     ));
                                    },
                                  )),
                            ],
                          ),
                          if (_showSearchProductModels)
                            Positioned(
                              top: 0.h, // Position just below the search bar
                              left: 0,
                              right: 0,
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                child:
                                    SearchProductModels.when(data: (results) {
                                  if (results.isEmpty) {
                                    return const SizedBox(
                                      child: Text('No result found'),
                                    ); // No results
                                  }
                                  return Card(
                                    elevation: 8,
                                    child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: results.length,
                                      itemBuilder: (context, index) {
                                        final product = results[index];
                                        return ListTile(
                                          title: Text(product.title),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BusinessTabScreen(
                                                    query:
                                                        _searchController.text,
                                                  ),
                                                ));

                                            setState(() {
                                              _showSearchProductModels = false;

                                              FocusScope.of(context).unfocus();
                                            });
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         ProductDetailsScreen(
                                            //       productId: product.id,
                                            //     ),
                                            //   ),
                                            // );
                                          },
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                    ),
                                  );
                                }, loading: () {
                                  return null;

                                  // return SizedBox(
                                  //     width: 10.w,
                                  //     height: 10.h,
                                  //     child: CircularProgressIndicator());
                                }, error: (error, stack) {
                                  return null;

                                  // return SizedBox(
                                  //     width: 10.w,
                                  //     height: 10.h,
                                  //     child: CircularProgressIndicator());
                                }),
                              ),
                            ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  _pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 50),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Container(
                                  height: 5.h,
                                  width: 5.w,
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == index
                                        ? Colors.amber
                                        : Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(
                            height: 80.h,
                            child: PageView.builder(
                              itemCount: _items.length,
                              padEnds: false,
                              controller: _pageController,
                              onPageChanged: (value) {
                                setState(() {
                                  selectedIndex =
                                      value; // Update selectedIndex based on page change
                                });
                              },
                              itemBuilder: (context, index) {
                                Map<String, dynamic> data = _items[index];

                                // Highlight only when index == 4
                                bool isActive = index == 1;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                    _pageController.animateToPage(
                                      2,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: AnimatedContainer(
                                    padding: EdgeInsets.zero,
                                    duration: const Duration(milliseconds: 300),
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  data['screen']),
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (data['icon']
                                              .toString()
                                              .endsWith('.svg'))
                                            SvgPicture.asset(
                                              data['icon'],
                                              alignment: Alignment.center,
                                              fit: BoxFit.contain,
                                              theme: const SvgTheme(
                                                  currentColor:
                                                      Color(0xffdd9d9d9)),
                                              color: isActive
                                                  ? Colors.amber
                                                  : const Color(0xffD9D9D9)
                                                      .withOpacity(0.5),
                                              width: 20,
                                              height: 20,
                                            )
                                          else
                                            Image.asset(
                                              data['icon'],
                                              color: isActive
                                                  ? Colors.amber
                                                  : const Color(0xffD9D9D9)
                                                      .withOpacity(0.5),
                                              width: 20,
                                              height: 20,
                                            ),
                                          const SizedBox(height: 8),
                                          Text(
                                            data['label'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: isActive
                                                  ? Colors.amber
                                                  : const Color(0xffD9D9D9)
                                                      .withOpacity(0.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: const Divider(
                              thickness: 0.4,
                              height: 1,
                              color: ColorConstant.grayColor,
                            ),
                          ),

                          if (_isSectionsVisible)
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BrandBazarScreen(),
                                          ));
                                    },
                                    child: const Text(
                                      "Brandbazaar",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFD9D9D9),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MySubscribeAndWinPage(),
                                          ));
                                    },
                                    child: const Text(
                                      "BuyOrWin",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFD9D9D9),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onVerticalDragUpdate: _onDragUpdate,
                      onVerticalDragStart: _onDragStart,
                      onTap: () {
                        setState(() {
                          _isSectionsVisible = !_isSectionsVisible;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Container(
                            alignment: AlignmentDirectional.centerStart,
                            margin: EdgeInsets.only(top: 5.h),
                            height: 7.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFF681b4e),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    if (_isPopupVisible)
                      Center(
                        child: StorySearchBar(
                          onClose: () {
                            setState(() {
                              _isPopupVisible = false; // Close the popup
                            });
                          },
                        ),
                      ),
                    randomstory.when(
                      data: (data) {
                        return SizedBox(
                          height: 130.h,
                          child: SingleChildScrollView(
                            // Wrapping the Row with SingleChildScrollView
                            scrollDirection: Axis
                                .horizontal, // Ensuring it scrolls horizontally
                            child: Row(
                              children: [
                                // First StoryAddWidget with search option
                                StoryAddWidget(
                                  vImage:
                                      data.data!.feedStory?.posts.first.image,
                                  brandname: data
                                      .data!.feedStory?.posts.first.vendorName,
                                  index: 0,
                                  addSearch: true, // First item has search
                                  showgift: false,
                                  onTap: () {
                                    setState(() {
                                      // _isPopupVisible = true; // Open the popup
                                    });
                                  },
                                ),
                                // Expanded is not needed since SingleChildScrollView will handle scrolling
                                // Now ListView.builder will be added directly to the row
                                ...data.data!.feedStory!.posts.map((storyData) {
                                  return StoryAddWidget(
                                    brandname: storyData.vendorName,
                                    vImage: storyData.vendorImage,
                                    index: data.data!.feedStory!.posts
                                        .indexOf(storyData),
                                    addSearch:
                                        false, // For all items other than the first, no search
                                    showgift: storyData.hasSponsoredGifts,
                                    onTap: () {
                                      // setState(() {
                                      //   // _isPopupVisible = true; // Open the popup
                                      // });
                                    },
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        );
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => const CircularProgressIndicator(),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
                      child: Column(
                        children: [
                          // existing slider for pageview

                          // sliders.when(
                          //   data: (data) {
                          //     // print("binod ${data[0].image}");
                          //
                          //     return SizedBox(
                          //       height: 60.h,
                          //       width: double.infinity,
                          //       child: PageView.builder(
                          //         allowImplicitScrolling: true,
                          //         itemCount: data.advertisements.length,
                          //         scrollDirection: Axis.horizontal,
                          //         itemBuilder: (context, index) {
                          //           return Image.network(
                          //             data.advertisements[index].image!,
                          //             height: 60.h,
                          //             width: double.infinity,
                          //             fit: BoxFit.fill,
                          //           );
                          //         },
                          //       ),
                          //     );
                          //   },
                          //   error: (error, stackTrace) {
                          //     return Text("try again $error");
                          //   },
                          //   loading: () {
                          //     return const CircularProgressIndicator();
                          //   },
                          // ),

                          homePostsData.when(
                            data: (data) {
                              return Stack(
                                children: [
                                  // Carousel Slider
                                  Positioned(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 130.h,
                                          width: double.infinity,
                                          child: CarouselSlider(
                                            items: data.sliders.map((banner) {
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const B2bScreen(),
                                                    ),
                                                  );
                                                },
                                                child: CachedNetworkImage(
                                                  width: double.infinity,
                                                  fit: BoxFit.fill,
                                                  imageUrl: banner.image!,
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              );
                                            }).toList(),
                                            options: CarouselOptions(
                                              aspectRatio:
                                                  2.5, // Adjust this as per design
                                              viewportFraction:
                                                  1.0, // Full-screen carousel
                                              autoPlay: true,
                                              enlargeCenterPage: false,
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  _currentIndex =
                                                      index; // Update the current index
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Dots Indicator
                                  Positioned(
                                    left:
                                        MediaQuery.of(context).size.width / 2 -
                                            50, // Center the dots
                                    bottom: 10.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: data.sliders.map((banner) {
                                        int index =
                                            data.sliders.indexOf(banner);
                                        return AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          height: 9.0,
                                          width: _currentIndex == index
                                              ? 12.0
                                              : 9.0, // Active dot is wider
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _currentIndex == index
                                                ? Colors
                                                    .white // Active dot color
                                                : Colors
                                                    .grey, // Inactive dot color
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              );
                            },
                            error: (error, stackTrace) {
                              return Text("Try again: $error");
                            },
                            loading: () {
                              return const CircularProgressIndicator();
                            },
                          ),

                          SizedBox(
                            height: 5.h,
                          ),

                          SizedBox(
                            width: double.infinity,
                            height: 420.h,
                            child: Column(
                              children: [
                                // Category Selector Row
                                SizedBox(
                                  width: double.infinity,
                                  height: 50.h,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categories.length,
                                    itemBuilder: (context, index) {
                                      bool isSelected = index == selectedIndex;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex =
                                                index; // Update selected index
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.all(5),
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? const Color(0xFF681b4e)
                                                : const Color(0xffA5A5A5),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            categories[index],
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                // Spacer
                                SizedBox(height: 5.h),

                                // Display Products for the selected category
                                category.when(
                                  data: (data) {
                                    // Define the products list corresponding to each category
                                    List<List<CategoryProduct>> productsList = [
                                      data.new_products, // SHOPZONE
                                      data.b2b_products, // TRADEHUB
                                      data.services, // SERVICES
                                      data.used_products, // USED
                                      data.jobs, // JOB
                                      data.event, // EVENT
                                      data.grocarry, // GROCERY
                                    ];

                                    // Ensure selectedIndex is valid and get products
                                    List<CategoryProduct> products =
                                        productsList[selectedIndex];
                                    return SizedBox(
                                      height: 340.h,
                                      child: ListView.builder(
                                        padding: const EdgeInsets.all(3),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: products.length,
                                        itemBuilder: (context, index) {
                                          CategoryProduct prod =
                                              products[index];
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetailScreen(
                                                            productId: prod.id),
                                                  ));
                                              // Handle product click if needed
                                            },
                                            child: ProductDetailWidget(
                                              distance: prod.shortestDistance,
                                              issponsored:
                                                  prod.user!.sponsored ?? false,
                                              shortestDistance: double.tryParse(
                                                  prod.nearestBranch ?? '0'),
                                              wow: prod.wow,
                                              comment: prod.commentcount
                                                      .toString() ??
                                                  '1',
                                              avg_rating:
                                                  prod.avg_rating?.toDouble(),

                                              offer: prod.offers,
                                              id: int.tryParse(prod.user!.id),
                                              lefttile:
                                                  categories[selectedIndex],
                                              vendorname: prod.user!.name,
                                              discounttedPrice:
                                                  prod.discounted_price,
                                              Vimage: prod.user!.photo,
                                              price: prod.price,
                                              title: prod.title,
                                              productImage: prod.image,
                                              membershipColor:
                                                  prod.user!.membercolor,
                                              similarproductCount:
                                                  prod.similarproductCount,
                                              membershipTitle:
                                                  prod.user!.membershipTitle,
                                              // avg_rating: prod.average_rating,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  error: (error, stackTrace) =>
                                      Center(child: Text("Error: $error")),
                                  loading: () => const Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ],
                            ),
                          ),

                          // Expanded(

                          // child: ProductDetailWidget(),),

                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: TabBar(
                              controller: dynamictabController,
                              tabs: const [
                                Tab(
                                  text: ' Global\n Brands',
                                ),
                                Tab(text: ' Domestic\n Brands'),
                                Tab(
                                    text:
                                        ' Spotlight\n Sellers'), // Changed label for clarity
                              ],
                              labelColor: const Color(0xff909090),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          buyorwin.when(
                            data: (data) {
                              double dynamicHeight;

                              if (dynamictabController.index == 0) {
                                dynamicHeight =
                                    data.insidearr[0].isEmpty ? 140.h : 420.h;
                              } else if (dynamictabController.index == 1) {
                                // Ensure data.doma[0] is valid and has length
                                dynamicHeight = (data.doma.isNotEmpty &&
                                        data.doma[0].isNotEmpty)
                                    ? 420.h
                                    : 200.h;
                              } else if (dynamictabController.index == 2)
                                dynamicHeight = (data.spotlight.isNotEmpty &&
                                        data.spot[0].isNotEmpty)
                                    ? 420.h
                                    : 300.h;
                              else
                                dynamicHeight = 300;

                              return SizedBox(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: dynamicHeight, // Main dynamic height
                                  width: double.infinity,
                                  child: TabBarView(
                                    controller: dynamictabController,
                                    children: [
                                      // First Tab
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (data.global.isNotEmpty)
                                            ...data.global.map((e) {
                                              return NotStoryWidget(
                                                vImage: e
                                                    .brandLogo, // Use the correct variable name
                                                index: data.global.indexOf(
                                                    e), // Get the index
                                                brandname: e.brandName,
                                              );
                                            }).toList(),
                                          data.insidearr[0].isEmpty
                                              ? nolistingfound()
                                              : SizedBox(
                                                  height: 340.h,
                                                  child: ListView.builder(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: data
                                                        .insidearr[0].length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      GlobalModel prod = data
                                                          .insidearr[0][index];
                                                      return InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ProductDetailScreen(
                                                                      productId:
                                                                          prod.id),
                                                            ),
                                                          );
                                                        },
                                                        child:
                                                            ProductDetailWidget(
                                                          shortestDistance: prod
                                                              .shortestDistance,
                                                          distance: prod
                                                              .shortestDistance,
                                                          avg_rating:
                                                              prod.avg_rating,
                                                          offer: prod.offers,
                                                          id: int.tryParse(prod
                                                              .user
                                                              .first
                                                              .user_id),
                                                          comment:
                                                              prod.commentnum,
                                                          wow: prod.wow,
                                                          issponsored: prod
                                                              .user[0]
                                                              .sponsored!,
                                                          vendorname:
                                                              prod.contactName,
                                                          discounttedPrice:
                                                              prod.discont,
                                                          Vimage: prod.title,
                                                          price: prod.price,
                                                          title: prod.title,
                                                          productImage:
                                                              prod.imageUrl,
                                                          similarproductCount: prod
                                                              .similarproductCount,
                                                          membershipColor: prod
                                                              .user
                                                              .first
                                                              .membership_color,
                                                          membershipTitle: prod
                                                              .user
                                                              .first
                                                              .membership_title,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                        ],
                                      ),
                                      // Second Tab
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (data.domestic.isNotEmpty)
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children:
                                                    data.domestic.map((e) {
                                                  return NotStoryWidget(
                                                    vImage: e.brandLogo,
                                                    index: data.domestic
                                                        .indexOf(e),
                                                    brandname: e.brandName,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          if (data.domestic.isNotEmpty)
                                            SizedBox(
                                              height: 340
                                                  .h, // Adjust to your dynamic height as needed
                                              child: ListView.builder(
                                                clipBehavior: Clip.antiAlias,
                                                padding:
                                                    const EdgeInsets.all(3),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: data.doma[0].length,
                                                itemBuilder: (context, index) {
                                                  GlobalModel prod =
                                                      data.doma[0][index];
                                                  return InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductDetailScreen(
                                                                  productId:
                                                                      prod.id),
                                                        ),
                                                      );
                                                    },
                                                    child: ProductDetailWidget(
                                                      shortestDistance:
                                                          prod.shortestDistance,
                                                      distance:
                                                          prod.shortestDistance,
                                                      avg_rating:
                                                          prod.avg_rating,
                                                      offer: prod.offers,
                                                      id: int.tryParse(prod
                                                          .user.first.user_id),
                                                      comment: prod.commentnum,
                                                      wow: prod.wow,
                                                      issponsored: prod
                                                          .user[0].sponsored!,
                                                      vendorname:
                                                          prod.contactName,
                                                      discounttedPrice:
                                                          prod.discont,
                                                      Vimage: prod.title,
                                                      price: prod.price,
                                                      title: prod.title,
                                                      productImage:
                                                          prod.imageUrl,
                                                      similarproductCount: prod
                                                          .similarproductCount,
                                                      membershipColor: prod
                                                          .user
                                                          .first
                                                          .membership_color,
                                                      membershipTitle: prod
                                                          .user
                                                          .first
                                                          .membership_title,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                      //third tab
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (data.domestic.isNotEmpty)
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children:
                                                    data.spotlight.map((e) {
                                                  return NotStoryWidget(
                                                    vImage: e.brandLogo,
                                                    index: data.spotlight
                                                        .indexOf(e),
                                                    brandname: e.brandName,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          if (data.spot[0].isNotEmpty)
                                            SizedBox(
                                              height: 340
                                                  .h, // Adjust to your dynamic height as needed
                                              child: ListView.builder(
                                                clipBehavior: Clip.antiAlias,
                                                padding:
                                                    const EdgeInsets.all(3),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: data.spot[0].length,
                                                itemBuilder: (context, index) {
                                                  GlobalModel prod =
                                                      data.spot[0][index];
                                                  return InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductDetailScreen(
                                                                  productId:
                                                                      prod.id),
                                                        ),
                                                      );
                                                    },
                                                    child: ProductDetailWidget(
                                                      shortestDistance:
                                                          prod.shortestDistance,
                                                      distance:
                                                          prod.shortestDistance,
                                                      avg_rating:
                                                          prod.avg_rating,
                                                      offer: prod.offers,
                                                      id: int.tryParse(prod
                                                          .user.first.user_id),
                                                      comment: prod.commentnum,
                                                      wow: prod.wow,
                                                      issponsored: prod
                                                          .user[0].sponsored!,
                                                      vendorname:
                                                          prod.contactName,
                                                      discounttedPrice:
                                                          prod.discont,
                                                      Vimage: prod.title,
                                                      price: prod.price,
                                                      title: prod.title,
                                                      productImage:
                                                          prod.imageUrl,
                                                      similarproductCount: prod
                                                          .similarproductCount,
                                                      membershipColor: prod
                                                          .user
                                                          .first
                                                          .membership_color,
                                                      membershipTitle: prod
                                                          .user
                                                          .first
                                                          .membership_title,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            error: (error, stackTrace) {
                              return Text("Error: $error");
                            },
                            loading: () => const CircularProgressIndicator(),
                          ),

                          // buyorwin.when(
                          //   data: (data) {
                          //     return SizedBox(
                          //       height: 340.h,
                          //       child: ListView.builder(
                          //         padding: const EdgeInsets.all(3),
                          //         clipBehavior: Clip.antiAlias,
                          //         scrollDirection: Axis.horizontal,
                          //         itemCount: data.home.length,
                          //         shrinkWrap: true,
                          //         itemBuilder: (context, index) {
                          //           Home1GlobalModel prefs = data.home[index];
                          //           return ProductDetailWidget(
                          //             price: prefs.price,
                          //             productImage: prefs.image,
                          //             title: prefs.title,
                          //             vendorname: prefs.userDetails!.name,
                          //             Vimage: prefs.userDetails!.photo,
                          //             similarproductCount:
                          //                 prefs.similarProductCount,
                          //             membershipColor:
                          //                 prefs.userDetails!.memberColor,
                          //             membershipTitle:
                          //                 prefs.userDetails!.membershipTitle,
                          //           );
                          //         },
                          //       ),
                          //     );
                          //   },
                          //   error: (error, stackTrace) {
                          //     return Text("error $error");
                          //   },
                          //   loading: () {
                          //     return const CircularProgressIndicator();
                          //   },
                          // ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "BuyOrWin",
                                  textAlign: TextAlign.center,
                                  style: headerstyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: const Color(0xff551b55)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Center(
                                  child: Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    margin: EdgeInsets.only(bottom: 5.h),
                                    height: 5.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF681b4e),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          buyorwin.when(
                            data: (data) {
                              // print("binod ${data.buynow.first.}");
                              return SizedBox(
                                height: 310.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: data.buynow.length,
                                  itemBuilder: (context, index) {
                                    Buynowmodel resp = data.buynow[index];
                                    return buyorwin_widget(
                                        worth: resp.worth!,
                                        productname: "Discount Coupon",
                                        vendorImage: resp.vendorImage,
                                        vendorname: resp.name,
                                        winners: resp.winners.toString(),
                                        proctimage: resp.image);
                                  },
                                ),
                              );
                            },
                            error: (error, stackTrace) {
                              return Text("error $error");
                            },
                            loading: () {
                              return const CircularProgressIndicator();
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "Sponsored",
                                  textAlign: TextAlign.center,
                                  style: headerstyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: const Color(0xff551b55)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Center(
                                  child: Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    margin: EdgeInsets.only(bottom: 5.h),
                                    height: 5.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff901B41),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                getSponsored.when(
                                  data: (data) {
                                    return SizedBox(
                                      height: 340.h,
                                      child: ListView.builder(
                                        padding: const EdgeInsets.all(3),
                                        clipBehavior: Clip.antiAlias,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: data.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          SponsoredProduct prefs = data[index];

                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetailScreen(
                                                            productId:
                                                                prefs.id),
                                                  ));
                                            },
                                            child: ProductDetailWidget(
                                              issponsored:
                                                  prefs.userdetails!.sponsored!,
                                              wow: prefs.wow,
                                              distance: prefs.shortestDistance,
                                              comment:
                                                  prefs.commentcount.toString(),
                                              avg_rating:
                                                  prefs.avg_rating?.toDouble(),
                                              discounttedPrice:
                                                  prefs.discounted_price,
                                              offer: prefs.offers,
                                              id: int.tryParse(prefs.id),
                                              price: prefs.price,
                                              productImage: prefs.image,
                                              title: prefs.title,
                                              vendorname:
                                                  prefs.userdetails!.name,
                                              Vimage: prefs.userdetails!.photo,
                                              similarproductCount:
                                                  prefs.similarProductCount,
                                              membershipColor: prefs
                                                  .userdetails!
                                                  .membership_color,
                                              membershipTitle: prefs
                                                  .userdetails!
                                                  .membership_title,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                    // SizedBox(
                                    //   height: 360.h,
                                    //   width: double.infinity,
                                    //   child: ListView.builder(
                                    //     padding: EdgeInsets.zero,
                                    //     clipBehavior: Clip.antiAlias,
                                    //     scrollDirection: Axis.horizontal,
                                    //     itemCount: data.length,
                                    //     shrinkWrap: true,
                                    //     itemBuilder: (context, index) {
                                    //       SponsoredProduct resp = data[index];
                                    //       return ProductDetailWidget(
                                    //         Vimage: resp.userdetails!.photo,
                                    //         price: resp.price,
                                    //         productImage: resp.image,
                                    //         title: resp.title,
                                    //         vendorname: resp.userdetails!.name,
                                    //       );
                                    //     },
                                    //   ),
                                    // );
                                  },
                                  error: (error, stackTrace) {
                                    return Text("error $error");
                                  },
                                  loading: () =>
                                      const CircularProgressIndicator(),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, right: 10.w, top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "All Products",
                                  textAlign: TextAlign.left,
                                  style: headerstyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: ColorConstant.blackColor),
                                ),
                                // SizedBox(height: 5.h,)
                              ],
                            ),
                          ),

                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          sliders.when(
                            data: (data) {
                              return GridView.builder(
                                physics:
                                    const NeverScrollableScrollPhysics(), // Disable grid scrolling
                                shrinkWrap: true, // Adjust to fit content
                                padding: EdgeInsets.zero,
                                itemCount: data.allProducts.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 400,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0.2,
                                  mainAxisSpacing: 0.2,
                                  childAspectRatio: 0.9,
                                ),

                                itemBuilder: (context, index) {
                                  VProduct res = data.allProducts[index];
                                  return Padding(
                                      padding: EdgeInsets.only(bottom: 5.h),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetailScreen(
                                                        productId: res.id),
                                              ));
                                        },
                                        child: AllProductDetailWidget(
                                          shortestDistance: data
                                              .allProducts[index]
                                              .shortestDistance,
                                          issponsored: data.allProducts[index]
                                              .user.hasSponsoredGifts,
                                          distance: data.allProducts[index]
                                              .shortestDistance,
                                          wow: data.allProducts[index].wow
                                              .toString(),
                                          discounttedPrice: data
                                              .allProducts[index]
                                              .discounted_price,
                                          comment: data
                                              .allProducts[index].commentcount
                                              .toString(),
                                          avg_rating: data
                                              .allProducts[index].avg_rating!
                                              .toDouble(),
                                          offer: data.allProducts[index].offers,
                                          productImage:
                                              data.allProducts[index].image,
                                          Vimage: data
                                              .allProducts[index].user.photo,
                                          vendorname:
                                              data.allProducts[index].user.name,
                                          title: data.allProducts[index].title,
                                          price: data.allProducts[index].price,
                                          similarproductCount: data
                                              .allProducts[index]
                                              .similarProductCount,
                                          membershipColor: data
                                              .allProducts[index]
                                              .userDetail
                                              .memberColor,
                                          membershipTitle: data
                                              .allProducts[index]
                                              .userDetail
                                              .membershipTitle,
                                        ),
                                      ));
                                },
                              );
                              // SizedBox(
                              //   height: 360.h,
                              //   width: double.infinity,
                              //   child: ListView.builder(
                              //     padding: EdgeInsets.zero,
                              //     clipBehavior: Clip.antiAlias,
                              //     scrollDirection: Axis.horizontal,
                              //     itemCount: data.allProducts.length,
                              //     shrinkWrap: true,
                              //     itemBuilder: (context, index) {
                              //       // print(
                              //       //     "ram ${}");
                              //       return ProductDetailWidget(
                              //         // productImage: data.allProducts[index].image,
                              //         Vimage:
                              //             data.allProducts[index].user.photo,

                              //         vendorname:
                              //             data.allProducts[index].user.name,
                              //         title: data.allProducts[index].title,
                              //         price: data.allProducts[index].price,
                              //       );
                              //     },
                              //   ),
                              // );
                            },
                            error: (error, stackTrace) {
                              return Text('error is $error');
                            },
                            loading: () {
                              return const CircularProgressIndicator();
                            },
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          valuenotifilersidebutton(
              showSideBar: _showSideBar, isSectionsVisible: _isSectionsVisible),
        ]));
  }
}

class valuenotifilersidebutton extends StatelessWidget {
  const valuenotifilersidebutton({
    super.key,
    required ValueNotifier<bool> showSideBar,
    required bool isSectionsVisible,
  })  : _showSideBar = showSideBar,
        _isSectionsVisible = isSectionsVisible;

  final ValueNotifier<bool> _showSideBar;
  final bool _isSectionsVisible;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _showSideBar,
      builder: (context, value, child) {
        return Positioned(
            top: _isSectionsVisible ? 300 : 300,
            right: 0,
            child: InkWell(
              onTap: () {
                _showSideBar.value = !value;
              },
              child: value
                  ? const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                          'assets/images/Smartbazaar-Icon-for-QR.png'),
                    )
                  : Container(
                      width: 70.w,
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                      ),
                      // Explicit height set
                      decoration: BoxDecoration(
                          color: const Color(0xffE2DAE5).withOpacity(0.9),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: Center(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          Image.asset('assets/images/smart.png'),
                          SizedBox(
                            height: 6.h,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/scanner.png',
                                    height: 15,
                                    color: const Color(0xff918994),
                                  ),
                                  Text(
                                    "Connect",
                                    style: headerstyle.copyWith(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff918994)),
                                  )
                                ],
                              )),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PendingApprovalScreen(),
                                    ));
                              },
                              icon: Column(
                                children: [
                                  const Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 15,
                                    color: Color(0xff918994),
                                  ),
                                  Text(
                                    "cart",
                                    style: headerstyle.copyWith(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff918994)),
                                  )
                                ],
                              )),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateNewListinScreen(),
                                    ));
                              },
                              icon: Column(
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 15,
                                    color: Color(0xff918994),
                                  ),
                                  Text(
                                    "add",
                                    style: headerstyle.copyWith(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff918994)),
                                  )
                                ],
                              )),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MyOrderScreen(),
                                    ));
                              },
                              icon: Column(
                                children: [
                                  Image.asset('assets/images/tennis.png'),
                                  Text(
                                    "Orders",
                                    style: headerstyle.copyWith(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff918994)),
                                  )
                                ],
                              )),
                        ],
                      )),
                    ),
            ));
      },
    );
  }
}

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    super.key,
    required this.homePostsData,
    required this.valueExtractor,
    required this.title,
  });

  final String title;
  final AsyncValue<HomePosts> homePostsData;
  final List<Product> Function(HomePosts) valueExtractor;

  @override
  Widget build(BuildContext context) {
    final value = homePostsData.valueOrNull;
    if (value != null && valueExtractor(value).isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: productCardHeight,
            child: switch (homePostsData) {
              AsyncData(:final value) => ListView.separated(
                  primary: false,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  shrinkWrap: true,
                  itemCount: valueExtractor(value).length,
                  itemBuilder: (context, index) {
                    final product = valueExtractor(value)[index];
                    return ProductCard(
                      product: product,
                      onTap: (product) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //           ProductDetailScreen(productId: product.id),
                        //     ));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ProductDetailsScreen(
                        //               productId: product.id,
                        //             )
                        //             ));
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 12.w,
                    );
                  },
                ),
              AsyncError() => ProductSliderSkeleton(),
              _ => ProductSliderSkeleton(),
            },
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}

class ProductSliderSkeleton extends StatelessWidget {
  ProductSliderSkeleton({super.key});

  final List<Product> fakeDate = List.generate(
    7,
    (index) => Product(
      id: '',
      title: '',
      price: '0',
      image: '',
      visits: '0',
      // pickup: '',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        primary: false,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 5.w),
        shrinkWrap: true,
        itemCount: fakeDate.length,
        itemBuilder: (context, index) {
          final product = fakeDate[index];
          return ProductCard(
            product: product,
            onTap: (product) {},
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 12.w,
          );
        },
      ),
    );
  }
}
