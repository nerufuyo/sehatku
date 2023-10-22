import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatku/common/constant.dart';
import 'package:sehatku/presentation/bloc/product/product_bloc.dart';
import 'package:sehatku/presentation/style/pallet.dart';
import 'package:sehatku/presentation/style/typography.dart';
import 'package:sehatku/presentation/widgets/basic_components.dart';
import 'package:sehatku/presentation/widgets/custom_appbar.dart';
import 'package:sehatku/presentation/widgets/custom_drawer.dart';
import 'package:sehatku/presentation/widgets/custom_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final List tabName = ['Semua', 'Alat Kesehatan', 'Layanan Kesehatan'];
  final List packageName = ['Satuan', 'Paket Pemeriksaan'];
  TabController? tabController;
  TabController? packageController;

  void fetchData() {
    Future.microtask(
      () => context.read<ProductBloc>().add(ProductEvent()),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    tabController = TabController(length: tabName.length, vsync: this);
    packageController = TabController(length: packageName.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: customAppBar(
        menuOnPressed: () => key.currentState!.openDrawer(),
      ),
      drawer: customDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  customVerticalSpace(height: 16),
              shrinkWrap: true,
              itemCount: contentPromo.length,
              itemBuilder: (context, index) => customListView(
                context,
                index,
                contentPaddingAlign: contentPromo[index]['isLeft'],
                contentFirstText: contentPromo[index]['boldText'],
                contentSecondText: contentPromo[index]['normalText'],
                contentSecondTextStyle: contentPromo[index]['boldText'],
                contentDescription: contentPromo[index]['description'],
                contentButtonOntapped: () {},
                contentButtonCondition: contentPromo[index]['buttonIcon'],
                contentButtonText: contentPromo[index]['buttonText'],
                contentButtonIcon: contentPromo[index]['buttonIcon'],
                contentPositionAlign: contentPromo[index]['isLeft']
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
                contentImage: contentPromo[index]['image'],
              ),
            ),
            customVerticalSpace(height: 16),
            _buildFilter(context),
            customVerticalSpace(height: 16),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primary,
                    ),
                  );
                }

                if (state is ProductError) {
                  return customText(
                    textValue: state.message,
                    textStyle: body2.copyWith(color: Colors.red),
                  );
                }

                if (state is ProductLoaded) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTabBar(
                          tabBarController: tabController,
                          tabBarOnTapped: (index) {
                            setState(() {
                              tabController!.index = index;
                            });
                          },
                          tabBarLength: tabName.length,
                          tabBarName: tabName,
                          tabBarTextColor: tabController!.index,
                          tabBarIndicatorColor: primary,
                          tabBarSelectedColor: white0,
                        ),
                        _buildContentHorizontalList(context, state),
                        customVerticalSpace(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: customText(
                            textValue: 'Pilih Tipe Layanan Kesehatan Anda',
                            textStyle: body2.copyWith(color: primary),
                          ),
                        ),
                        customVerticalSpace(height: 8),
                        customTabBar(
                          tabBarController: packageController,
                          tabBarOnTapped: (index) {
                            setState(() {
                              packageController!.index = index;
                            });
                          },
                          tabBarLength: packageName.length,
                          tabBarName: packageName,
                          tabBarTextColor: packageController!.index,
                          tabBarIndicatorColor: secondary,
                          tabBarSelectedColor: primary,
                        ),
                        customVerticalSpace(height: 8),
                        _buildVerticalList(state),
                        customVerticalSpace(height: 8),
                      ],
                    ),
                  );
                }

                return customText(textValue: 'No data');
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .1,
              color: primary,
            )
          ],
        ),
      ),
    );
  }

  ListView _buildVerticalList(ProductLoaded state) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => customVerticalSpace(height: 8),
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: white10,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(20),
          color: white0,
        ),
        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          bottom: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .425,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customText(
                    textValue: state.products[index].nama,
                    textStyle: heading4.copyWith(color: primary),
                  ),
                  customVerticalSpace(height: 8),
                  customText(
                    textValue: state.products[index].harga,
                    textStyle: heading5.copyWith(
                      color: accent10,
                    ),
                  ),
                  customVerticalSpace(height: 16),
                  Column(
                    children: List.generate(
                      2,
                      (index) => Row(
                        children: [
                          Icon(
                            index == 0
                                ? Icons.location_city_rounded
                                : Icons.location_on_rounded,
                            color: primary,
                            size: 20,
                          ),
                          customHorizontalSpace(width: 8),
                          customText(
                            textValue: index == 0
                                ? state.products[index].status
                                : state.products[index].tempat,
                            textStyle: body4,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                state.products[index].gambar,
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.height * .2,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildContentHorizontalList(
      BuildContext context, ProductLoaded state) {
    return Container(
      height: MediaQuery.of(context).size.height * .325,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => customHorizontalSpace(width: 8),
        itemCount: state.products.length,
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width * .5,
          decoration: BoxDecoration(
            border: Border.all(
              color: white10,
              width: .5,
            ),
            borderRadius: BorderRadius.circular(20),
            color: white0,
          ),
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      state.products[index].gambar,
                      width: MediaQuery.of(context).size.width * .4,
                      height: MediaQuery.of(context).size.height * .2,
                    ),
                  ),
                  customVerticalSpace(height: 8),
                  customText(
                    textValue: state.products[index].nama,
                    textStyle: body3.copyWith(
                      color: primary,
                    ),
                  ),
                  customVerticalSpace(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        textValue: state.products[index].harga,
                        textStyle: body4.copyWith(
                          color: accent10,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: green10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: customText(
                          textValue: state.products[index].status,
                          textStyle: body4.copyWith(
                            color: green20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildFilter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'lib/assets/images/filter_image.png',
              width: 20,
              height: 20,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .75,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari',
                hintStyle: body2.copyWith(color: white20),
                isDense: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    color: primary,
                    size: 24,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    color: white20,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    color: white20,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    color: primary,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
