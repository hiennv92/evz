//
//  RegisterView.m
//  ProjectII
//
//  Created by Lion User on 09/05/2013.
//  Copyright (c) 2013 Lampsea. All rights reserved.
//

#import "RegisterView.h"
#import "AppDelegate.h"
#import "MenuView.h"

@interface RegisterView (){
    AppDelegate *myApp;
    DataParse *parserData;
}

@end

@implementation RegisterView
@synthesize fieldName;
@synthesize fieldPass;
@synthesize fieldEmail;
@synthesize fieldRepass;
@synthesize fieldNameSignin;

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
    parserData = [[DataParse alloc]init];
    [super viewDidLoad];
    fieldName.tag = 1;
    fieldNameSignin.tag = 2;
    fieldPass.tag = 3;
    fieldRepass.tag = 4;
    fieldEmail.tag = 5;
    
    fieldName.placeholder = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_LABELNAME andChooseLanguages:myApp.chooseLanguage];
    fieldNameSignin.placeholder = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_LABELUSERNAME andChooseLanguages:myApp.chooseLanguage];
    fieldPass.placeholder = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_LABELPASS andChooseLanguages:myApp.chooseLanguage];
    fieldRepass.placeholder = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_LABELREPASS andChooseLanguages:myApp.chooseLanguage];
    fieldEmail.placeholder = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_LABELEMAIL andChooseLanguages:myApp.chooseLanguage];
    self.lbTitle.text = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_TITLE andChooseLanguages:myApp.chooseLanguage];
    self.lbName.text = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_LABELNAME andChooseLanguages:myApp.chooseLanguage];
    self.lbUserName.text = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_LABELUSERNAME andChooseLanguages:myApp.chooseLanguage];
    self.labelPass.text = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_LABELPASS andChooseLanguages:myApp.chooseLanguage];
    self.lbRepass.text = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_LABELREPASS andChooseLanguages:myApp.chooseLanguage];
    self.labelEmail.text = [GetDataLanguages GetStringForKey:DATA_REGISTERVIEW_LABELEMAIL andChooseLanguages:myApp.chooseLanguage];
    
    
    //Bien lua chon hien thi thay doi noi dung cac button trong view add group;
    switchButton = 1;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Lua chon thao tac khi ket thuc nhap du lieu vao mot field
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.tag == 4){
        self.signForm.center = CGPointMake(160, 195);
        [UIView animateWithDuration:0.5
                         animations:^{self.signForm.center = CGPointMake(160,238);}];
        [UIView beginAnimations:nil context:NULL];
        [UIView commitAnimations];
    }
    else if(textField.tag == 5){
        self.signForm.center = CGPointMake(160, 130);
        [UIView animateWithDuration:0.5
                         animations:^{self.signForm.center = CGPointMake(160,238);}];
        [UIView beginAnimations:nil context:NULL];
        [UIView commitAnimations];
    }
    [textField resignFirstResponder];
    return YES;
}

//Lua chon thao tac khi bat dat nhap du lieu vao cac field tuong ung
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(textField.tag == 4){
        self.signForm.center = CGPointMake(160, 238);
        [UIView animateWithDuration:0.5
                         animations:^{self.signForm.center = CGPointMake(160,195);}];
        [UIView beginAnimations:nil context:NULL];
        [UIView commitAnimations];
        return YES;
    }
    else if(textField.tag == 5){
        self.signForm.center = CGPointMake(160, 238);
        [UIView animateWithDuration:0.5
                         animations:^{self.signForm.center = CGPointMake(160,130);}];
        [UIView beginAnimations:nil context:NULL];
        [UIView commitAnimations];
        return YES;
    }
    else
        return YES;
}

