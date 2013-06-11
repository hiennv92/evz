//
//  coursesViewController.m
//  ezV
//
//  Created by Duong on 6/11/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import "coursesViewController.h"
#import "AppDelegate.h"
#import "MenuView.h"

@interface coursesViewController (){
    AppDelegate *myApp;
}

@end

@implementation coursesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    myApp = (AppDelegate*)[UIApplication sharedApplication].delegate;    
    [self MakeLoginView];
    arrayOfCourses = [[NSMutableArray alloc]init];
    
    [arrayOfCourses addObject:@"Bai so 1: Bang chu cai"];
    [arrayOfCourses addObject:@"Bai so 2: Cac van, am"];
    [arrayOfCourses addObject:@"Bai so 3: Cach dat cau"];
    [arrayOfCourses addObject:@"Bai so 4: Nguyen am, phu am"];
    [arrayOfCourses addObject:@"Bai so 5: Chu ngu, vi ngu"];
    [arrayOfCourses addObject:@"Bai so 6: Cach phat am"];
    [arrayOfCourses addObject:@"Bai so 7: Viet doan van"];
    [arrayOfCourses addObject:@"Bai so 8: Viet bai van"];
    [arrayOfCourses addObject:@"Bai so 9: Van ta canh"];

    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//number of sections in tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

/*
 Neu lua chon them the loai o view nhan du lieu thi hien thi mot section la thu hoac chi con
 neu lua chon them the loai o view quan li the loai thi hien thi hai section ca thu lan chi
 */

//Number of rows in talbleview;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [arrayOfCourses  count];
    
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    static NSString *customCellIdentifier = @"CustomCellIdentifier";
    
    cell = [tableView dequeueReusableCellWithIdentifier:customCellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:customCellIdentifier];
    }
    cell.textLabel.text = [arrayOfCourses objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
}

