//
//  DataParse.m
//  ProjectII
//
//  Created by Lampsea12 on 5/8/13.
//  Copyright (c) 2013 Lampsea. All rights reserved.
//

#import "DataParse.h"
#import "JSONKit.h"

@implementation DataParse
@synthesize xmlParser;
@synthesize nodeContent;
@synthesize finaldata;
@synthesize webData;
@synthesize  stringMessageData = _stringMessageData;
@synthesize isFinished;

//Lay gia tri tu string json object voi mot key xac dinh
-(NSString *)getDataFromStringJSon:(NSString*)stringJSon andKey:(NSString *)key{
    NSDictionary *deserializedData = [stringJSon objectFromJSONString];
    NSString *string = [deserializedData objectForKey:key];
    return string;
}

//Lay cac object tu string mang json, tra ve mot mang cac object
-(NSMutableArray *)getDataFromStringArrayJSon:(NSString*)stringJSon{
    NSMutableArray *deserializedData = [stringJSon mutableObjectFromJSONString];
    return deserializedData;
}

//Lay gia tri tu string mang json, tra ve mang gia tri theo khoa lua chon
-(NSMutableArray *)getDataFromStringArrayJSonWithKey:(NSString*)stringJSon andKey:(NSString*)key{
    NSMutableArray *arryValue = [[NSMutableArray alloc]init];
    NSMutableArray *deserializedData = [stringJSon objectFromJSONString];
    for(int i = 0;i<[deserializedData count];i++){
        NSDictionary *tmp = [deserializedData objectAtIndex:i];
        NSString *string = [tmp objectForKey:key];
        [arryValue addObject:string];
    }
    return arryValue;
}
//Lay gia tri tu string mang json, tra ve mot mang cac doi tuong dang json luu duoi dang cac NSDICT
-(NSMutableArray *)getArrayNSDictDataFromStringArrayJSonWithKey:(NSString*)stringJSon{
    NSMutableArray *arryValue = [[NSMutableArray alloc]init];
    NSMutableArray *deserializedData = [stringJSon objectFromJSONString];
    for(int i = 0;i<[deserializedData count];i++){
        NSDictionary *tmp = [deserializedData objectAtIndex:i];
        [arryValue addObject:tmp];
    }
    return arryValue;
}

//Chuyen mot chuoi string json object sang thanh mot NSDICTIONARY
-(NSDictionary*)getNSDictDataFromStringJSon:(NSString*)stringJSon{
    NSDictionary *deserializedData = [stringJSon objectFromJSONString];
    return deserializedData;
}

/*
 *
 *
 CONVERT DATA TO STRING JSON
 *
 *
 *
*/

//CHUYEN DU LIEU DANG KI NGUOI SU DUNG SANG JSON
-(NSString*)setDataRegisterToJson:(NSString *)userName andNameSignin:(NSString*)nameSign andPass:(NSString*)pass andEmail:(NSString*)email andGroup:(int)idGroup{
    NSString *sdt = @"0936409080";
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:userName,@"nameNSD",nameSign,@"nameSignin",pass,@"pass",email,@"email",[NSNumber numberWithInt:idGroup],@"idGroup", sdt,@"sodienthoai",nil];
    string = [self setDataToJson:dictJson];
    return  string;
}

//CHUYEN DU LIEU DANG NHAP SANG JSON
-(NSString*)setDataSignInToJson:(NSString *)userName andPass:(NSString*)pass{
    NSString *string;
    NSArray *arrayObjects = [NSArray arrayWithObjects:userName,pass, nil];
    NSArray *arrayKeys    = [NSArray arrayWithObjects:@"nameSignin",@"pass", nil];
    
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjects:arrayObjects forKeys:arrayKeys];
    string = [self setDataToJson:dictJson];
    return string;
}

