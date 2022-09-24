import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/NAV/mobiles/topTitleButtom.dart';
import 'package:v1douvery/common/widgets/custon_button.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/admin/servicios/adminServices.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/models/order.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/provider/user_provider.dart';

class OrderDetailScreen extends StatefulWidget {
  static const String routeName = '/order-details';
  final Order order;
  const OrderDetailScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

List<Product>? productList;
final HomeServices homeServices = HomeServices();

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int currentStep = 0;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    currentStep = widget.order.status;
  }

  // !!! ONLY FOR ADMIN!!!
  void changeOrderStatus(int status) {
    adminServices.changeOrdersStatus(
      context: context,
      status: status + 1,
      order: widget.order,
      onSuccess: () {
        setState(() {
          currentStep += 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(105),
        child: TopTitleButtom(
          title: 'volver',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                color: GlobalVariables.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff05595B)),
                          alignment: Alignment.center,
                          child: const Text(
                            'View order details',
                            style: TextStyle(
                                fontSize: 17,
                                color: GlobalVariables.colorTextWhiteLight),
                          ),
                        ),
                      ),
                      const Text(
                        'Tracking',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: Stepper(
                          currentStep: currentStep,
                          controlsBuilder: (context, details) {
                            if (user.type == 'admin') {
                              return CustomButton(
                                text: 'Done',
                                onTap: () =>
                                    changeOrderStatus(details.currentStep),
                              );
                            }
                            return const SizedBox();
                          },
                          steps: [
                            Step(
                              title: const Text('Pending'),
                              content: Column(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/envioShopping.png'),
                                        // picked file
                                        fit: BoxFit.contain,
                                      ),
                                      color: GlobalVariables.backgroundColor,
                                    ),
                                  ),
                                  const Text(
                                    'Your order is yet to be delivered',
                                  ),
                                ],
                              ),
                              isActive: currentStep > 0,
                              state: currentStep > 0
                                  ? StepState.complete
                                  : StepState.indexed,
                            ),
                            Step(
                              title: const Text('Completed'),
                              content: const Text(
                                'Your order has been delivered, you are yet to sign.',
                              ),
                              isActive: currentStep > 1,
                              state: currentStep > 1
                                  ? StepState.complete
                                  : StepState.indexed,
                            ),
                            Step(
                              title: const Text('Received'),
                              content: const Text(
                                'Your order has been delivered and signed by you.',
                              ),
                              isActive: currentStep > 2,
                              state: currentStep > 2
                                  ? StepState.complete
                                  : StepState.indexed,
                            ),
                            Step(
                              title: const Text('Delivered'),
                              content: const Text(
                                'Your order has been delivered and signed by you!',
                              ),
                              isActive: currentStep >= 3,
                              state: currentStep >= 3
                                  ? StepState.complete
                                  : StepState.indexed,
                            ),
                            Step(
                              title: const Text('Finish'),
                              content: const Text(
                                'Your order has been delivered and signed by you!',
                              ),
                              isActive: currentStep >= 3,
                              state: currentStep >= 3
                                  ? StepState.complete
                                  : StepState.indexed,
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Product',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              color: GlobalVariables.backgroundColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = 0;
                                  i < widget.order.products.length;
                                  i++)
                                Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          widget.order.products[i].images[0],
                                      height: 120,
                                      width: 120,
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.order.products[i].name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            '${widget.order.products[i].marca}',
                                          ),
                                          Text(
                                            'Qty: ${widget.order.quantity[i]}',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          color: Colors.black12,
                                          width: 1,
                                        ),
                                      ),
                                      color: GlobalVariables.backgroundColor),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Order ID:          ${widget.order.id}'),
                                      Text(
                                          'Order Total:      \$${widget.order.totalPrice}'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Purchase Details',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
