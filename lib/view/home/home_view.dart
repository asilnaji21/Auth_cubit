import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/home/home_cubit.dart';
import '../../business_logic/home/home_states.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is GetCategoriesLoadingState) {
              return const  Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetCategoriesSuccessState) {
              return GridView.builder(
                itemCount: state.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            state.categories[index].image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(state.categories[index].title!)
                      ],
                    ),
                  );
                },
              );
            } else if (state is FailedToGetCategoriesState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}







