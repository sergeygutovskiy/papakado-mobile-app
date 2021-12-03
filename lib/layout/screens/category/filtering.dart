import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:papakado/store/actions/categories.dart';
import 'package:papakado/store/state.dart';

enum FilteringEnum {
    priceMinToMax,
    priceMaxToMin,
    discountFirst,
    discountLast,
}

class FilteringOption {
    final FilteringEnum value;
    final String label;

    FilteringOption({ required this.value, required this.label });
}

class FilterButton extends StatefulWidget {
    const FilterButton({ Key? key, required this.id }) : super(key: key);

    final int id;

    @override
    _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
    List<FilteringOption> options = [
        FilteringOption(value: FilteringEnum.priceMinToMax, label: 'Мин. стоиомсть'),
        FilteringOption(value: FilteringEnum.priceMaxToMin, label: 'Макс. стоиомсть'),
        FilteringOption(value: FilteringEnum.discountFirst, label: 'Со скидкой'),
        FilteringOption(value: FilteringEnum.discountLast, label: 'Без скидки'),
    ];

    FilteringOption? current;

    @override
    Widget build(BuildContext context) {
        return StoreConnector<StoreState, VoidCallback>(
            converter: (store) => () => store.dispatch(
                SortCategoryProductsAction(
                    store.state.categories.firstWhere((c) => c.id == widget.id).id, 
                    current!.value,
                )
            ),
            builder: (context, callback) => DropdownButton<FilteringOption>(
                value: current,
                elevation: 16,
                isExpanded: true,
                underline: Container(
                    height: 2,
                    color: Colors.grey[300],
                ),
                items: options
                    .map<DropdownMenuItem<FilteringOption>>((FilteringOption value) {
                    return DropdownMenuItem<FilteringOption>(
                        value: value,
                        child: Text(value.label),
                    );
                }).toList(),
                onChanged: (FilteringOption? newValue) {
                    setState(() {
                        current = newValue!;
                    });
                    callback();
                },
            )
        );
    }
}