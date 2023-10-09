import 'package:flutter/material.dart';

class HeroDetailPage extends StatelessWidget {
  final String? name;
  final String? description;
  final String? image;
  final List<dynamic>? comics;

  const HeroDetailPage({
    Key? key,
    required this.name,
    required this.description,
    required this.comics,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name!),
        backgroundColor: const Color.fromRGBO(175, 37, 44, 2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(image!),
              const SizedBox(height: 16),
              ListTile(
                title: const Text(
                  'Descrição:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  description!,
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              ListTile(
                title: const Text(
                  'Quadrinhos:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    ListView.builder(
                      itemCount: comics?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final listComics = comics?[index];
                        return Text(listComics ?? "");
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
