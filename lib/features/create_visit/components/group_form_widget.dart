import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/dto/group_dto.dart';
import 'package:flutter/services.dart';

class GroupFormWidget extends StatefulWidget {
  const GroupFormWidget({super.key, required this.group, required this.onUpdateGroup, required this.onRemoveGroup});
  final GroupDTO group;
  final void Function(GroupDTO group) onUpdateGroup;
  final void Function(GroupDTO group) onRemoveGroup;
  @override
  State<GroupFormWidget> createState() => _GroupFormWidgetState();
}

class _GroupFormWidgetState extends State<GroupFormWidget> {
  bool isOpen = false;
  final TextEditingController responsible = TextEditingController();
  final TextEditingController groupNumber = TextEditingController();
  final TextEditingController studies = TextEditingController();
  final TextEditingController publisherWithoutStudies = TextEditingController();
  final TextEditingController activePublishers = TextEditingController();
  final TextEditingController baptizedPublishers = TextEditingController();
  final TextEditingController notBaptizedPublishers = TextEditingController();
  final TextEditingController regularPioneers = TextEditingController();
  final TextEditingController auxiliaryPioneers = TextEditingController();
  final TextEditingController irregularPublishers = TextEditingController();
  final TextEditingController potentialPioneers = TextEditingController();
  final TextEditingController potentialElders = TextEditingController();
  final TextEditingController potentialMinisterialServants = TextEditingController();

  @override
  void initState() {
    super.initState();

    responsible.text = widget.group.responsible;
    groupNumber.text = widget.group.groupNumber.toString();
    studies.text = widget.group.studies.toString();
    publisherWithoutStudies.text = widget.group.publisherWithoutStudies.toString();
    activePublishers.text = widget.group.activePublishers.toString();
    baptizedPublishers.text = widget.group.baptizedPublishers.toString();
    notBaptizedPublishers.text = widget.group.notBaptizedPublishers.toString();
    regularPioneers.text = widget.group.regularPioneers.toString();
    auxiliaryPioneers.text = widget.group.auxiliaryPioneers.toString();
    irregularPublishers.text = _getValue(widget.group.irregularPublishers);
    potentialPioneers.text = _getValue(widget.group.potentialPioneers);
    potentialElders.text = _getValue(widget.group.potentialElders);
    potentialMinisterialServants.text = _getValue(widget.group.potentialMinisterialServants);
  }

  String _getValue(List<String> list) => list.isEmpty ? '' : list.reduce((value, element) => value + '\n' + element);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppCardTheme>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.x8),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: theme.inputBorderColor), borderRadius: BorderRadius.circular(AppSpacing.x8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.x8),
          child: Column(
            children: [
              InkWell(
                  onTap: () => setState(() => isOpen = !isOpen),
                  child: Container(
                    color: theme.backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.x8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTextTheme.titleMediumWidget(
                              AppLocalizations.of(context)!.groupFormWidgetFormGroup(widget.group.groupNumber.toString(), widget.group.responsible),
                              color: theme.textColor),
                          Icon(isOpen ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp, color: theme.textColor),
                        ],
                      ),
                    ),
                  )),
              if (isOpen)
                Column(
                  children: [
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.groupFormWidgetFormResponsibleLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormResponsibleHint,
                      controller: responsible,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(responsible: value))),
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.groupFormWidgetFormGroupNumberLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormGroupNumberHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: groupNumber,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(groupNumber: int.tryParse(value) ?? 0))),
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.groupFormWidgetFormStudiesLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormStudiesHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: studies,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(studies: int.tryParse(value) ?? 0))),
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.groupFormWidgetFormPublishersWithoutStudiesLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormPublishersWithoutStudiesHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: publisherWithoutStudies,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(publisherWithoutStudies: int.tryParse(value) ?? 0))),
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.groupFormWidgetFormActivePublishersLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormActivePublishersHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: activePublishers,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(activePublishers: int.tryParse(value) ?? 0))),
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.groupFormWidgetFormBaptizedPublishersLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormBaptizedPublishersHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: baptizedPublishers,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(baptizedPublishers: int.tryParse(value) ?? 0))),
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.groupFormWidgetFormNotBaptizedPublishersLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormNotBaptizedPublishersHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: notBaptizedPublishers,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(notBaptizedPublishers: int.tryParse(value) ?? 0))),
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.groupFormWidgetFormRegularPioneerLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormRegularPioneerHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: regularPioneers,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(regularPioneers: int.tryParse(value) ?? 0))),
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.groupFormWidgetFormAuxiliaryPioneerLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormAuxiliaryPioneerHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: auxiliaryPioneers,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(auxiliaryPioneers: int.tryParse(value) ?? 0))),
                    ),
                    InputListCountFormWidget(
                      displayCounter: true,
                      label: AppLocalizations.of(context)!.groupFormWidgetFormIrregularPublishersLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormIrregularPublishersHint,
                      controller: irregularPublishers,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(irregularPublishers: value.split('\n')))),
                    ),
                    InputListCountFormWidget(
                      displayCounter: true,
                      label: AppLocalizations.of(context)!.groupFormWidgetFormPotentialPioneersLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormPotentialPioneersHint,
                      controller: potentialPioneers,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(potentialPioneers: value.split('\n')))),
                    ),
                    InputListCountFormWidget(
                      displayCounter: true,
                      label: AppLocalizations.of(context)!.groupFormWidgetFormPotentialMinisterialServantLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormPotentialMinisterialServantHint,
                      controller: potentialMinisterialServants,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(potentialMinisterialServants: value.split('\n')))),
                    ),
                    InputListCountFormWidget(
                      displayCounter: true,
                      label: AppLocalizations.of(context)!.groupFormWidgetFormPotentialEldersLabel,
                      hintText: AppLocalizations.of(context)!.groupFormWidgetFormPotentialEldersHint,
                      controller: potentialElders,
                      onChanged: (value) => setState(() => widget.onUpdateGroup(widget.group.copyWith(potentialElders: value.split('\n')))),
                    ),
                    Container(
                        decoration: BoxDecoration(color: theme.backgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x8),
                          child: Divider(color: theme.inputBorderColor),
                        )),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(color: theme.backgroundColor),
                              child: TextButton(
                                onPressed: () => _showMyDialog(),
                                child: AppTextTheme.bodyMediumWidget(AppLocalizations.of(context)!.groupFormWidgetFormRemoveGroup, color: AppColors.error500),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AppDialog(
          title: AppLocalizations.of(context)!.groupFormWidgetDeleteConfirmRemoveThisGroup,
          verticalSizePercentage: 0.65,
          content: _DialogContent(group: widget.group, onRemoveGroup: widget.onRemoveGroup, onUpdateGroup: widget.onUpdateGroup)),
    );
  }
}

class _DialogContent extends StatefulWidget {
  const _DialogContent({required this.onUpdateGroup, required this.onRemoveGroup, required this.group});
  final GroupDTO group;
  final void Function(GroupDTO group) onUpdateGroup;
  final void Function(GroupDTO group) onRemoveGroup;
  @override
  State<_DialogContent> createState() => __DialogContentState();
}

class __DialogContentState extends State<_DialogContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x24, vertical: AppSpacing.x12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.groupFormWidgetDeleteGroupNo,
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.error400),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.groupFormWidgetDeleteGroupYes,
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.primary600),
                  ),
                  onPressed: () async {
                    if (context.mounted) Navigator.of(context).pop();
                    widget.onRemoveGroup(widget.group);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
