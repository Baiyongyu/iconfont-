# iconfont-
iconfont的使用

在开发项目时，为了适配不同分辨率的设备，我们通常会需要@2x，@3x两套格式的图片，最明显的就是底部tabBar的图标使用。而对于那些有换肤需求的APP来说，还需要多套图来匹配不同的主题。通过切图的方式制作图标，一方面加大了开发者和设计者的工作量，另一方面也会增大APP的体积。而使用iconfont的可以达到以下目的： 
    1、减小应用体积，字体文件比图片要小；
    2、图标保真缩放，解决2x/3x乃至将来nx图问题；
    3、方便更改图标颜色大小，图片复用。

那么，iconfont如何使用？iconfont，从字面上就能理解它就是字体。由于我是撸代码的，所以对iconfont的制作并不熟悉，再说这些都是UI做好了图标给我，如果想学习iconfont的制作，去阿里巴巴的iconfont平台去看看。制作好的iconfont图标是一种.ttf格式的字体，如图：
![iconfont图标就是一个ttf](http://upload-images.jianshu.io/upload_images/2381595-b7d1bd6b521c8dc4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

iconfont中的图标就是这幅德行：
![iconfont图标](http://upload-images.jianshu.io/upload_images/2381595-8cd72a2c208c2b11.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

而我们需要做的就是将.ttf格式的文件拖入工程中，然后借助淘点点科技写的一个关于iconfont封装，方便我们使用iconfont。（我demo中有，就不贴代码了。）

接下来就是重点了：
1>在AppDelegate.m中，初始化iconfont

```OC
#import "AppDelegate.h"
#import "TBCityIconFont.h" //引入头文件
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /** 初始化iconfont */
    [TBCityIconFont setFontName:@"iconfont"];

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    _window.rootViewController = nav;
    return YES;
}
```
2>在ViewController.m中实现
```OC
#import "ViewController.h"
#import "TBCityIconFont.h" //引入头文件
#import "UIImage+TBCityIconFont.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[ UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e619",22,[UIColor colorWithRed:0.55 green:0.55 blue:0.55 alpha:1])] style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonAction)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:0.55 green:0.55 blue:0.55 alpha:1];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e603",25, [UIColor colorWithRed:0.14 green:0.61 blue:0.83 alpha:1.00])] style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonAction)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:0.14 green:0.61 blue:0.83 alpha:1.00];
    
    // imageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 50, 30, 30)];
    [self.view addSubview:imageView];
    imageView.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e600", 30, [UIColor redColor])];
    // button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 40, 40);
    [self.view addSubview:button];
    [button setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e612", 40, [UIColor redColor])] forState:UIControlStateNormal];
    [button setTintColor:[UIColor greenColor]];
    // label,label可以将文字与图标结合一起，直接用label的text属性将图标显示出来
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 160, 280, 40)];
    [self.view addSubview:label];
    label.font = [UIFont fontWithName:@"iconfont" size:15];//设置label的字体
    label.text = @"这是用label显示的iconfont  \U0000e617";
}
```
3>运行结果如图：
![运行结果](http://upload-images.jianshu.io/upload_images/2381595-ad9df1ab56f63eb2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


如此，iconfont图标的使用就大功告成了。需要注意的是，iconfont图标用的是unicode编码，我们在工程中需要将&#xXXXX格式转换成\UXXXXXXXX格式,详细对照demo即可。
最后感谢 http://www.jianshu.com/p/3b10bb95b332 的分享。
