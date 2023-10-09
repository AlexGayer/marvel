import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel/app/constants/widget_stateful.dart';
import 'package:marvel/app/controller/hero_store.dart';
import 'package:marvel/app/pages/hero_details_page.dart';

class HeroListPage extends StatefulWidget {
  const HeroListPage({super.key});

  @override
  State<HeroListPage> createState() => _HeroListPageState();
}

class _HeroListPageState extends WidgetStateful<HeroListPage, HeroStore> {
  @override
  void initState() {
    super.initState();

    controller.fetchHeroes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heróis da Marvel'),
        backgroundColor: const Color.fromRGBO(175, 37, 44, 2),
      ),
      body: Observer(
        builder: (_) {
          if (controller.heroes.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color.fromRGBO(175, 37, 44, 2),
            ));
          } else {
            return ListView.builder(
              itemCount: controller.heroes.length,
              itemBuilder: (context, index) {
                final hero = controller.heroes[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      hero.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: ClipOval(
                      child: Image.network(
                        "${hero.image}.${hero.extension}",
                        height: 200,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HeroDetailPage(
                            name: hero.name,
                            description: hero.description,
                            image: "${hero.image}.${hero.extension}",
                            comics: hero.comics,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
