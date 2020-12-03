import 'package:movies/src/controllers/tab_store.dart';
import 'package:movies/src/utils/constants.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../components/tab_categories.dart';

class HeaderApp extends StatelessWidget {
  final TabStore tabstore;
  final Function(String) onChanged;
  final Animation<double> animation;

  const HeaderApp({
    Key key,
    @required this.tabstore,
    @required this.onChanged,
    @required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final _defaultWidthInput = 80.0;

    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        var widthInput = animation.value * size.width;

        return Container(
          width: size.width,
          height: size.height * 0.35,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Colors.white.withAlpha(0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                padding: EdgeInsets.only(left: animation.value > 0.7 ? 0 : 180),
                duration: Duration(seconds: 2),
                child: Text(
                  'Filmes',
                  style: TextStyle(
                    fontSize: 18,
                    color: titleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
                height: 56,
                width: widthInput > 93 ? widthInput : _defaultWidthInput,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(68 / 2),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Opacity(
                      opacity: animation.value,
                      child: Icon(
                        Icons.search,
                        size: 26,
                        color: Color(0xFF5E6770),
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: Opacity(
                        opacity: animation.value,
                        child: TextField(
                          onChanged: onChanged,
                          style: TextStyle(
                            color: subtitleColor,
                            fontWeight: FontWeight.normal,
                            fontSize: animation.value * 14,
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Pesquise filmes',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 18),
              Observer(
                builder: (_) => TabCategories(
                  categories: tabstore.categories,
                  onChangedTab: tabstore.setCurrentTab,
                  currentTabSelected: tabstore.indexTab,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
