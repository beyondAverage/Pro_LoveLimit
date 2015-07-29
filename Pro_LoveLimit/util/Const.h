//
//  Const.h
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#ifndef Pro_LoveLimit_Const_h
#define Pro_LoveLimit_Const_h


//1.限免
#define kLimitUrl (@"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%ld")

//2.降价
#define kReduceUrl (@"http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=%ld")


//3.免费
#define kFreeUrl (@"http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=%ld")

//4.专题
//#define kSubjectUrl (@"http://iappfree.candou.com:8080/free/special?page=%ld&limit=5")
#define kSubjectUrl (@"http://1000phone.net:8088/app/iAppFree/api/topic.php?page=%ld&number=20")

//5.热榜
//#define kRankUrl (@"http://open.candou.com/mobile/hot/page/%ld")
#define kRankUrl (@"http://1000phone.net:8088/app/iAppFree/api/hot.php?page=%ld&number=20")


//搜索
#define kLimitSearchUrl (@"http://1000phone.net:8088/app/iAppFree/api/limited.php?page=%ld&number=20&search=%@")

#define KReduceSearchUrl (@"http://1000phone.net:8088/app/iAppFree/api/reduce.php?page=%ld&number=20&search=%@")

#define kFreeSearchUrl (@"http://1000phone.net:8088/app/iAppFree/api/free.php?page=%ld&number=20&search=%@")

#define kHotSearchUrl (@"http://1000phone.net:8088/app/iAppFree/api/hot.php?page=%ld&number=20&search=%@")


//详情
#define kDetailUrl (@"http://iappfree.candou.com:8080/free/applications/%@?currency=rmb")

//周边
#define kNearByUrl (@"http://iappfree.candou.com:8080/free/applications/recommend?longitude=116.344539&latitude=40.034346")


//分类
#define kCategoryLimitUrl (@"http://iappfree.candou.com:8080/free/categories/limited")
#define kCategoryReduceUrl (@"http://iappfree.candou.com:8080/free/categories/sales")
#define kCategoryFreeUrl (@"http://iappfree.candou.com:8080/free/categories/free")
#define kCategoryRankUrl (@"http://iappfree.candou.com:8080/free/categories/sales")




#endif
