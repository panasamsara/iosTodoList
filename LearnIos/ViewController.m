//
//  ViewController.m
//  LearnIos
//
//  Created by 周书 on 2018/6/28.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "ViewController.h"
#import "ZSTableViewCell.h"

@interface ViewController()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *todoLists;
@property (weak, nonatomic) IBOutlet UITextField *addTodoInput;
@property (weak, nonatomic) IBOutlet UITableView *todoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _todoLists =[NSMutableArray array];
//    self.todoLists =[[NSMutableArray alloc] init];
   
    [self.todoView registerNib:[UINib nibWithNibName:@"ZSTableViewCell" bundle:nil] forCellReuseIdentifier:@"todoCell"];
    self.todoView.delegate = self;
    self.todoView.dataSource = self;
    
}
- (IBAction)add:(id)sender {
    [self.todoLists addObject:self.addTodoInput.text];
    NSLog(@"%@",_todoLists);
    self.addTodoInput.text = @"";
    
    [self.todoView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.todoLists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    ZSTableViewCell *cell = (ZSTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"todoCell"];
    ZSTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"todoCell" forIndexPath:indexPath];
    cell.textLabel.text = self.todoLists[indexPath.row];
    return cell;
    
}
// 滑动删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.todoLists removeObjectAtIndex:indexPath.row];
    [self.todoView reloadData];
}
-(NSMutableArray *)todoLists{
    if (!_todoLists) {
        _todoLists = [[NSMutableArray alloc] init];
    }
    return _todoLists;
}
@end
