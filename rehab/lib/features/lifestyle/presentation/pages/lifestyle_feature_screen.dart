import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/features/lifestyle/presentation/cubit/lifestyle_cubit.dart';
import 'package:rehab/features/lifestyle/presentation/cubit/lifestyle_state.dart';
import 'package:rehab/features/lifestyle/presentation/widgets/lifestyle_widget.dart';

class LifestyleFeatureScreen extends StatelessWidget {
  const LifestyleFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lifestyle')),
      // ==================================================================
      // ==================================================================
      body: BlocConsumer<LifestyleCubit, LifestyleState>(
        // ==================================================================
        listenWhen: (previous, current) {
          if (previous is LifestyleLoadedState &&
              current is LifestyleLoadedState) {
            return previous.isSaving &&
                !current.isSaving &&
                current.saveError == null;
          }
          return false;
        },
        // ==================================================================
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Saved'),
            ),
          );
        },
        // ==================================================================
        builder: (context, state) {
          switch (state) {
            case LifestyleInitialState _:
            // ==================================================================
            case LifestyleLoadingState _:
              return Center(child: LoadingWidget());
            // ==================================================================
            case LifestyleLoadedState _:
              return LifestyleOptionsBody(
                data: state.data,
                isSaving: state.isSaving,
                saveError: state.saveError,
                onSelectChoice: (optionId, choiceId) {
                  context.read<LifestyleCubit>().selectChoice(
                    optionId,
                    choiceId,
                  );
                },
                onSave: () => context.read<LifestyleCubit>().save(),
              );
            // ==================================================================
            case LifestyleErrorState _:
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(state.message, textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () => context.read<LifestyleCubit>().load(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            // ==================================================================
            default:
              return const SizedBox.shrink();
          }
        },
        // ==================================================================
      ),
    );
  }
}
