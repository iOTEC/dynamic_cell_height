//
//  TableViewController.m
//  DynamicHeightCellExample
//
//  Created by Orange Chang on 2016/3/9.
//  Copyright © 2016年 iOTEC. All rights reserved.
//

#import "TableViewController.h"
#import "OldDynamicCell.h"
@interface TableViewController ()
{
    NSString *longString;
    OldDynamicCell *oldDynamicCellCache;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    longString=@"卻說玄德訪孔明兩次不遇，欲再往訪之。\n關公曰：「兄長兩次親往拜謁，其禮太過矣。想諸葛亮有虛名而無實學，故避而不敢見。兄何惑於斯人之甚也？」玄德曰：「不然。昔齊桓公欲見東郭野人，五反而方得一面。況吾欲見大賢耶？」張飛曰：「哥哥差矣。量此村夫，何足為大賢？今番不須哥哥去；他如不來，我只用一條麻繩縛將來！」玄德叱曰：「汝皆不聞周文王謁姜子牙之事乎？文王且如此敬賢，汝何太無禮！今番汝休去，我自與雲長去。」飛曰：「既兩位哥哥都去，小弟如何落後？」玄德曰：「汝若同往，不可失禮。」";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OldDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OldDynamicCell" forIndexPath:indexPath];
    [cell.txtView setFont:[UIFont systemFontOfSize:15]];
    [cell.txtView setText:longString];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(oldDynamicCellCache==nil)
        oldDynamicCellCache = [[OldDynamicCell alloc]init];
    oldDynamicCellCache.txtView= [[UITextView alloc]init];
    [oldDynamicCellCache.txtView setFont:[UIFont systemFontOfSize:15]];
    [oldDynamicCellCache.txtView setText:longString];

    CGSize estimateTextViewSize = [oldDynamicCellCache.txtView sizeThatFits:CGSizeMake(tableView.bounds.size.width-10, FLT_MAX)];
    return estimateTextViewSize.height;
}
@end
