//
//  ListViewController.m
//  Start
//
//  Created by 想当当 on 13-11-1.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import "ListViewController.h"



@interface ListViewController ()

@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    NSLog(@"loadView");
    //创建view
    //UIView *contentView = [[UIView alloc]initWithFrame: [[UIScreen mainScreen] applicationFrame]];
    //contentView.backgroundColor = [UIColor lightGrayColor];


    /*
    self.view = contentView;
    //创建label控件并作为subview添加到view
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 320, 30)];
    label.text = @"PureCode1";
    label.center = contentView.center;
    label.backgroundColor = [UIColor lightGrayColor];
    //label.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:label];
     */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //self.list = [NSArray arrayWithObjects:@"武汉",@"上海",@"北京",@"深圳",@"广州",@"重庆",@"香港",@"台海",@"天津", nil];
    
    self.list = @[@"武汉"
                  ,@"上海"
                  ,@"北京"
                  ,@"深圳"
                  ,@"广州"
                  ,@"重庆"
                  ,@"香港"
                  ,@"台海"
                  ,@"天津"];
    
    //self.dataList = self.list;
    //self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    //self.tableView = [[UITableView alloc]init];
    //self.tableView.dataSource = self;
    //self.tableView.delegate = self;
    //self.myTableView = tableView;
    //[self.view addSubview:self.tableView];
    self.navigationItem.title = @"列表";
    
    
    // 下拉刷新
    self.refresh = [[UIRefreshControl alloc]init];
    [self.refresh addTarget:self action:@selector(refreshedByPullingTable:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.refresh];
    
}

- (void)refreshedByPullingTable:(id)sender{
    [self.refresh beginRefreshing];
    //
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(),^(void){
        [self.refresh endRefreshing];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"GOOO");
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
