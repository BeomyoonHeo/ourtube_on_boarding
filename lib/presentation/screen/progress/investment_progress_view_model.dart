import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/routes/app_routes.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/channel_repository.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/user_repository.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view_model.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/confirm_channel_info_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/confirm_investment_info_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/progress/input_amount_investment_screen.dart';
import 'package:ourtube_onboarding_by_milo/utils/format.dart';

/*
ViewModel에서는 해당 View에만 뿌리는 데이터만 들고있어야 하나...?
 */

class InvestmentProgressViewModel extends BaseViewModel {
  InvestmentProgressViewModel(
      {required this.amount,
      required this.controller,
      required this.channel,
      required this.channelRepository,
      required this.userRepository});

  //dependencies
  final int amount;
  final TextEditingController controller;
  final Rx<Channel> channel;
  final ChannelRepository channelRepository;
  final UserRepository userRepository;
  late final int inputAmount;

  //page Control 관련
  final List<Widget> pages = const [
    ConfirmChannelInfoScreen(),
    InputAmountInvestmentScreen(),
    ConfirmInvestmentInfoScreen(),
  ];
  final PageController pageController = PageController(initialPage: 0);
  final RxDouble currentPage = 0.0.obs;
  final RxBool isLastPage = false.obs;

  // 유저가 입력한 금액 로직 관련 필드
  final RxString inputAmountValue = ''.obs;
  final RxBool isOverAmount = false.obs;
  final RxBool isUnderAmount = false.obs;
  final RxString errorMassage = ''.obs;
  final RxBool isAvailable = false.obs;

  //총 수익금
  final RxInt totalRevenue = 0.obs;

  //광고 수익금
  final RxInt adRevenueOfChannel = 0.obs;

  //이전(1년전?) 채널의 가치
  final RxInt worthOfChannelBefore = 0.obs;

  //현재 채널의 가치
  final RxInt worthOfChannel = 0.obs;

  //현재 투자중인 채널
  final Rxn<InvestingChannel> investingChannel = Rxn();

  //상세 투자 정보 페이지로 넘어가기 위한 State -> 상세투자정보의 State이다.
  final RxList<InvestingChannel> investingChannelList =
      <InvestingChannel>[].obs;

  Future<void> initializeExpectRevenue() async {
    //서버 통신 후 받아온 InvestingChannel을 가지고 초기화 진행
    investingChannel.value = await channelRepository.getInvestingChannel(
        channel.value.channelIndex, inputAmount);

    //view에선 int를 요구하는데 서버 반환값은 int이므로 round진행
    adRevenueOfChannel(investingChannel.value!.adRevenueOfChannel.round());

    worthOfChannel(investingChannel.value!.worthOfChannel.round());

    //view에선 int를 요구하는데 서버 반환값은 String이므로 int.parse 진행
    worthOfChannelBefore(
        int.parse(investingChannel.value!.worthOfChannelBefore));

    totalRevenue(investingChannel.value!.totalRevenue.round());

    //initialize가 끝났다면 서버에 해당 값을 저장 후 DetailInvestment의 State를 변경하기 위해 새로운 InvestingChannel List를 Return 받아오는 로직
    await putInvestingChannel();
  }

  Future<void> putInvestingChannel() async {
    await userRepository.investmentChannel(
        inputAmount, investingChannel.value!);
    investingChannelList(await userRepository.getUserInvestingChannelList());
  }

  void moveDetailInvestmentPage() {
    Get.offNamed(AppRoutes.detailInvestment, arguments: investingChannelList);
  }

  void onTapAmount() {
    //사용자가 보유 투자금을 눌렀을 때 해당 금액이 TextField에 입력되게 해주는 로직이다.
    controller.text = amount.moneyFormat();
    inputAmountValue(amount.moneyFormat());
    inputtingAmount(amount.moneyFormat());
  }

  void inputtingAmount(String value) {
    int? inputValue = value.moneyFormat();

    controller.selection = TextSelection.fromPosition(TextPosition(
        offset: controller
            .value.text.length)); // Text의 offset(cursor ?)이 항상 맨 뒤에있게 해준다.
    if (controller.text == '0' || controller.text == '') {
      //입력된 값이 0이거나 사용자가 텍스트를 모두 지웠을때 초기 placeholder값을 보여주기 위한 분기이다.
      controller.clear();
      isOverAmount(false);
      isUnderAmount(false);
      isAvailable(false);
    } else if (inputValue! > amount) {
      // 입력된 값이 사용자가 가지고 있는 금액보다 클 경우 에러 메세지를 띄우기 위한 분기이다.
      isOverAmount(true);
      isUnderAmount(false);
      isAvailable(false);
    } else if (inputValue < 10000) {
      // 사용자가 금액을 입력하였을때 10000원 미만 일 경우 에러 메세지를 띄우기 위한 분기이다.
      isUnderAmount(true);
      isOverAmount(false);
      isAvailable(false);
    } else {
      //금액을 잘 입력했을 경우 투자하기 버튼을 활성화 하고 에러텍스트를 지우기 위한 분기이다.
      isOverAmount(false);
      isUnderAmount(false);
      isAvailable(true);
    }
    // 에러 텍스트는 사용자가 10000원 미만 또는 본인 소유 금액보다 큰 금액을 입력했을 경우 작동되도록 로직을 구성하였다.
    errorText(
        isOverAmount: isOverAmount.value, isUnderAmount: isUnderAmount.value);
    inputAmountValue(controller.text);
  }

  String errorText({required bool isOverAmount, required bool isUnderAmount}) {
    if (isOverAmount) {
      errorMassage('보유 투자 금액이 부족해요');
    } else if (isUnderAmount) {
      errorMassage('10,000원 이상 입금이 가능해요');
    } else {
      errorMassage('');
    }
    return errorMassage.value;
  }

  void nextPage(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (pageController.hasClients) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 100), curve: Curves.linear);
      currentPage(currentPage.value + 1);

      //페이지가 마지막 페이지 일 때 상단 뒤로가기 버튼과 api호출을 위한 메서드
      if (currentPage.value == 2) {
        inputAmount = controller.text.moneyFormat()!;
        await initializeExpectRevenue();
        isLastPage(true);
      }
    }
  }
}
