import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../models/product_model.dart';
import '../widgets/buttons.dart';
import 'product_detail_vm.dart';

// ignore: must_be_immutable
class ProductDetailVU extends StackedView<ProductDetailVM> {
  ProductDetailVU(this.product, {super.key});

  Product product;

  @override
  Widget builder(
      BuildContext context, ProductDetailVM viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xffD8D8D8),
      body: SafeArea(
        child: Stack(children: [
          Image.network(
            product.image!,
            fit: BoxFit.contain,
          ),
          appbarIcons(context),
          const Positioned(
            top: 55,
            left: 15,
            right: 15,
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          bottomBar(viewModel, product),
        ]),
      ),
    );
  }

  @override
  ProductDetailVM viewModelBuilder(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xffe8eaf6),
    ));
    final vm = ProductDetailVM();

    return vm;
  }
}

Widget reviewContainer(Product product) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    height: 98,
    width: 373,
    color: const Color(0xffF1F1F1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews (${product.rating!.count.toString()})',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Text(
              product.rating!.rate.toString(),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 36),
            SvgPicture.asset('assets/images/rate.svg')
          ],
        )
      ],
    ),
  );
}

Widget appbarIcons(BuildContext context) {
  return Positioned(
    top: 15,
    left: 15,
    right: 15,
    child: Row(
      children: [
        ActionButton(
          icon: 'assets/images/Icon.svg',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        ActionButton(
          icon: 'assets/images/Menu_button.svg',
          onTap: () {},
        ),
      ],
    ),
  );
}

Widget bottomBar(ProductDetailVM viewModel, Product product) {
  return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36), topRight: Radius.circular(36))),
        // height: 240,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                  onTap: viewModel.showVisibility,
                  child: SvgPicture.asset(viewModel.visibility
                      ? 'assets/images/Less_details_Button.svg'
                      : 'assets/images/Shape.svg')),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                      elevation: 20,
                      child: ActionButton(
                        icon: 'assets/images/share.svg',
                        height: 55,
                        width: 55,
                        iconColor: Color(0xff2AB3C6),
                      )),
                  Spacer(),
                  STCHealthButton(
                    height: 54,
                    width: 275,
                    btnLabel: 'Order Now',
                  )
                ],
              ),
              const SizedBox(height: 22),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                  )),
              const SizedBox(height: 12),
              Text(
                product.description!,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 12),
              Visibility(
                  visible: viewModel.visibility,
                  child: reviewContainer(product))
            ],
          ),
        ),
      ));
}
