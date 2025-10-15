import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            separatorBuilder: (context, index) =>
                const SizedBox(height: 8), // jarak antar item
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            itemBuilder: (context, index) {
              return Material(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ), // ⬅️ border
                ),
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg',
                            width: double.infinity,
                            height: 185,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 16,
                          child: Material(
                            borderRadius: BorderRadius.circular(100),
                            elevation: 0,
                            color: Colors.amber,
                            child: Padding(
                              padding: const EdgeInsets.all(4.5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.brown,
                                    size: 12,
                                  ),
                                  Text(
                                    "90%",
                                    style: TextStyle(
                                      color: Colors.brown,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Title $index",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Description",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
