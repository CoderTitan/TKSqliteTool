//
//  TKViewController.m
//  TKSqliteTool
//
//  Created by CoderTitan on 09/05/2018.
//  Copyright (c) 2018 CoderTitan. All rights reserved.
//

#import "TKViewController.h"
#import "Student.h"
#import "TitanModelTool.h"
#import "TItanSQLiteTool.h"
#import "TitanModelSqliteTool.h"

@interface TKViewController ()

@end

@implementation TKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    NSString *str = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"%@", str);
}

- (void)testIvarNameType {
    NSString *dicStr = [TitanModelTool columnNamesAndTypesStr:[Student class]];
    NSLog(@"%@", dicStr);
}


/**
 测试是否可以正常执行sql语句
 */
- (void)testExample {
    // 创建表格的语句
    NSString *sql = @"create table if not exists Student(stuNum integer primary key autoincrement, name text not null, age integer, score real)";
    BOOL result = [TItanSQLiteTool deal:sql uid:nil];
    NSLog(@"%d", result);
}

- (void)testStudent {
    //删除所有记录
    NSString * delStr = @"delete from Student";
    BOOL deleteSql = [TItanSQLiteTool deal:delStr uid:nil];
    NSLog(@"%d", deleteSql);
    
    //添加记录
    NSString *insert = @"insert into Student(stuNum, name, age, score) values (1, 'sz', 18, 0)";
    BOOL res = [TItanSQLiteTool deal:insert uid:nil];
    NSLog(@"%d", res);
    
    //添加记录
    NSString *insert1 = @"insert into Student(stuNum, name, age, score) values (2, 'jun', 19, 90)";
    BOOL res1 = [TItanSQLiteTool deal:insert1 uid:nil];
    NSLog(@"%d", res1);
}



- (void)testQuery {
    //删除所有记录
    NSString * delStr = @"delete from student1";
    BOOL deleteSql = [TItanSQLiteTool deal:delStr uid:nil];
    NSLog(@"%d", deleteSql);
    
    
    //添加记录
    NSString *insert = @"insert into student1(id, name, age, score) values (1, 'sz', 18, 0)";
    BOOL res = [TItanSQLiteTool deal:insert uid:nil];
    NSLog(@"%d", res);
    
    //添加记录
    NSString *insert1 = @"insert into student1(id, name, age, score) values (2, 'jun', 19, 90)";
    BOOL res1 = [TItanSQLiteTool deal:insert1 uid:nil];
    NSLog(@"%d", res1);
    
    
    NSString *sql = @"select * from student1";
    NSMutableArray *result = [TItanSQLiteTool querySql:sql uid:nil];
    NSLog(@"%@", result);
    
}


- (void)testTable {
    //    Class clas = NSClassFromString(@"Student");
    //    BOOL res = [TitanModelSqliteTool createTable:clas uid:nil];
    //    XCTAssertEqual(res, YES);
    
    Class cls = NSClassFromString(@"Student");
    //    BOOL result = [TitanModelSqliteTool isTableRequiredUpdate:cls uid:nil];
    //    XCTAssertEqual(result, YES);
    
    BOOL res = [TitanModelSqliteTool updateTable:cls uid:nil];
    NSLog(@"%d", res);
}

@end