//CHUYEN DU LIEU THEM KHOAN THU SANG JSON
-(NSString*)setDataCashInToJson:(int)idNSD andidHt:(int)idHt andMon:(int)mon andTime:(NSString *)time andNote:(NSString*)note andName:(NSString *)name{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:idNSD],@"idNSD",[NSNumber numberWithInt:idHt],@"idHTThu",[NSNumber numberWithInt:mon],@"sotienThu",time,@"ngayThu",note,@"ghichu",name,@"chitietThu", nil];
    string = [self setDataToJson:dictJson];
    return  string;
}
//CHUYEN DU LIEU SUA DOI KHOAN THU SANG JSON
-(NSString *)setDataEditCashInToJSon:(NSString *)tenKhoanThu andNgayThu:(NSString *)ngayThu andGhiChu:(NSString *)ghiChu andSoTien:(int)mon andIDNSD:(int)idNSD andIDHT:(int)idHT andIdThu:(int)idThu{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:idNSD],@"idNSD",[NSNumber numberWithInt:idHT],@"idHTThu",[NSNumber numberWithInt:mon],@"sotienThu",ngayThu,@"ngayThu",ghiChu,@"ghichu",tenKhoanThu,@"chitietThu",[NSNumber numberWithInt:idThu],@"idThu", nil];
    string = [self setDataToJson:dictJson];
    return  string;
}


//CHUYEN DU LIEU THEM KHOAN CHI SANG JSON
-(NSString*)setDataCashOutToJson:(int)idNSD andidHt:(int)idHt andMon:(int)mon andTime:(NSString *)time andNote:(NSString*)note andName:(NSString *)name{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:idNSD],@"idNSD",[NSNumber numberWithInt:idHt],@"idHTChi",[NSNumber numberWithInt:mon],@"sotienChi",time,@"ngayChi",note,@"ghichu",name,@"chitietChi", nil];
    string = [self setDataToJson:dictJson];
    return  string;
}
//CHUYEN DU LIEU SUA KHOAN CHI SANG JSON
-(NSString *)setDataEditCashOutToJSon:(NSString *)tenKhoanChi andNgayChi:(NSString *)ngayChi andGhiChu:(NSString *)ghiChu andSoTien:(int)mon andIDNSD:(int)idNSD andIDHT:(int)idHT andIdChi:(int)idChi{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:idNSD],@"idNSD",[NSNumber numberWithInt:idHT],@"idHTChi",[NSNumber numberWithInt:mon],@"sotienChi",ngayChi,@"ngayChi",ghiChu,@"ghichu",tenKhoanChi,@"chitietChi",[NSNumber numberWithInt:idChi],@"idChi", nil];
    string = [self setDataToJson:dictJson];
    return  string;

}

//CHUYEN DU LIEU THEM KHOAN VAY SANG JSON
-(NSString*)setDataBorrowToJson:(NSString*)name andMon:(int)mon andDateBor:(NSString *)dateBor andDatePay:(NSString*)datePay andRate:(float)rate andIDNSD:(int)idNSD{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:name,@"nguoiVay",[NSNumber numberWithInt:mon],@"sotienVay",dateBor,@"ngayVay",datePay,@"ngayTra",[NSNumber numberWithFloat:rate],@"lai",[NSNumber numberWithInt:idNSD],@"idNSD", nil];
    string = [self setDataToJson:dictJson];
    return  string;
}
-(NSString*)setDataEditBorrowToJSon:(int)idChovay andIDNSD:(int)idNSD andNguoiVay:(NSString *)nguoiVay andSoTienVay:(int)sotienVay andLai:(float)lai andNgayVay:(NSString *)ngayVay andNgayTra:(NSString *)ngayTra{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:nguoiVay,@"nguoiVay",[NSNumber numberWithInt:sotienVay],@"sotienVay",ngayVay,@"ngayVay",ngayTra,@"ngayTra",[NSNumber numberWithFloat:lai],@"lai",[NSNumber numberWithInt:idNSD],@"idNSD",[NSNumber numberWithInt:idChovay],@"idChovay", nil];
    string = [self setDataToJson:dictJson];
    return  string;
}

//CHUYEN DU LIEU THEM KHOAN NO SANG JSON
-(NSString*)setDataDebtToJson:(NSString*)name andMon:(int)mon andDateDebt:(NSString *)dateDebt andDatePay:(NSString*)datePay andRate:(float)rate andIDNSD:(int)idNSD{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:name,@"nguoiNo",[NSNumber numberWithInt:mon],@"sotienNo",dateDebt,@"ngayNo",datePay,@"ngaytraNo",[NSNumber numberWithFloat:rate],@"lai",[NSNumber numberWithInt:idNSD],@"idNSD", nil];
    string = [self setDataToJson:dictJson];
    return  string;
}
-(NSString*)setDataEditDebtToJSon:(int)idNo andIDNSD:(int)idNSD andNguoiNo:(NSString *)nguoiNo andSoTienNo:(int)sotienNo andLai:(float)lai andNgayNo:(NSString *)ngayNo andNgayTra:(NSString *)ngaytraNo{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:nguoiNo,@"nguoiNo",[NSNumber numberWithInt:sotienNo],@"sotienNo",ngayNo,@"ngayNo",ngaytraNo,@"ngaytraNo",[NSNumber numberWithFloat:lai],@"lai",[NSNumber numberWithInt:idNSD],@"idNSD",[NSNumber numberWithInt: idNo],@"idNo", nil];
    string = [self setDataToJson:dictJson];
    return  string;
}

