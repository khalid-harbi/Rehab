// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:gap/gap.dart';
// import 'package:get_it/get_it.dart';
// import 'package:rehab/core/widgets/loading_widget.dart';
// import 'package:rehab/features/sub/search/presentation/cubit/search_cubit.dart';
// import 'package:rehab/features/sub/search/presentation/cubit/search_state.dart';
// import 'package:sizer/sizer.dart';

// // class SearchFeatureWidget extends HookWidget {
// //   const SearchFeatureWidget({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     final cubit = context.read<SearchCubit>();
// //     Timer? timer;
// //     final controllerSearch = useTextEditingController();

// //     controllerSearch.addListener(() async {
// //       if (timer != null) {
// //         timer!.cancel();
// //       }

// //       timer = Timer.periodic(Duration(milliseconds: 500), (timer) async {
// //         if (timer.tick == 1) {
// //           cubit.getSearchMethod(name: controllerSearch.text);
// //           timer.cancel();
// //         }
// //       });
// //     });

// //     return Column(
// //       children: [
// //         SafeArea(
// //           bottom: false,
// //           child: SearchBar(
// //             elevation: .all(2),
// //             controller: controllerSearch,
// //           ),
// //         ),
// //         Gap(5.sh),
// //         BlocBuilder<SearchCubit, SearchState>(
// //           builder: (context, state) {
// //             if (state is SearchSuccessState) {
// //               if (state.items.isEmpty) {
// //                 return const Center(child: Text("No items found"));
// //               }

// //               return ListView.builder(
// //                 padding: const EdgeInsets.only(bottom: 90),
// //                 itemCount: state.items.length,
// //                 itemBuilder: (context, index) {
// //                   final item = state.items[index];

// //                   return
// //                    Text(item.name);
// //                     // leading: AnyImageView(
// //                     //   imagePath: item.imageUrl,
// //                     //   height: 75,
// //                     //   width: 75,
// //                     // ),
// //                     // trailing: Text(
// //                     //   "ريال ${item.price}",
// //                     //   style: TextStyle(
// //                     //     color: Colors.green,
// //                     //     fontWeight: .bold,
// //                     //   ),
// //                     // ),

// //                 },
// //               );
// //             }

// //             return const LoadingWidget();
// //           },
// //         ),
// //       ],
// //     );
// //   }
// // }
// class SearchFeatureWidget extends HookWidget {
//   const SearchFeatureWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<SearchCubit>();

//     final controllerSearch = useTextEditingController();

//     final timer = useRef<Timer?>(null);

//     useEffect(() {
//       void listener() {
//         timer.value?.cancel();

//         timer.value = Timer(
//           const Duration(milliseconds: 500),
//           () {
//             cubit.getSearchMethod(
//               name: controllerSearch.text,
//             );
//           },
//         );
//       }

//       controllerSearch.addListener(listener);

//       return () {
//         controllerSearch.removeListener(listener);
//         timer.value?.cancel();
//       };
//     }, []);

//     return Column(
//       children: [
//         Row(
//           children: [
//             const BackButton(),

//             Expanded(
//               child: SearchBar(
//                 controller: controllerSearch,
//               ),
//             ),
//           ],
//         ),

//         const SizedBox(height: 16),

//         Expanded(
//           child: BlocBuilder<SearchCubit, SearchState>(
//             builder: (context, state) {
//               if (state is SearchSuccessState) {
//                 if (state.items.isEmpty) {
//                   return const Center(
//                     child: Text("No items found"),
//                   );
//                 }

//                 return ListView.builder(
//                   keyboardDismissBehavior:
//                       ScrollViewKeyboardDismissBehavior.onDrag,
//                   itemCount: state.items.length,
//                   itemBuilder: (context, index) {
//                     final item = state.items[index];

//                     return ListTile(
//                       title: Text(item.name),
//                     );
//                   },
//                 );
//               }

//               return const LoadingWidget();
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// ===============================
//  اخر كود صحيح
// ===============================

// import 'dart:async';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/features/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/features/sub/search/presentation/cubit/search_state.dart';
import 'package:sizer/sizer.dart';

// class SearchFeatureWidget extends HookWidget {
//   const SearchFeatureWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<SearchCubit>();
//     Timer? timer;
//     final controllerSearch = useTextEditingController();

//     controllerSearch.addListener(() async {
//       if (timer != null) {
//         timer!.cancel();
//       }

//       timer = Timer.periodic(Duration(milliseconds: 500), (timer) async {
//         if (timer.tick == 1) {
//           cubit.getSearchMethod(name: controllerSearch.text);
//           timer.cancel();
//         }
//       });
//     });

//     return Column(
//       children: [
//         SafeArea(
//           bottom: false,
//           child: SearchBar(
//             controller: controllerSearch,
//             elevation: const WidgetStatePropertyAll(2),
//           ),
//         ),

//         Gap(3.h),

//         Expanded(
//           child: BlocBuilder<SearchCubit, SearchState>(
//             builder: (context, state) {
//               if (state is SearchLoadingState) {
//                 return const LoadingWidget();
//               }

//               if (state is SearchSuccessState) {
//                 if (state.items.isEmpty) {
//                   return const Center(child: Text("No items found"));
//                 }

//                 return ListView.builder(
//                   itemCount: state.items.length,
//                   itemBuilder: (context, index) {
//                     final item = state.items[index];

//                     return ListTile(
//                       leading: const Icon(Icons.person),
//                       title: Text(item.name),
//                     );
//                   },
//                 );
//               }

//               return const SizedBox.shrink();
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
// ===============================
//  اخر كود صحيح
// ===============================

class SearchFeatureWidget extends HookWidget {
  const SearchFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Column(
      children: [
       

        // Gap(3.h),

        // Expanded(
        //   child: BlocBuilder<SearchCubit, SearchState>(
        //     builder: (context, state) {
        //       if (state is SearchLoadingState) {
        //         return const LoadingWidget();
        //       }

        //       if (state is SearchSuccessState) {
        //         if (state.items.isEmpty) {
        //           return const Center(child: Text("No items found"));
        //         }

        //         return ListView.builder(
        //           itemCount: state.items.length,
        //           itemBuilder: (context, index) {
        //             final item = state.items[index];

        //             return ListTile(
        //               leading: const Icon(Icons.person),
        //               title: Text(item.name),
        //             );
        //           },
        //         );
        //       }

        //       return const SizedBox.shrink();
        //     },
        //   ),
        // ),
      ],
    );
  }
}
