import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rehab/features/auth/data/models/auth_model.dart';
import 'package:rehab/features/auth/sub/sign_up/presentation/pages/sign_up_feature_widget.dart';
import 'package:rehab/features/auth/sub/login/presentation/pages/login_feature_widget.dart';

class AuthFeatureScreen extends HookWidget {
  const AuthFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);

    final dataSource = useMemoized(
      () => AuthRemoteDataSource(Supabase.instance.client),
    );

    final authStatus = useState<AuthModel?>(null);
    final loading = useState(true);

    useEffect(() {
      Future(() async {
        final result = await dataSource.checkStatus();
        authStatus.value = result;

        if (result.isLogin) {
          tabController.index = 1; // Login
        } else {
          tabController.index = 0; // SignUp
        }

        loading.value = false;
      });

      return null;
    }, []);

    if (loading.value) {
      return const Scaffold(body: Center(child: LoadingWidget()));
    }

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Container(
            height: 23.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(40),
            ),
            child: SafeArea(
              child: AnyImageView(
                imagePath: "assets/images/logo_removebg.png",
                width: 60.sp,
                height: 60.sp,
                fit: BoxFit.cover,
                errorWidget: Icon(Icons.person, size: 30.sp),
              ),
            ),
          ),

          Gap(20.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withAlpha(50),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                dividerColor: Colors.transparent,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.black54,

                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                tabs: const [
                  Tab(text: 'إنشاء حساب'),
                  Tab(text: 'تسجيل دخول'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [SignUpFeatureScreen(), LoginFeatureScreen()],
            ),
          ),
        ],
      ),
    );
  }
}
