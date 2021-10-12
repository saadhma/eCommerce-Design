import 'package:ecommerce_design/controller/stripe_service.dart';
import 'package:ecommerce_design/screens/existing_cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {

  List<String> textList = ["Pay via new card", "Pay via existing card", "Pay with Paypal"];
  List<IconData> iconList = [Icons.add_circle, Icons.credit_card, Icons.credit_card];

  onItemPress(BuildContext context, int index) async {
    switch(index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Get.to(const ExistingCardsPage());
        // Navigator.pushNamed(context, '/existing_cards');
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
    var response = await StripeService.payWithNewCard(
        amount: '15000',
        currency: 'USD'
    );
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
          duration: Duration(milliseconds: response.success == true ? 1200 : 3000),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: Text(textList[index]),
                  leading: Icon(iconList[index]),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: theme.primaryColor,
            ),
            itemCount: 3
        ),
      ),
    );
  }

}