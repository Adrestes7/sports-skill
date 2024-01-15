import 'package:flutter/material.dart';

class ActivityReviewEvents extends StatefulWidget {
  @override
  _ActivityReviewEventsState createState() => _ActivityReviewEventsState();
}

class _ActivityReviewEventsState extends State<ActivityReviewEvents>
    with SingleTickerProviderStateMixin {
  List<String> createdProducts = ['Product 1', 'Product 2', 'Product 3'];
  List<String> purchasedProducts = ['Purchased Product 1', 'Purchased Product 2'];

  List<String> currentProducts = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Initially, show created products
    currentProducts = createdProducts;
  }

  void switchTab() {
    setState(() {
      // Toggle between created and purchased products
      _tabController.index == 0
          ? _tabController.animateTo(1)
          : _tabController.animateTo(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Eventsoo Activity'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Created'),
              Tab(text: 'Purchased'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildProductList(createdProducts),
            _buildProductList(purchasedProducts),
          ],
        ),
        // Bottom button for switching tabs
        floatingActionButton: FloatingActionButton(
          onPressed: switchTab,
          child: Icon(Icons.swap_horiz),
        ),
      ),
    );
  }

  Widget _buildProductList(List<String> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index]),
          // Add more details or actions for each product if needed
        );
      },
    );
  }
}

