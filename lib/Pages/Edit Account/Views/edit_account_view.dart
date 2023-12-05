import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/CommonWidgets/common_btn.dart';
import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/global_data_helper.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Pages/Edit%20Account/Bloc/edit_account_bloc.dart';
import 'package:dating_app/Pages/Edit%20Account/Bloc/edit_account_event.dart';
import 'package:dating_app/Pages/Edit%20Account/Bloc/edit_account_state.dart';
import 'package:dating_app/Pages/Edit%20Account/Model/edit_account_request_model.dart';
import 'package:dating_app/Pages/Edit%20Account/Widgets/edit_basic_widget.dart';
import 'package:dating_app/Pages/Edit%20Account/Widgets/edit_dob_widget.dart';
import 'package:dating_app/Pages/Edit%20Account/Widgets/edit_intrests_widget.dart';
import 'package:dating_app/Pages/Edit%20Account/Widgets/edit_photos_widget.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_birthday_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_gender_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_interests_widget.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/CommonWidgets/common_app_bar.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../screens/account/views/option_card_view.dart';

class EditAccountView extends StatefulWidget {
  const EditAccountView({super.key});

  @override
  State<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends State<EditAccountView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  List<dynamic> interests = [];
  List<String> interestList = [];
  List<String> options = [
    '💃 Dancing',
    '🎮 Gaming',
    '🎬 Movie',
    '🎵 Music',
    '🍀 Nature',
  ];

  List<String> myBasics = [
    '👩‍🎓 Student',
    '👱🏻‍♀️ Women',
    '👤 183 cm',
  ];
  EditAccountBloc? editAccountBloc;
  bool isLoading = false;
  UserDataModel? userDataModel;
  InterestResponseModel? interestResponseModel;
  String imageUrl = '';
  String? selectedGender;
  List<int> days = List<int>.generate(31, (index) => index + 1);
  List<int> months = List<int>.generate(12, (index) => index + 1);
  int? selectedDays;
  int? selectedMonth;
  List<String> yearList = [
    '1970',
    '1971',
    '1972',
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
  ];
  String? selectedYear;
  @override
  void initState() {
    editAccountBloc = context.read<EditAccountBloc>();
    editAccountBloc?.add(GetEditAccountData());
    userDataModel = UserDataModel();
    interestResponseModel = InterestResponseModel();
    super.initState();
  }

