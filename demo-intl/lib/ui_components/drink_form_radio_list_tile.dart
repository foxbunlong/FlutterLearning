/*
 * Copyright (c) 2020 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * This project and source code may use libraries or frameworks that are
 * released under various Open-Source licenses. Use of those libraries and
 * frameworks are governed by their own individual licenses.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:buzzkill/drink.dart';
import 'package:buzzkill/ui_components/digits_text_field.dart';
import 'package:flutter/material.dart';

/// A [RadioListTile] that, if selected, shows a form for creating a
/// customized caffeinated drink.
class DrinkFormRadioListTile extends StatelessWidget {
  const DrinkFormRadioListTile({
    Key key,
    this.selectedSuggestion,
    this.onSelected,
    this.caffeineInputController,
    this.servingSizeInputController,
    this.onInputChanged,
    this.servingSizeLabelText,
    this.servingSizeSuffixText,
    this.caffeineAmountLabelText,
    this.caffeineAmountSuffixText,
    this.titleText,
  }) : super(key: key);

  final TextEditingController caffeineInputController;
  final TextEditingController servingSizeInputController;

  /// The currently selected drink.
  final Drink selectedSuggestion;
  final VoidCallback onSelected;

  /// Called if the serving size or caffeine amount input value changes.
  final VoidCallback onInputChanged;
  final String titleText;
  final String servingSizeLabelText;
  final String servingSizeSuffixText;
  final String caffeineAmountLabelText;
  final String caffeineAmountSuffixText;

  @override
  Widget build(BuildContext context) {
    final radio = RadioListTile<Drink>(
      dense: true,
      groupValue: selectedSuggestion,
      // As this is not a suggested drink, the value representing it
      // is null.
      value: null,
      onChanged: (_) {
        if (onSelected != null) {
          onSelected();
        }
      },
      title: Text(titleText),
    );
    // If this radio is not selected, we shouldn't display the form.
    if (selectedSuggestion != null) {
      return radio;
    }
    return Column(
      children: <Widget>[
        radio,
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 4,
          ),
          child: _DrinkFormRow(
            caffeineInputController: caffeineInputController,
            servingSizeInputController: servingSizeInputController,
            servingSizeLabelText: servingSizeLabelText,
            servingSizeSuffixText: servingSizeSuffixText,
            caffeineAmountLabelText: caffeineAmountLabelText,
            caffeineAmountSuffixText: caffeineAmountSuffixText,
            onInputChanged: onInputChanged,
          ),
        )
      ],
    );
  }
}

/// Row containing the serving size and caffeine amount input fields.
class _DrinkFormRow extends StatelessWidget {
  const _DrinkFormRow({
    Key key,
    this.caffeineInputController,
    this.servingSizeInputController,
    this.onInputChanged,
    this.servingSizeLabelText,
    this.servingSizeSuffixText,
    this.caffeineAmountLabelText,
    this.caffeineAmountSuffixText,
  }) : super(key: key);

  final TextEditingController caffeineInputController;
  final TextEditingController servingSizeInputController;
  final VoidCallback onInputChanged;
  final String servingSizeLabelText;
  final String servingSizeSuffixText;
  final String caffeineAmountLabelText;
  final String caffeineAmountSuffixText;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: DigitsTextField(
              controller: servingSizeInputController,
              labelText: servingSizeLabelText,
              suffixText: servingSizeSuffixText,
              onChanged: (_) {
                if (onInputChanged != null) {
                  onInputChanged();
                }
              },
              contentPadding: const EdgeInsets.all(0),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 3,
            child: DigitsTextField(
              controller: caffeineInputController,
              labelText: caffeineAmountLabelText,
              suffixText: caffeineAmountSuffixText,
              onChanged: (_) {
                if (onInputChanged != null) {
                  onInputChanged();
                }
              },
              contentPadding: const EdgeInsets.all(0),
            ),
          ),
        ],
      );
}