//CHUYEN DU LIEU THEM LOAI KHOAN THU SANG JSON
-(NSString*)setDataTypeCashInToJson:(NSString *)nameHT andIdNSD:(int)idNSD{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:nameHT, @"nameHT",[NSNumber numberWithInt:idNSD],@"idNSD",nil];
    string = [self setDataToJson:dictJson];
    return string;
}
//CHUYEN DU LIEU SUA LOAI KHOAN THU SANG JSON
-(NSString*)setDataEditTypeCashInToJSon:(NSString *)nameHT andIdNSD:(int)idNSD andIdHT:(int)idHT{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:nameHT, @"nameHT",[NSNumber numberWithInt:idNSD],@"idNSD",[NSNumber numberWithInt:idHT],@"idHTThu",nil];
    string = [self setDataToJson:dictJson];
    return string;
}

//CHUYEN DU LIEU SUA LOAI KHOAN CHI SANG JSON
-(NSString*)setDataEditTypeCashOutToJSon:(NSString *)nameHT andIdNSD:(int)idNSD andIdHT:(int)idHT{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:nameHT, @"nameHT",[NSNumber numberWithInt:idNSD],@"idNSD",[NSNumber numberWithInt:idHT],@"idHTChi",nil];
    string = [self setDataToJson:dictJson];
    return string;
}

//CHUYEN DU LIEU THEM LOAI KHOAN CHI SANG JSON
-(NSString*)setDataTypeCashOutToJson:(NSString *)nameHT andIdNSD:(int)idNSD{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:nameHT, @"nameHT",[NSNumber numberWithInt:idNSD],@"idNSD",nil];
    string = [self setDataToJson:dictJson];
    return  string;
}


//CHUYEN DU LIEU NGAY BAT DAU VA KET THUC TRONG VIEW SO THU CHI SANG JSON
-(NSString*)setDataChooseDateViewToJson:(NSString *)stringDateStart andStringDateFinish:(NSString *)stringDateFinish andIDNSD:(int)idNSD{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:stringDateStart, @"dateStart",stringDateFinish,@"dateEnd",[NSNumber numberWithInt:idNSD],@"idNSD",nil];
    string = [self setDataToJson:dictJson];
    return  string;
}
//CHUYEN DU LIEU LAY TONG TIEN THU THEO NGAY SANG JSON
-(NSString*)setDataDateCashInToJson:(NSString *)stringDate andIDNSD:(int)idNSD{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:stringDate, @"ngayThu",[NSNumber numberWithInt:idNSD],@"idNSD",nil];
    string = [self setDataToJson:dictJson];
    return  string;
}
//CHUYEN DU LIEU LAY TONG TIEN CHI THEO NGAY SANG JSON
-(NSString*)setDataDateCashOutToJson:(NSString *)stringDate andIDNSD:(int)idNSD{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:stringDate, @"ngayChi",[NSNumber numberWithInt:idNSD],@"idNSD",nil];
    string = [self setDataToJson:dictJson];
    return  string;
}

///CHUYEN DU LIEU TAO TEN NHOM MOI SANG JSON
-(NSString*)setDataMakeNewGroupToJSon:(NSString*)nameGroup{
    NSString *string;
    NSDictionary *dictJson = [NSDictionary dictionaryWithObjectsAndKeys:nameGroup, @"nameGroup",nil];
    string = [self setDataToJson:dictJson];
    return string;
}

//set Data to json to send request
-(NSString*)setDataToJson:(NSDictionary *)dict{
    NSString *jsonString;
    if([NSJSONSerialization isValidJSONObject:dict]){
        NSError *error = nil;
        NSData *result = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
        if(error == nil && result != nil){
            jsonString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        }
        else{
            NSLog(@"Got an error: %@", error);
            jsonString = @"ERROR";
        } 
    }
    NSLog(@"STRING JSON: %@",jsonString);
    return  jsonString;
}

@end
