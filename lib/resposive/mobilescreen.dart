/* import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart'; */
import 'package:flutter/material.dart';
import 'package:flutter_application_instagram_clone/assets/profilePic/list_propic.dart';
import 'package:flutter_application_instagram_clone/models/user_models.dart';
import 'package:flutter_application_instagram_clone/provider/product_provider.dart';
import 'package:flutter_application_instagram_clone/provider/user_provider.dart';
import 'package:flutter_application_instagram_clone/resources/auth_method.dart';
import 'package:flutter_application_instagram_clone/screens/add_products.dart';
import 'package:flutter_application_instagram_clone/screens/showproducts.dart';
import 'package:flutter_application_instagram_clone/util/colors.dart';
import 'package:provider/provider.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    final screesize = MediaQuery.of(context).size;
    List propics = Provider.of<ProfilePicFetcher>(context).proPic;
    UserDataModels? user = Provider.of<UserdataProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              splashRadius: 15,
              onPressed: () {
                AuthMethod().logOut(context);
              },
              icon: const Icon(
                Icons.power_settings_new_sharp,
              )),
        ],
        iconTheme: const IconThemeData(color: primaryColor),
        title: Text(user.userName.toUpperCase()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              height: screesize.height * 0.13,
              width: screesize.height * 0.13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset(propics[user.dpno], fit: BoxFit.cover),
              ),
            ),

            //role
            Column(
              children: [
                const Text(
                  'ROLE',
                  style: TextStyle(fontSize: 20),
                ),
                Text(user.role.toUpperCase()),
              ],
            ),
          ]),
          SizedBox(width: double.infinity, height: screesize.height * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () async {
                  ProductProvider _prod =
                      Provider.of<ProductProvider>(context, listen: false);
                  await _prod.updateProducts();
                  Navigator.of(context).pushNamed(ShowProducts.routName);
                },
                child: const Text('show all products'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddProductsScreen.routName);
                },
                child: const Text('add products'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('delete product'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
