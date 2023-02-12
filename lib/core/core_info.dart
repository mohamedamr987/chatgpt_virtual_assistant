// import 'package:get_storage/get_storage.dart';
// import 'package:medad_app/core/helpers/navigation_helper.dart';
// import 'package:medad_app/core/models/user_rule_model.dart';
// import 'package:medad_app/core/repo/company_customers_repo.dart';
// import 'package:medad_app/loginInPage/login_in_page_view.dart';
// import 'package:medad_app/main.dart';
// import 'package:medad_app/core/models/customer_model.dart';
// import 'models/supplier_company_model.dart';
// import 'models/user_model.dart';
// import 'repo/profile_repo.dart';
//
// class CoreInfo{
//   static UserModel? loggedUser;
//   static List<CustomerModel>? customers;
//   static List<SupplierCompanyModel>? suppliers;
//
//   static Future<void> init() async{
//     await ProfileRepo().getProfile();
//     if(loggedUser != null && (loggedUser!.userRoleModel is CompanyAdmin || (loggedUser!.userRoleModel is CompanyAdmin && loggedUser!.companyType=='customer') ||loggedUser!.userRoleModel is Finance || loggedUser!.userRoleModel is Driver )){
//       final companyRepo = CompanyRepo();
//       loggedUser!.companyId = await companyRepo.getCompanyId();
//       customers = await companyRepo.getCompanyCustomers();
//       suppliers = await companyRepo.getCompanySuppliers();
//     }
//   }
//
//   static bool isLogged(){
//     return GetStorage().hasData('userToken');
//   }
//
//   static Future<void> logOut() async{
//     GetStorage().remove('userToken');
//     NavigationHelper.pushUntil(navigatorKey.currentContext!, const LoginInPageView());
//   }
// }