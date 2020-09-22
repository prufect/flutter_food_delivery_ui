import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatelessWidget {
  _buildCartItem(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(20.0),
      height: 120.0,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(order.food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          order.food.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(width: 1.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Text(order.quantity.toString(),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                              SizedBox(width: 20.0),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "\$${order.quantity * order.food.price}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart(${currentUser.cart.length})"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          Order order = currentUser.cart[index];
          return _buildCartItem(context, order);
        },
        separatorBuilder: (BuildContext contxt, int index) {
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
        itemCount: currentUser.cart.length,
      ),
    );
  }
}