/*  Lua chon cell tren table, gan gia tri cua cell cho stringCellChoosed
 thuc hien cho viec hien thi hoac chinh sua, xoa
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    stringCellChoosed = [arrayOfCourses objectAtIndex:indexPath.row];
    NSLog(@"Chon bai: %@",stringCellChoosed);
}


-(void) MakeLoginView
{
	if(lblPass == nil)
	{
		lblPass = [[UILabel alloc] init];
		[lblPass setBackgroundColor:[UIColor clearColor]];
		[lblPass setTextColor:[UIColor whiteColor]];
		[lblPass setText:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_LABEL_PASS_KEY]).language];
		[lblPass setFrame:F_LOGIN_LBL_PASS];
	}
	if(lblRemember == nil)
	{
		lblRemember = [[UILabel alloc] init];
		[lblRemember setBackgroundColor:[UIColor clearColor]];
		[lblRemember setTextColor:[UIColor whiteColor]];
		[lblRemember setText:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_REMEMBER_KEY]).language];
         [lblRemember setFrame:F_LOGIN_LBL_REMEMBER];
	}
	if(lblName == nil)
	{
		lblName = [[UILabel alloc] init];
		[lblName setBackgroundColor:[UIColor clearColor]];
		[lblName setTextColor:[UIColor whiteColor]];
		[lblName setText:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_LABEL_USERNAME_KEY]).language];
		[lblName setFrame:F_LOGIN_LBL_NAME];
	}
	if(btnRemember==nil)
	{
		btnRemember = [[UIButton alloc] init];
		[btnRemember setFrame:F_LOGIN_REMEMBER_BUTTON];
		if([SettingManager GetAllowRememberAccountPermition])
			[btnRemember setBackgroundImage:[UIImage imageNamed:IMG_LOGIN_REMEMBER_CHECKED] forState:0];
		else
			[btnRemember setBackgroundImage:[UIImage imageNamed:IMG_LOGIN_REMEMBER_UNCHECKED] forState:0];
		[btnRemember addTarget:self action:@selector(OnLoginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	}
	if(txtfName == nil)
	{
		txtfName = [[UITextField alloc] init];
		[txtfName setBorderStyle:UITextBorderStyleRoundedRect];
		[txtfName setTextAlignment:UITextAlignmentCenter];
		txtfName.placeholder = ((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_LABEL_USERNAME_KEY]).language;
		txtfName.returnKeyType = UIReturnKeyDone;
		txtfName.delegate = self;
		[txtfName setFrame:F_LOGIN_TXTF_NAME];
	}
	if(txtfPass == nil)
	{
		txtfPass = [[UITextField alloc] init];
		[txtfPass setBorderStyle:UITextBorderStyleRoundedRect];
		[txtfPass setTextAlignment:UITextAlignmentCenter];
		txtfPass.placeholder = ((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_LABEL_PASS_KEY]).language;
		txtfPass.returnKeyType = UIReturnKeyDone;
		txtfPass.secureTextEntry = TRUE;
		txtfPass.delegate = self;
		[txtfPass setFrame:F_LOGIN_TXTF_PASS];
	}
    
	[lblName removeFromSuperview];
	[lblPass removeFromSuperview];
	[lblRemember removeFromSuperview];
	[txtfName removeFromSuperview];
	[txtfPass removeFromSuperview];
	[btnRemember removeFromSuperview];
	
	loginAlertView = [[UIAlertView alloc] initWithTitle:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_LOGIN_KEY]).language                                                  message:nil
                                    delegate:self
                                      cancelButtonTitle:((databaseList*)[myApp.arrayLanguage objectAtIndex:DATA_CACEL_KEY]).language
                                      otherButtonTitles:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_LOGIN_KEY]).language,((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_REGIST_KEY]).language,nil];
	loginAlertView.tag = LOGIN_LOGIN_ALERT_TAG;
    txtfName.tag = 1;
    txtfPass.tag = 2;
    
	[loginAlertView addSubview:lblName];
	[loginAlertView addSubview:txtfName];
	[loginAlertView addSubview:lblPass];
	[loginAlertView addSubview:txtfPass];
	[loginAlertView addSubview:btnRemember];
	[loginAlertView addSubview:lblRemember];
}


#pragma mark UIAlertView delegate
-(void) willPresentAlertView:(UIAlertView *)alertView
{
    if(alertView.tag == LOGIN_LOGIN_ALERT_TAG)
    {
        [alertView setFrame:F_LOGIN_ALERT];
		
        float ver = [[[UIDevice currentDevice] systemVersion] floatValue];
        NSLog(@"OS Version:  %f",ver);
        if(ver  < 5.0)
        {
            int i=0;
            
            for(UIView *v in alertView.subviews)
            {
                NSLog(@"CheckButton in alert: %@",[v class]);
                NSString *class = [NSString stringWithFormat:@"%@",[v class]];
                if([class isEqualToString:@"UIThreePartButton"])
                {
                    i++;
                    if(i==1)
                        [v setFrame:F_LOGIN_CLOSE_BUTTON];
                    else if(i==2)
                        [v setFrame:F_LOGIN_LOGIN_BUTTON];
                    else if(i==3)
                        [v setFrame:F_LOGIN_REGISTER_BUTTON];
                }
            }
        }
        else
        {
            int i=0;
            for(UIView *v in alertView.subviews)
            {
                if([v isKindOfClass:[UIButton class]])
                {
                    if(i==0)
                        [v setFrame:F_LOGIN_CLOSE_BUTTON];
                    else if(i==1)
                        [v setFrame:F_LOGIN_LOGIN_BUTTON];
                    else if(i==2)
                        [v setFrame:F_LOGIN_REGISTER_BUTTON];
                    i++;
                }
            }
        }
        
        if(myApp.userName == NULL){
            txtfName.text = @"lampsea";
            txtfPass.text = @"123456";
        }
        else{
            txtfName.text = myApp.userName;
            txtfPass.text = myApp.pass;
        }
    }
}


//Cac lua chon cho AlertView cua tung muc
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSInteger alertTag = alertView.tag;
    //Xoá thể loại trên bảng các thể loại thu chi
    if(alertTag == LOGIN_LOGIN_ALERT_TAG){
        if(buttonIndex == 1){
            int test1 = 0;
            int test2 = 0;
            
            for(int i = 0;i<[txtfName.text length];i++){
                if([txtfName.text characterAtIndex:i] == ' '){
                    test1 ++;
                }
            }
            
            for(int i = 0;i<[txtfPass.text length];i++){
                if([txtfPass.text characterAtIndex:i] == ' '){
                    test2 ++;
                }
            }
            
            if(txtfName.text == nil||test1 == [txtfName.text length]||txtfPass.text == nil || test2 == [txtfPass.text length]){
                NSLog(@"Nhap thieu du lieu:");
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Lỗi đăng nhập"
                                                                 message:@"Xin hãy điền đầy đủ thông tin tài khoản!"
                                                                delegate:self
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
                [alert show];
                alert.tag = LOGIN_LOGIN_REMIND_ALERT_TAG;
            }
            else{
                //                chooseActionAfterParserData = 0;
                [NSThread detachNewThreadSelector:@selector(ShowIndicator) toTarget:self withObject:nil];
                indicatorTimeCountDown = LOGIN_INDICATOR_SHOW_TIME;
                indicatorTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(IndicatorTimeCountDown) userInfo:nil repeats:YES];
                
                NSLog(@"User Name send: %@",txtfName.text);
                NSLog(@"Pass send: %@",txtfPass.text);
                DataParse *tmp = [[DataParse alloc]init];
                //                NSString *stringJson = [tmp setDataSignInToJson:txtfName.text andPass:txtfPass.text];
                //                [self checkLogIn:stringJson];
                [self getDataTest:txtfName.text andPass: txtfPass.text];
            }
        }
        else if(buttonIndex == 2){
            RegisterView *registerView = [[RegisterView alloc]initWithNibName:@"RegisterView" bundle:nil];
            [self presentModalViewController:registerView animated:YES];
        }
        else if(buttonIndex == 0){
            myApp.theFirst = NO;
        }
    }
    else if(alertTag == LOGIN_LOGIN_RESULT_FAIL_TAG){
        [loginAlertView show];
    }
    else if(alertTag == LOGIN_REGIST_ALERT_REMIND_TAG){
        
    }
    else if(alertTag == LOGIN_LOGIN_REMIND_ALERT_TAG){
        [loginAlertView show];
    }
}

-(void) OnLoginButtonClicked:(UIButton *)sender
{
	if(isWaitResponse) return;
    if(sender == btnRemember)
	{
        if([SettingManager GetAllowRememberAccountPermition])
        {
            [SettingManager SaveAllowRememberAccuntPermittion:FALSE];
            [btnRemember setBackgroundImage:[UIImage imageNamed:IMG_LOGIN_REMEMBER_UNCHECKED] forState:0];
        }
        else
        {
            [SettingManager SaveAllowRememberAccuntPermittion:TRUE];
            [btnRemember setBackgroundImage:[UIImage imageNamed:IMG_LOGIN_REMEMBER_CHECKED] forState:0];
        }
    }
}

- (IBAction)buttonBackMenu:(id)sender {
//    MenuView *menuView;
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        menuView = [[MenuView alloc] initWithNibName:@"MenuView_ipad" bundle:[NSBundle mainBundle]];
//    }
//    else{
//        menuView = [[MenuView alloc] initWithNibName:@"MenuView_iphone" bundle:[NSBundle mainBundle]];
//    }
//    [self presentModalViewController:menuView animated:YES];
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)buttonViewInfo:(id)sender {
    
}

- (IBAction)buttonChoose:(id)sender {
    [loginAlertView show];
}

-(void) ShowIndicator
{
    //	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    onCreateIndicator = TRUE;
	if(indicator == nil)
	{
		indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	}
	[indicator setFrame:CGRectMake(135, 215, 50, 50)];
	[self.view addSubview:indicator];
	[indicator startAnimating];
	onCreateIndicator = FALSE;
}
-(void) StopIndicator
{
    while (onCreateIndicator) ;
    
    if (indicator != nil)
	{
		[indicator removeFromSuperview];
		[indicator stopAnimating];
		indicator = nil;
	}
}
-(void) IndicatorTimeCountDown
{
	NSLog(@"IndicatorTimeCountDown still run %d",indicatorTimeCountDown);
	indicatorTimeCountDown--;
    isWaitResponse = TRUE;
	if(indicatorTimeCountDown ==0)
	{
		[self StopIndicator];
		[indicatorTimer invalidate];
		indicatorTimer = nil;
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Kết nối lỗi! Bạn vui lòng thử lại!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = LOGIN_LOGIN_RESULT_FAIL_TAG;
		[alert show];
        isWaitResponse = FALSE;
	}
}
-(void) StopIndicatorTimer
{
	if(indicatorTimer != nil)
	{
		if([indicatorTimer isValid])
		{
			[indicatorTimer invalidate];
			indicatorTimer = nil;
		}
	}
}


////////TESTWEBSERVICES///////////////////////
-(void)getDataTest:(NSString*) stringUsername andPass:(NSString*) stringPass{
    NSString *stringURL = [NSString stringWithFormat:@"http://easyvietnamese.com/ws/login?name=%@&pass=%@",stringUsername,stringPass];
    
    NSURL *urltest = [NSURL URLWithString:stringURL];
    
    ////////TEST WEBSERVICES///////////////////
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:
                        urltest];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    //////////////TEST WEBSERVICES////////////
}
- (void)fetchedData:(NSData *)responseData {
    [self StopIndicator];
    [self StopIndicatorTimer];
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray *arrayMess = [json objectForKey:@"msg"]; //2
    NSArray *arrayResult = [json objectForKey:@"result"];
    NSArray *arraySID = [json objectForKey:@"sid"];
    //    NSDictionary *mess = [arrayMess objectAtIndex:0];
    //    NSDictionary *result = [arryResult objectAtIndex:0];
    
    NSLog(@"Mess: %@",arrayMess);
    NSLog(@"result: %@", arrayResult);
    NSLog(@"Sid: %@", arraySID);
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [self setBackMenu:nil];
    [self setViewInfo:nil];
    [self setChoose:nil];
    [super viewDidUnload];
}
@end
