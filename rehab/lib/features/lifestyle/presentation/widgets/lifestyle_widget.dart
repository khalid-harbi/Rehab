import 'package:flutter/material.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_entity.dart';

// TODO: needs review

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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            itemCount: data.options.length,
            separatorBuilder: (_, _) => Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(height: 1, thickness: 1, color: Colors.grey[400]),
            ),
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
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (choices.isEmpty)
                    Text(
                      'No choices available',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    )
                  else
                    // Row to for equal widths
                    Row(
                      children: List.generate(choices.length, (choiceIndex) {
                        final choice = choices[choiceIndex];
                        final label = titleForLocale(
                          context,
                          choice.valueEn,
                          choice.valueAr,
                        );
                        final selected = selectedId == choice.id;

                        final chip = Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ChoiceChip(
                            label: Container(
                              width: double.infinity, // take available space
                              alignment: Alignment.center,
                              child: Text(
                                label,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                // style: TextStyle(fontSize: 14),
                              ),
                            ),
                            selected: selected,
                            showCheckmark: false,
                            onSelected: (_) =>
                                onSelectChoice(option.id, choice.id),
                            selectedColor: theme.colorScheme.primaryContainer,
                            backgroundColor:
                                theme.colorScheme.surfaceContainerHighest,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelStyle: TextStyle(
                              color: selected
                                  ? theme.colorScheme.onPrimaryContainer
                                  : theme.colorScheme.onSurfaceVariant,
                              fontWeight: selected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        );

                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: choiceIndex == 0 ? 0 : 10.0,
                            ),
                            child: chip,
                          ),
                        );
                      }),
                    ),
                ],
              );
            },
          ),
        ),

        // Anchored Bottom Bar
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.shadow.withAlpha(25),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            minimum: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (saveError != null) ...[
                  Text(
                    saveError!,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: isSaving ? null : onSave,
                  child: isSaving
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