  setInitialValue() {
    nameController.text = userDataModel?.data?.fullName ?? "";
    phoneController.text = userDataModel?.data?.mobileNumber ?? "";
    bioController.text = userDataModel?.data?.about ?? "";
    genderController.text = userDataModel?.data?.gender ?? "";
    birthdayController.text = userDataModel?.data?.birthday ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  _buildUi() {
    return BlocBuilder<EditAccountBloc, EditAccountState>(
        builder: (context, currentState) {
      if (kDebugMode) {
        print(currentState);
      }
      if (currentState is EditAccountInitialState) {
      } else if (currentState is EditAccountLoadingState) {
        isLoading = true;
      } else if (currentState is EditAccountSuccessState) {
        isLoading = false;
        userDataModel = currentState.userDataModel;
        imageUrl = (currentState.userDataModel!.imageUrl!) +
            (currentState.userDataModel!.data!.image);
        interests = userDataModel?.data?.interests ?? [];
        setInitialValue();
        editAccountBloc?.add(GetInterestEvent());
      } else if (currentState is GetInterestSuccessState) {
        isLoading = false;
        interestResponseModel = currentState.interestResponseModel;
        editAccountBloc?.emit(EditAccountEmptyState());
      } else if (currentState is EditAccountErrorState) {
        isLoading = false;
        ToastHelper()
            .showErrorMsg(context: context, message: currentState.errorMessage);
      }
      return _buildMainUi();
    });
  }

  _buildMainUi() {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CommonAppBar(
          title: StringConstants.editProfile,
          onEdit: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const EditAccountView()),
            // );
          },
          onSetting: () {},
          editShow: false,
          settingShow: false,
          isBack: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: SizeConstants.profileAvatarRadius,
                      backgroundColor: ThemeConfiguration.cardShadowColor,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) => Image.asset(ImageConstants.accountIcon,height: 40,color: ColorConstant.primaryColor,),
                          errorWidget: (context, url, error) => Image.asset(
                            ImageConstants.accountIcon,
                            height: 40,
                            color: ColorConstant.primaryColor,
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: CircularProgressIndicator(
                        value: 0.8, // Provide the completion percentage here,
                        strokeWidth: 5,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          ThemeConfiguration.primaryColor,
                        ),
                        backgroundColor: ThemeConfiguration.greyColor.withOpacity(
                            0.5), // Background color of the progress indicator
                      ),
                    ),
                    const Positioned(
                        right: 0.0,
                        bottom: 5.0,
                        child: CircleAvatar(
                          radius: SizeConstants.profileAvatarEditRadius,
                          backgroundImage:
                              AssetImage(ImageConstants.profilePicEditButton),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: SizeConstants.maximumPadding,
              ),
              Padding(
                padding: const EdgeInsets.all(SizeConstants.maximumPadding),
                child: Row(
                  children: [
                    Image.asset(
                      ImageConstants.accountIcon,
                      height: 20,
                      width: 20,
                      color: ColorConstant.descriptiveColor,
                    ),
                    const SizedBox(
                      width: Constant.maximumPadding,
                    ),
                    const Text(
                      StringConstants.fullName,
                      style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(
                    SizeConstants.maximumPadding,
                    0,
                    SizeConstants.maximumPadding,
                    SizeConstants.maximumPadding,
                  ),
                  child: CommonWidgets.inputField(
                    context: context,
                    textFieldController: nameController,
                    hintText: StringConstants.editName,
                    textInputType: TextInputType.text,
                  )),
              Padding(
                padding: const EdgeInsets.all(SizeConstants.maximumPadding),
                child: Row(
                  children: [
                    Image.asset(
                      ImageConstants.callIcon,
                      height: 20,
                      width: 20,
                      color: ColorConstant.descriptiveColor,
                    ),
                    const SizedBox(
                      width: Constant.maximumPadding,
                    ),
                    const Text(
                      StringConstants.phoneNumberHint,
                      style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  SizeConstants.maximumPadding,
                  0,
                  SizeConstants.maximumPadding,
                  SizeConstants.maximumPadding,
                ),
                child: CommonWidgets.mobileNumberInputTextField(
                    flag: true,
                    context: context,
                    textFieldController: phoneController),
              ),
              Padding(
                padding: const EdgeInsets.all(SizeConstants.maximumPadding),
                child: Row(
                  children: [
                    Image.asset(
                      ImageConstants.accountEditIcon,
                      height: 20,
                      width: 20,
                      color: ColorConstant.descriptiveColor,
                    ),
                    const SizedBox(
                      width: Constant.maximumPadding,
                    ),
                    const Text(
                      StringConstants.yourBio,
                      style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    SizeConstants.maximumPadding,
                    0,
                    SizeConstants.maximumPadding,
                    SizeConstants.maximumPadding),
                child: CommonWidgets.bigInputField(
                  context: context,
                  textFieldController: bioController,
                  hintText: StringConstants.editBio,
                  textInputType: TextInputType.text,
                ),
              ),
              if(interests.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
                child: OptionCardView(
                  title: '',
                  isWidgetShow: true,
                  image: ImageConstants.heartIcon,
                  isShowEditIcon: true,
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditInterestWidget(
                                interestList: interestList,
                                interestResponseModel: interestResponseModel,
                              )),
                    ).then((value) {
                      setState(() {
                        interestList = value;
                        interestResponseModel?.data?.forEach((element) {
                          interestList?.forEach((e) {
                            if (e.toString() == element.id.toString()) {
                              interests.add(element);
                              // interests.forEach((ele) {
                              //   if (ele.id.toString() == e.toString()) {
                              //   } else {
                              //     interests.add(element);
                              //
                              //   }
                              // });
                            }
                          });
                        });
                      });
                    });
                  },
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        StringConstants.yourIntrest,
                        style: TextStyle(
                            color: ThemeConfiguration.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: SizeConstants.maximumPadding,
                      ),
                      GridView.builder(
                        itemCount: (interests ?? []).length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 3,
                                mainAxisSpacing: SizeConstants.mediumPadding,
                                crossAxisSpacing: SizeConstants.mediumPadding),
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                  color: ThemeConfiguration.primaryLightColor
                                      .withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(35.0),
                                  border: Border.all(
                                    color: ThemeConfiguration.primaryColor,
                                  )),
                              child: Center(
                                child: Text(
                                  interests?[index].intrest ?? '',
                                  style: const TextStyle(
                                      color:
                                          ThemeConfiguration.descriptiveColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(SizeConstants.maximumPadding),
                child: Row(
                  children: [
                    Image.asset(
                      ImageConstants.genderIcon,
                      height: 20,
                      width: 20,
                      color: ColorConstant.descriptiveColor,
                    ),
                    const SizedBox(
                      width: Constant.maximumPadding,
                    ),
                    const Text(
                      StringConstants.gender,
                      style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  SizeConstants.maximumPadding,
                  0,
                  SizeConstants.maximumPadding,
                  SizeConstants.maximumPadding,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SizeConstants.textFieldCardBorderRadius),
                    border: Border.all(width: 0.5, color: ThemeConfiguration.borderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true, // Ensure the dropdown fills the width of the container
                        value: selectedGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        },
                        hint:const Text('Select Gender',style: TextStyle(fontSize: 14),),
                        items: <String>['Male', 'Female', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(SizeConstants.maximumPadding),
                child: Row(
                  children: [
                    Image.asset(
                      ImageConstants.dobIcon,
                      height: 20,
                      width: 20,
                      color: ColorConstant.descriptiveColor,
                    ),
                    const SizedBox(
                      width: Constant.maximumPadding,
                    ),
                    const Text(
                      StringConstants.birthday,
                      style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              EditDobWidget(
                selectedDaysValue: selectedDays,
                selectedMonthValue: selectedMonth,
                selectedYearValue: selectedYear,
                yearList: yearList,
                isChangedDay: (int? newValue) {
                  setState(() {
                    selectedDays = newValue;
                  });
                },
                isChangedMonth: (newValue) {
                  setState(() {
                    selectedMonth = newValue;
                  });
                },
                isChangedYear: (newValue) {
                  setState(() {
                    selectedYear = newValue;
                  });
                },
              ),
              // Padding(
              //     padding: const EdgeInsets.fromLTRB(
              //       SizeConstants.maximumPadding,
              //       0,
              //       SizeConstants.maximumPadding,
              //       SizeConstants.maximumPadding,
              //     ),
              //     child: CommonWidgets.inputField(
              //       enabled: false,
              //       context: context,
              //       textFieldController: birthdayController,
              //       hintText: StringConstants.editBirthday,
              //       textInputType: TextInputType.text,
              //     )),

              // Padding(
              //   padding: const EdgeInsets.all(SizeConstants.maximumPadding),
              //   child: OptionCardView(
              //     title: '',
              //     isWidgetShow: true,
              //     image: ImageConstants.basicIcon,
              //     isShowEditIcon: true,
              //     onEdit: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const EditBasicWidget()),
              //       );
              //     },
              //     widget: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text(
              //           StringConstants.myBasic,
              //           style: TextStyle(
              //               color: ThemeConfiguration.descriptiveColor),
              //         ),
              //         const SizedBox(
              //           height: SizeConstants.mediumPadding,
              //         ),
              //         GridView.builder(
              //           itemCount: myBasics.length,
              //           shrinkWrap: true,
              //           physics: const NeverScrollableScrollPhysics(),
              //           gridDelegate:
              //               const SliverGridDelegateWithFixedCrossAxisCount(
              //                   crossAxisCount: 3,
              //                   childAspectRatio: 3,
              //                   mainAxisSpacing: SizeConstants.mediumPadding,
              //                   crossAxisSpacing: SizeConstants.mediumPadding),
              //           itemBuilder: (context, index) {
              //             return Center(
              //               child: Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 10.0, vertical: 5.0),
              //                 decoration: BoxDecoration(
              //                     color: ThemeConfiguration.primaryLightColor
              //                         .withOpacity(0.3),
              //                     borderRadius: BorderRadius.circular(35.0),
              //                     border: Border.all(
              //                       color: ThemeConfiguration.primaryColor,
              //                     )),
              //                 child: Center(
              //                   child: Text(
              //                     myBasics[index],
              //                     style: const TextStyle(
              //                         color:
              //                             ThemeConfiguration.descriptiveColor,
              //                         fontWeight: FontWeight.w500,
              //                         fontSize: 11),
              //                   ),
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(SizeConstants.maximumPadding),
              //   child: OptionCardView(
              //     title: '',
              //     isWidgetShow: true,
              //     image: ImageConstants.photoIcon,
              //     isShowEditIcon: true,
              //     onEdit: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const EditPhotosWidget()),
              //       );
              //     },
              //     widget: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text(
              //           StringConstants.photos,
              //           style: TextStyle(
              //               color: ThemeConfiguration.descriptiveColor),
              //         ),
              //         const SizedBox(
              //           height: SizeConstants.mediumPadding,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Expanded(
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                     border: Border.all(
              //                         color:
              //                             ThemeConfiguration.primaryLightColor),
              //                     borderRadius: BorderRadius.circular(15)),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(50.0),
              //                   child: InkWell(
              //                     child: Image.asset(
              //                         ImageConstants.galleryAddIcon),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(
              //               width: SizeConstants.mediumPadding,
              //             ),
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Container(
              //                   height: MediaQuery.of(context).size.width / 4.3,
              //                   width: MediaQuery.of(context).size.width / 4.3,
              //                   decoration: BoxDecoration(
              //                       border: Border.all(
              //                           color: ThemeConfiguration
              //                               .primaryLightColor),
              //                       borderRadius: BorderRadius.circular(15)),
              //                   child: InkWell(
              //                     // onTap: _pickImage,
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(35.0),
              //                       child: Image.asset(
              //                         ImageConstants.galleryAddIcon,
              //                         fit: BoxFit.fill,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 const SizedBox(
              //                   height: SizeConstants.mediumPadding,
              //                 ),
              //                 Container(
              //                   height: MediaQuery.of(context).size.width / 4.3,
              //                   width: MediaQuery.of(context).size.width / 4.3,
              //                   decoration: BoxDecoration(
              //                       border: Border.all(
              //                           color: ThemeConfiguration
              //                               .primaryLightColor),
              //                       borderRadius: BorderRadius.circular(15)),
              //                   child: InkWell(
              //                     // onTap: _pickImage,
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(35.0),
              //                       child: Image.asset(
              //                         ImageConstants.galleryAddIcon,
              //                         fit: BoxFit.fill,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: SizeConstants.mediumPadding,
              ),
              commonButton(
                onButtonTap: () {
                  setState(() {
                    GlobalDataHelper().editAccountRequestModel?.firstName =
                        nameController.text;
                    GlobalDataHelper().editAccountRequestModel?.lastName =
                        nameController.text;
                    GlobalDataHelper().editAccountRequestModel?.interest =
                        interestList.join(",");
                  });
                  print(GlobalDataHelper().editAccountRequestModel?.firstName);
                },
                context: context,
              ),
              const SizedBox(
                height: SizeConstants.maximumPadding +
                    SizeConstants.maximumPadding +
                    SizeConstants.maximumPadding,
              )
            ],
          )),
        ),
      ),
    );
  }
}
