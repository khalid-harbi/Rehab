import 'package:flutter/material.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_entity.dart';

typedef OnSelectChoice = void Function(String optionId, String choiceId);

class LifestyleOptionsBody extends StatelessWidget {
  const LifestyleOptionsBody({
    super.key,
    required this.data,
    required this.isSaving,
    required this.saveError,
    required this.onSelectChoice,
    required this.onSave,
  });

  final LifestyleEntity data;
  final bool isSaving;
  final String? saveError;
  final OnSelectChoice onSelectChoice;
  final VoidCallback onSave;

  // ==================================================================
  // ==================================================================
  // ==================================================================

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: data.options.length,
            separatorBuilder: (_, _) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final option = data.options[index];
              final choices = data.choicesForOption(option.id);
              final selectedId = data.selectionsByOptionId[option.id];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleForLocale(context, option.titleEn, option.titleAr),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (choices.isEmpty)
                    Text(
                      'No choices available',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    )
                  else
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: choices.map((choice) {
                        final label = titleForLocale(
                          context,
                          choice.valueEn,
                          choice.valueAr,
                        );
                        final selected = selectedId == choice.id;
                        return ChoiceChip(
                          label: Text(label),
                          selected: selected,
                          onSelected: (_) =>
                              onSelectChoice(option.id, choice.id),
                          selectedColor: theme.colorScheme.primaryContainer,
                          labelStyle: TextStyle(
                            color: selected
                                ? theme.colorScheme.onPrimaryContainer
                                : theme.colorScheme.onSurface,
                          ),
                        );
                      }).toList(),
                    ),
                ],
              );
            },
          ),
        ),
        SafeArea(
          minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (saveError != null) ...[
                Text(
                  saveError!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              FilledButton(
                onPressed: isSaving ? null : onSave,
                child: isSaving
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
