import 'package:chatgpt_app/constants/constants.dart';
import 'package:chatgpt_app/models/models_model.dart';
import 'package:chatgpt_app/models/models_provider.dart';
import 'package:chatgpt_app/services/api_services.dart';
import 'package:chatgpt_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? currentModel;

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(
      context,
      listen: false,
    );
    currentModel = modelsProvider.getCurrentModel;

    return FutureBuilder<List<ModelsModel>>(
      future: modelsProvider.getAllModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: TextWidget(label: snapshot.error.toString()),
          );
        }
        return snapshot.data == null || snapshot.data!.isEmpty
            ? const SizedBox.shrink()
            : FittedBox(
                child: DropdownButton(
                  dropdownColor: scaffoldBackgroundColor,
                  iconEnabledColor: Colors.white,
                  items: List<DropdownMenuItem<String>>.generate(
                    snapshot.data!.length,
                    (index) => DropdownMenuItem(
                      value: snapshot.data![index].id,
                      child: TextWidget(
                        label: snapshot.data![index].id,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  value: currentModel,
                  onChanged: (value) {
                    setState(() {
                      currentModel = value.toString();
                    });
                    modelsProvider.setCurrentModel(value.toString());
                  },
                ),
              );
      },
    );
  }
}

/* 
DropdownButton(
      dropdownColor: scaffoldBackgroundColor,
      iconEnabledColor: Colors.white,
      items: getModelsItems,
      value: currentModel,
      onChanged: (value) {
        setState(() {
          currentModel = value.toString();
        });
      },
    );
 */