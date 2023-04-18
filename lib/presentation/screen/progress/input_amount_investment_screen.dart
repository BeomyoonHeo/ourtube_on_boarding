import 'package:flutter/material.dart';
import 'package:ourtube_onboarding_by_milo/app/resource/theme.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/investment_progress_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/widget/input_amount_text_field.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/widget/progress_page_scaffold.dart';
import 'package:ourtube_onboarding_by_milo/utils/format.dart';

/*BaseScreen이 상속받고 있는 GetView를 통해 원하는 컨트롤러를 호출하여 의존 시킨다.
의존코드는 AppBindings를 통해 생성 및 주입한다.
 */
class InputAmountInvestmentScreen
    extends BaseScreen<InvestmentProgressViewModel> {
  const InputAmountInvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProgressPageScaffold(
      header: _header(),
      title: _title(),
      body: _body(),
    );
  }

  List<Widget> _header() {
    return [
      const SizedBox(height: 22),
      Text(
        '투자 금액을\n입력해주세요',
        style: headLine1Bold24.copyWith(
          color: const Color(0xFF141414),
        ),
      ),
      const SizedBox(height: 30),
    ];
  }

  List<Widget> _title() {
    return [
      Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color(0xFFF7F8FA),
          ),
          child: GestureDetector(
            onTap: vm.onTapAmount,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '보유 투자금 ',
                  style: body3medium13.copyWith(color: const Color(0xFF5C606B)),
                ),
                Text(
                  vm.amount.moneyFormat(addFormat: '원'),
                  style: body3medium13.copyWith(color: const Color(0xFF5C606B)),
                ),
              ],
            ),
          )),
    ];
  }

  List<Widget> _body() {
    FocusNode focusNode = FocusNode();
    return [
      InputAmountTextField(
          focusNode: focusNode,
          inputAmountValue: vm.inputAmountValue,
          errorMassage: vm.errorMassage,
          controller: vm.controller,
          onChanged: vm.inputtingAmount),
    ];
  }
}
