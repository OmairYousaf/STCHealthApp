import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/styles.dart';
import '../product_detail/product_detail_vu.dart';
import 'product_vm.dart';

class ProductListViewScreen extends StackedView<ProductListViewModel> {
  const ProductListViewScreen({super.key});
  @override
  Widget builder(
      BuildContext context, ProductListViewModel viewModel, Widget? child) {
    return Scaffold(
        backgroundColor: const Color(0xffD8D8D8),
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: ListView.builder(
              itemCount: viewModel.products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailVU(
                                  viewModel.products[index],
                                )));
                  },
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        imageSection(viewModel, index),
                        const SizedBox(height: 12),
                        descSection(viewModel, index),
                        const SizedBox(height: 12),
                        const Divider(
                          height: 2,
                          thickness: 2,
                        ),
                        const SizedBox(height: 12)
                      ],
                    ),
                  ),
                );
              }),
        ),
        bottomNavigationBar: bottomNavBar(viewModel));
  }

  @override
  ProductListViewModel viewModelBuilder(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xffe8eaf6),
    ));
    final vm = ProductListViewModel();
    vm.getProducts();
    return vm;
  }
}

class CircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 15); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffe8eaf6), // Customize the background color
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0), // Adjust the radius as needed
          bottomRight: Radius.circular(35.0), // Adjust the radius as needed
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 12),
        child: Center(
          child: Text(
            'All Products',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
                color: Color(0xff08293B)),
          ),
        ),
      ),
    );
  }
}

Widget imageSection(ProductListViewModel viewModel, int index) {
  return Expanded(
    flex: 3,
    child: SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              viewModel.products[index].image!,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              bottom: 12,
              left: 12,
              child: Text(
                '${viewModel.products[index].price} AED'.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.grey),
              )),
          Positioned(
              bottom: 22,
              right: 12,
              child: SvgPicture.asset('assets/images/rate.svg'))
        ],
      ),
    ),
  );
}

Widget descSection(ProductListViewModel viewModel, int index) {
  return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            viewModel.products[index].title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Color(
                  0xff444B51,
                ),
                fontStyle: FontStyle.italic,
                fontSize: 14,
                fontWeight: FontWeight.w300),
          ),
          Text(
            viewModel.products[index].description!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Color(
                  0xff08293B,
                ),
                fontStyle: FontStyle.italic,
                fontSize: 10,
                fontWeight: FontWeight.w400),
          ),
        ],
      ));
}

Widget bottomNavBar(ProductListViewModel viewModel) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(22), topRight: Radius.circular(22)),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: StcHealthStyles.primaryColor,
      unselectedItemColor: Colors.grey,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SvgPicture.asset(
              'assets/images/Home.svg',
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SvgPicture.asset(
                'assets/images/Vector.svg',
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SvgPicture.asset(
              'assets/images/Like.svg',
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SvgPicture.asset(
                'assets/images/User.svg',
              ),
            ),
            label: '')
      ],
      onTap: viewModel.onItemTapped,
      currentIndex: viewModel.selectedIndex,
    ),
  );
}
