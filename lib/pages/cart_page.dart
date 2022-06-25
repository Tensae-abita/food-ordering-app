import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:food/pages/components/order_button.dart';
import 'package:food/pages/success_page.dart';
import 'package:food/store/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class Cart_page extends StatefulWidget {
  static const id = 'cart';

  const Cart_page({Key? key}) : super(key: key);

  @override
  _Cart_pageState createState() => _Cart_pageState();
}

class _Cart_pageState extends State<Cart_page> {
  BranchContentMetaData metadata = BranchContentMetaData();
  BranchUniversalObject? buo;
  BranchLinkProperties lp = BranchLinkProperties();
  BranchEvent? eventStandart;
  BranchEvent? eventCustom;

  StreamSubscription<Map>? streamSubscription;
  StreamController<String> controllerData = StreamController<String>();
  StreamController<String> controllerInitSession = StreamController<String>();
  StreamController<String> controllerUrl = StreamController<String>();
  gotosomewhere() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Success_Page()));
  }

  void listenDynamicLinks() async {
    streamSubscription = FlutterBranchSdk.initSession().listen((data) {
      print('listenDynamicLinks - DeepLink Data: $data');
      controllerData.sink.add((data.toString()));
      if (data.containsKey('+clicked_branch_link') &&
          data['+clicked_branch_link'] == true) {
        print(
            '------------------------------------Link clicked----------------------------------------------');
        // print('Custom string: ${data['custom_string']}');
        // print('Custom number: ${data['custom_number']}');
        // print('Custom bool: ${data['custom_bool']}');
        // print('Custom list number: ${data['custom_list_number']}');
        // print(
        //     '------------------------------------------------------------------------------------------------');
        gotosomewhere();
        //   showSnackBar(
        //       context: context,
        //       message: 'Link clicked: Custom string - ${data['custom_string']}',
        //       duration: 10);
      }
    }, onError: (error) {
      PlatformException platformException = error as PlatformException;
      print(
          'InitSession error: ${platformException.code} - ${platformException.message}');
      controllerInitSession.add(
          'InitSession error: ${platformException.code} - ${platformException.message}');
    });
  }

  void initDeepLinkData() {
    metadata = BranchContentMetaData()
          ..addCustomMetadata('custom_string', 'abc')
          ..addCustomMetadata('custom_number', 12345)
          ..addCustomMetadata('custom_bool', true)
          ..addCustomMetadata('custom_list_number', [1, 2, 3, 4, 5])
          ..addCustomMetadata('custom_list_string', ['a', 'b', 'c'])
        //--optional Custom Metadata

        ;

    buo = BranchUniversalObject(
        canonicalIdentifier: 'flutter/branch',
        //parameter canonicalUrl
        //If your content lives both on the web and in the app, make sure you set its canonical URL
        // (i.e. the URL of this piece of content on the web) when building any BUO.
        // By doing so, we’ll attribute clicks on the links that you generate back to their original web page,
        // even if the user goes to the app instead of your website! This will help your SEO efforts.
        // canonicalUrl: 'https://flutter.dev',
        // title: 'Flutter Branch Plugin',
        // imageUrl:
        //     'https://flutter.dev/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg',
        // contentDescription: 'Flutter Branch Description',
        /*
        contentMetadata: BranchContentMetaData()
          ..addCustomMetadata('custom_string', 'abc')
          ..addCustomMetadata('custom_number', 12345)
          ..addCustomMetadata('custom_bool', true)
          ..addCustomMetadata('custom_list_number', [1, 2, 3, 4, 5])
          ..addCustomMetadata('custom_list_string', ['a', 'b', 'c']),
         */
        contentMetadata: metadata,
        keywords: ['Plugin', 'Branch', 'Flutter'],
        publiclyIndex: true,
        locallyIndex: true,
        expirationDateInMilliSec: DateTime.now()
            .add(const Duration(days: 365))
            .millisecondsSinceEpoch);

    lp = BranchLinkProperties(
        channel: 'facebook',
        feature: 'sharing',
        //parameter alias
        //Instead of our standard encoded short url, you can specify the vanity alias.
        // For example, instead of a random string of characters/integers, you can set the vanity alias as *.app.link/devonaustin.
        // Aliases are enforced to be unique** and immutable per domain, and per link - they cannot be reused unless deleted.
        //alias: 'https://branch.io' //define link url,
        stage: 'new share',
        campaign: 'xxxxx',
        tags: ['one', 'two', 'three'])
      ..addControlParam('\$uri_redirect_mode', '1')
      ..addControlParam('referring_user_id', 'asdf');
  }

  var urltoapp = '';
  void generateLink(BranchUniversalObject bou, BranchLinkProperties ip) async {
    BranchResponse response =
        await FlutterBranchSdk.getShortUrl(buo: buo!, linkProperties: lp);
    if (response.success) {
      urltoapp = response.result;
      print('tensu this is it $urltoapp');
      controllerUrl.sink.add('${response.result}');
    } else {
      controllerUrl.sink
          .add('Error : ${response.errorCode} - ${response.errorMessage}');
    }
  }

  @override
  void initState() {
    listenDynamicLinks();
    initDeepLinkData();
    get_link();
    super.initState();
  }

  get_link() async {
    return generateLink(
        BranchUniversalObject(
            canonicalIdentifier: 'flutter/branch',
            //parameter canonicalUrl
            //If your content lives both on the web and in the app, make sure you set its canonical URL
            // (i.e. the URL of this piece of content on the web) when building any BUO.
            // By doing so, we’ll attribute clicks on the links that you generate back to their original web page,
            // even if the user goes to the app instead of your website! This will help your SEO efforts.
            canonicalUrl: 'https://flutter.dev',
            title: 'Flutter Branch Plugin',
            imageUrl:
                'https://flutter.dev/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg',
            contentDescription: 'Flutter Branch Description',
            /*
        contentMetadata: BranchContentMetaData()
          ..addCustomMetadata('custom_string', 'abc')
          ..addCustomMetadata('custom_number', 12345)
          ..addCustomMetadata('custom_bool', true)
          ..addCustomMetadata('custom_list_number', [1, 2, 3, 4, 5])
          ..addCustomMetadata('custom_list_string', ['a', 'b', 'c']),
         */
            contentMetadata: metadata,
            keywords: ['Plugin', 'Branch', 'Flutter'],
            publiclyIndex: true,
            locallyIndex: true,
            expirationDateInMilliSec: DateTime.now()
                .add(const Duration(days: 365))
                .millisecondsSinceEpoch),
        BranchLinkProperties(
            channel: 'facebook',
            feature: 'sharing',
            //parameter alias
            //Instead of our standard encoded short url, you can specify the vanity alias.
            // For example, instead of a random string of characters/integers, you can set the vanity alias as *.app.link/devonaustin.
            // Aliases are enforced to be unique** and immutable per domain, and per link - they cannot be reused unless deleted.
            //alias: 'https://branch.io' //define link url,
            stage: 'new share',
            campaign: 'xxxxx',
            tags: ['one', 'two', 'three'])
          ..addControlParam('\$uri_redirect_mode', '1'));
  }

  bool ShowSpinner = false;
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    Size size = MediaQuery.of(context).size;

    return ModalProgressHUD(
      inAsyncCall: ShowSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Center(
            child: Text(
              "Your Cart",
              style: TextStyle(
                  color: kTextColor, fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      for (int i = 0; i < store.cart.length; i++)
                        Container(
                          // height: size.height * 0.22 ,
                          margin: const EdgeInsets.only(
                              left: 20, right: 15, top: 20, bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 20,
                                color:
                                    const Color(0xFFB0CCE1).withOpacity(0.32),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // store.setclickedProduct(store.Products[i]);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return DetailsScreen();
                                //     },
                                //   ),
                                // );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Image(
                                          fit: BoxFit.contain,
                                          width: size.width * 0.25,
                                          image: AssetImage(
                                              store.cart[i]['image']),
                                        ),
                                        Column(
                                          children: [
                                            Text(store.cart[i]['name']),
                                            const SizedBox(height: 10),
                                            Text(
                                              store.cart[i]['cafe'],
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      store.cart[i]['cafe'],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            color: kPrimaryColor,
                                            iconSize: size.width * 0.20,
                                            onPressed: () {
                                              setState(() {
                                                store.removeFromCart(
                                                    store.cart[i]);
                                              });
                                            },
                                            icon: const Icon(Icons.delete)),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    store.removeclickedProducts(
                                                        store.cart[i]);
                                                  });
                                                },
                                                icon: const Icon(Icons.remove)),
                                            Text(store.cart[i]['qty']
                                                .toString()),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    store.addtoCartQty(
                                                        store.cart[i]);
                                                  });

                                                  
                                                },
                                                icon: const Icon(Icons.add)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            if (store.cart.isNotEmpty) ...[
              OrderButton(
                press: () async {
                  setState(() {
                    ShowSpinner = true;
                    print('sfsf');
                  });

                  var products = <Map<String, dynamic>>[
                    for (int i = 0; i < store.cart.length; i++) ...[
                      {
                        "itemId": store.cart[i]['id'],
                        "itemName": store.cart[i]['name'],
                        "quantity": 1,
                        "unitPrice": store.cart[i]['price'],
                      },
                    ]
                  ];
                  var _url =
                      'https://testapi.yenepay.com/api/urlgenerate/getcheckouturl/';
                  var response = await http.post(
                    Uri.parse(_url),
                    headers: <String, String>{
                      'Content-Type': ' application/json;  charset=UTF-8',
                    },
                    body: jsonEncode(<String, dynamic>{
                      "process": "Cart",
                      "successUrl": urltoapp.toString(),
                      "merchantId": "SB1481",
                      "merchantOrderId": "tensu",
                      "expiresAfter": 24,
                      // "requestType": "PDT",
                      // "pdtToken": "BtNLhf2YhdLXEL",
                      "items": products,

                      "totalItemsDeliveryFee": 0,
                      "totalItemsTax1": store.getTotalPrice()
                    }),
                  );
                  if (response.statusCode == 200) {
                    var response_1 = await http.post(
                        Uri.parse(
                            'https://endpoints.yenepay.com/api/verify/pdt/ '),
                        headers: <String, String>{
                          'Content-Type': ' application/json ;  charset=UTF-8',
                        },
                        body: jsonEncode(<String, dynamic>{
                          "requestType": "PDT",
                          "pdtToken": "T9KJHvvbO94coy",
                          "transactionId": "84",
                          "merchantOrderId": "tens"
                        }));
                    var res = jsonDecode(response.body);
                    var result = res['result'];
                    print(result);

                    if (!await launch(result)) throw 'Could not launch $_url';
                    setState(() {
                      ShowSpinner = false;
                    });
                    print('the second $response_1');
                  } else {
                    print(response.statusCode);
                  }
                  var response_2 = await http.post(
                      Uri.parse('https://testapi.yenepay.com/api/verify/ipn/'),
                      headers: <String, String>{
                        'Content-Type': ' application/json',
                      },
                      body: jsonEncode(<String, dynamic>{
                        "totalAmount": 1.00,
                        "buyerId": "37b20de1-5e1f-443f-b575-3ea79dc1b9f2",
                        "merchantOrderId": "51",
                        "merchantId": "02e1aaa5-ed29-408e-a24b-eddd665c3e8f",
                        "merchantCode": "0325",
                        "transactionId": "12137c4e-6ef1-4a78-b0ae-a058ba21c0ff",
                        "status": "9",
                        "transactionCode": "8087",
                        "currency": "ETB",
                        "signature":
                            "oN88OCmKmUu7sp4ihh//1/FPmdnrdaL/HjhxOkYSIby2pq+F4Tq9NMz6KMuWEj2x7WkrkFDjvbjZaU4Varfl8Uun4JpXOBbmon1NQ1vcQ2CvrgZHwbCZljU54CtSnw4Bkv/qCxm5MWOOMBuq4fu2AyjRCKcEjf7vKixut5y+5lhq437AOWiNoLkdJQeLgp/2KeVKofpVsmmcHWP1g/+gCIjLhJyhp5zgUul3KyiIbNrxcg5Bojx5k79pR/EwPIaQZDfrfHJUuYIMGUH3bZhnBhhTYrl6z9hPG5uOblFVyu+qt0WgQ6NWq3FJRkl0k/kxg8zUV9llFp+IUZ2RASBzrw=="
                      }));

                  print('the third $response_2');
                },
                Button_Name: "CheckOut",
                size: size,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