/*
 *
//Kiem tra dinh dang cua Email nhap vao
 *
 *
*/ 
 - (BOOL)validateEmail:(NSString *)inputText {
    NSString *emailRegex = @"[A-Z0-9a-z][A-Z0-9a-z._%+-]*@[A-Za-z0-9][A-Za-z0-9.-]*\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    NSRange aRange;
    if([emailTest evaluateWithObject:inputText]) {
        aRange = [inputText rangeOfString:@"." options:NSBackwardsSearch range:NSMakeRange(0, [inputText length])];
        int indexOfDot = aRange.location;
        //NSLog(@"aRange.location:%d - %d",aRange.location, indexOfDot);
        if(aRange.location != NSNotFound) {
            NSString *topLevelDomain = [inputText substringFromIndex:indexOfDot];
            topLevelDomain = [topLevelDomain lowercaseString];
            //NSLog(@"topleveldomains:%@",topLevelDomain);
            NSSet *TLD;
            TLD = [NSSet setWithObjects:@".aero", @".asia", @".biz", @".cat", @".com", @".coop", @".edu", @".gov", @".info", @".int", @".jobs", @".mil", @".mobi", @".museum", @".name", @".net", @".org", @".pro", @".tel", @".travel", @".ac", @".ad", @".ae", @".af", @".ag", @".ai", @".al", @".am", @".an", @".ao", @".aq", @".ar", @".as", @".at", @".au", @".aw", @".ax", @".az", @".ba", @".bb", @".bd", @".be", @".bf", @".bg", @".bh", @".bi", @".bj", @".bm", @".bn", @".bo", @".br", @".bs", @".bt", @".bv", @".bw", @".by", @".bz", @".ca", @".cc", @".cd", @".cf", @".cg", @".ch", @".ci", @".ck", @".cl", @".cm", @".cn", @".co", @".cr", @".cu", @".cv", @".cx", @".cy", @".cz", @".de", @".dj", @".dk", @".dm", @".do", @".dz", @".ec", @".ee", @".eg", @".er", @".es", @".et", @".eu", @".fi", @".fj", @".fk", @".fm", @".fo", @".fr", @".ga", @".gb", @".gd", @".ge", @".gf", @".gg", @".gh", @".gi", @".gl", @".gm", @".gn", @".gp", @".gq", @".gr", @".gs", @".gt", @".gu", @".gw", @".gy", @".hk", @".hm", @".hn", @".hr", @".ht", @".hu", @".id", @".ie", @" No", @".il", @".im", @".in", @".io", @".iq", @".ir", @".is", @".it", @".je", @".jm", @".jo", @".jp", @".ke", @".kg", @".kh", @".ki", @".km", @".kn", @".kp", @".kr", @".kw", @".ky", @".kz", @".la", @".lb", @".lc", @".li", @".lk", @".lr", @".ls", @".lt", @".lu", @".lv", @".ly", @".ma", @".mc", @".md", @".me", @".mg", @".mh", @".mk", @".ml", @".mm", @".mn", @".mo", @".mp", @".mq", @".mr", @".ms", @".mt", @".mu", @".mv", @".mw", @".mx", @".my", @".mz", @".na", @".nc", @".ne", @".nf", @".ng", @".ni", @".nl", @".no", @".np", @".nr", @".nu", @".nz", @".om", @".pa", @".pe", @".pf", @".pg", @".ph", @".pk", @".pl", @".pm", @".pn", @".pr", @".ps", @".pt", @".pw", @".py", @".qa", @".re", @".ro", @".rs", @".ru", @".rw", @".sa", @".sb", @".sc", @".sd", @".se", @".sg", @".sh", @".si", @".sj", @".sk", @".sl", @".sm", @".sn", @".so", @".sr", @".st", @".su", @".sv", @".sy", @".sz", @".tc", @".td", @".tf", @".tg", @".th", @".tj", @".tk", @".tl", @".tm", @".tn", @".to", @".tp", @".tr", @".tt", @".tv", @".tw", @".tz", @".ua", @".ug", @".uk", @".us", @".uy", @".uz", @".va", @".vc", @".ve", @".vg", @".vi", @".vn", @".vu", @".wf", @".ws", @".ye", @".yt", @".za", @".zm", @".zw", nil];
            if(topLevelDomain != nil && ([TLD containsObject:topLevelDomain])) {
                //NSLog(@"TLD contains topLevelDomain:%@",topLevelDomain);
                return TRUE;
            }
            /*else {
             NSLog(@"TLD DOEST NOT contains topLevelDomain:%@",topLevelDomain);
             }*/
            
        }
    }
    return FALSE;
}

//Hoan tat viec dang ky tai khoan, neu du lieu nhap vao sai thi hien ra thong bao
- (IBAction)buttonFinish:(id)sender {
        
    if([[fieldName.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] <1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Bạn cần nhập tên có ít nhất 1 ký tự.\nTên không chứa khoảng trắng và ký tự đặc biệt" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    else if([[fieldNameSignin.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] <6)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Tên đăng nhập cần có ít nhất 6 ký tự.\nTên không chứa khoảng trắng và ký tự đặc biệt" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    else if([fieldPass.text length] <6)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Mật khẩu cần dài ít nhất 6 ký tự." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    else if (![fieldRepass.text isEqualToString:fieldPass.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Xác nhận mật khẩu sai, bạn hãy nhập lại." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    else if(![self validateEmail:fieldEmail.text]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Ban nhap khong dung email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    else{
        NSLog(@"DU LIEU HOP LE! GUI DU LIEU DEN SERVER");
    }
}


- (IBAction)buttonCancel:(id)sender {
    MenuView *menuView;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        menuView = [[MenuView alloc] initWithNibName:@"MenuView_ipad" bundle:[NSBundle mainBundle]];
    }
    else{
        menuView = [[MenuView alloc] initWithNibName:@"MenuView_iphone" bundle:[NSBundle mainBundle]];
    }
    [self presentModalViewController:menuView animated:YES];
}

- (void)viewDidUnload {
    [self setFieldName:nil];
    [self setFieldNameSignin:nil];
    [self setFieldPass:nil];
    [self setFieldRepass:nil];
    [self setFieldEmail:nil];
    [self setSignForm:nil];
    [self setLbTitle:nil];
    [self setLbName:nil];
    [self setLbUserName:nil];
    [self setLabelPass:nil];
    [self setLbRepass:nil];
    [self setLabelEmail:nil];
    [self setButtonCancel:nil];
    [self setButtonDone:nil];
    [super viewDidUnload];
}

@end
