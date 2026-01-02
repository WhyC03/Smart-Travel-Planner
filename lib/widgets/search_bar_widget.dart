import 'package:flutter/material.dart';
import '../../../core/constants/app_sizes.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String city) onSearch;

  const SearchBarWidget({
    super.key,
    required this.onSearch,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    final city = _controller.text.trim();
    if (city.isNotEmpty) {
      widget.onSearch(city);
      FocusScope.of(context).unfocus(); // hide keyboard
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textInputAction: TextInputAction.search,
      onSubmitted: (_) => _submit(),
      decoration: InputDecoration(
        hintText: "Search city (e.g. Delhi, Paris)",
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: _submit,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingMD,
          vertical: AppSizes.paddingSM,
        ),
      ),
    );
  }
}
