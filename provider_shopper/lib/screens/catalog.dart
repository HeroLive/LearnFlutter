import 'package:flutter/material.dart';
import 'package:provider_shopper/models/catalog.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
          itemCount: CatalogModel.itemNames.length,
          itemBuilder: (context, index) {
            final item = CatalogModel().getById(index);
            return _MyListItem(item);
          }),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final Item item;

  const _MyListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name),
            ),
            const SizedBox(width: 24),
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
