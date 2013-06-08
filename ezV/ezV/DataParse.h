//
//  DataParse.h
//  ProjectII
//
//  Created by Lampsea12 on 5/8/13.
//  Copyright (c) 2013 Lampsea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataParse : NSObject<NSURLConnectionDelegate,NSXMLParserDelegate>{
    BOOL isFinished;
//    BOOL isWaitResponse,isShow,onCreateIndicator;
//	int indicatorTimeCountDown;
//	NSTimer *indicatorTimer;
}


@property (nonatomic, retain) NSString *stringMessageData;
@property (assign, nonatomic) BOOL isFinished;
@property (retain, nonatomic) NSMutableData *webData;
@property (retain, nonatomic) NSXMLParser *xmlParser;
@property (retain, nonatomic) NSMutableString *nodeContent;
@property (retain, nonatomic) NSString *finaldata;

-(NSString*)getDataFromStringJSon:(NSString*)stringJSon andKey:(NSString *)key;
-(NSMutableArray*)getDataFromStringArrayJSon:(NSString*)stringJSon;
-(NSMutableArray *)getDataFromStringArrayJSonWithKey:(NSString*)stringJSon andKey:(NSString*)key;
-(NSMutableArray *)getArrayNSDictDataFromStringArrayJSonWithKey:(NSString*)stringJSon;
-(NSDictionary*)getNSDictDataFromStringJSon:(NSString*)stringJSon;

-(void)getNSDById;
-(void)getAllNSDByGroup;

-(void)addNSD:(NSString*)stringJSon;
-(void)addGroup:(NSString*)stringJSon;
-(void)addCashIn:(NSString*)stringJSon;
-(void)addCashOut:(NSString*)stringJSon;
-(void)addBorrow:(NSString*)stringJSon;
-(void)addDebt:(NSString*)stringJSon;
-(void)addTypeCashIn:(NSString*)stringJSon;
-(void)addTypeCashOut:(NSString*)stringJSon;
-(void)deleteGroup:(NSString*)stringJSon;
-(void)deleteUser:(NSString*)stringJSon;
-(void)deleteCashIn:(NSString*)stringJSon;
-(void)updateCashIn:(NSString*)stringJSon;
-(void)deleteCashOut:(NSString*)stringJSon;
-(void)updateCashOut:(NSString*)stringJSon;
-(void)deleteBorrow:(NSString*)stringJSon;
-(void)updateBorrow:(NSString*)stringJSon;
-(void)deleteDebt:(NSString*)stringJSon;
-(void)updateDebt:(NSString*)stringJSon;
-(void)deleteTypeCashIn:(NSString*)stringJSon;
-(void)updateTypeCashIn:(NSString*)stringJSon;
-(void)deleteTypeCashOut:(NSString*)stringJSon;
-(void)updateTypeCashOut:(NSString*)stringJSon;
-(void)getAllTypeCashIn:(NSString*)stringJSon;
-(void)getAllTypeCashOut:(NSString*)stringJSon;

-(NSString*)setDataToJson:(NSDictionary *)dict;
-(NSString*)setDataRegisterToJson:(NSString *)userName andNameSignin:(NSString*)nameSign andPass:(NSString*)pass andEmail:(NSString*)email andGroup:(int)idGroup;
-(NSString*)setDataSignInToJson:(NSString *)userName andPass:(NSString*)pass;
-(NSString*)setDataCashInToJson:(int)idNSD andidHt:(int)idHt andMon:(int)mon andTime:(NSString *)time andNote:(NSString*)note andName:(NSString *)name;
-(NSString*)setDataCashOutToJson:(int)idNSD andidHt:(int)idHt andMon:(int)mon andTime:(NSString *)time andNote:(NSString*)note andName:(NSString *)name;
-(NSString*)setDataBorrowToJson:(NSString*)name andMon:(int)mon andDateBor:(NSString *)dateBor andDatePay:(NSString*)datePay andRate:(float)rate andIDNSD:(int)idNSD;
-(NSString*)setDataDebtToJson:(NSString*)name andMon:(int)mon andDateDebt:(NSString *)dateDebt andDatePay:(NSString*)datePay andRate:(float)rate andIDNSD:(int)idNSD;
-(NSString*)setDataTypeCashInToJson:(NSString *)nameHT andIdNSD:(int)idNSD;
-(NSString*)setDataTypeCashOutToJson:(NSString *)nameHT andIdNSD:(int)idNSD;
-(NSString*)setDataEditTypeCashInToJSon:(NSString *)nameHT andIdNSD:(int)idNSD andIdHT:(int)idHT;
-(NSString*)setDataEditTypeCashOutToJSon:(NSString *)nameHT andIdNSD:(int)idNSD andIdHT:(int)idHT;
-(NSString*)setDataChooseDateViewToJson:(NSString *)stringDateStart andStringDateFinish:(NSString *)stringDateFinish andIDNSD:(int)idNSD;
-(NSString*)setDataDateCashInToJson:(NSString *)stringDate andIDNSD:(int)idNSD;
-(NSString*)setDataDateCashOutToJson:(NSString *)stringDate andIDNSD:(int)idNSD;
-(NSString*)setDataMakeNewGroupToJSon:(NSString*)nameGroup;
-(NSString*)setDataEditCashInToJSon:(NSString*)tenKhoanThu andNgayThu:(NSString *)ngayThu andGhiChu:(NSString *)ghiChu andSoTien:(int)mon andIDNSD:(int)idNSD andIDHT:(int)idHT andIdThu:(int)idThu;
-(NSString*)setDataEditCashOutToJSon:(NSString*)tenKhoanChi andNgayChi:(NSString *)ngayChi andGhiChu:(NSString *)ghiChu andSoTien:(int)mon andIDNSD:(int)idNSD andIDHT:(int)idHT andIdChi:(int)idChi;
-(NSString *)setDataEditDebtToJSon:(int)idNo andIDNSD:(int)idNSD andNguoiNo:(NSString *)nguoiNo andSoTienNo:(int)sotienNo andLai:(float)lai andNgayNo:(NSString *)ngayNo andNgayTra:(NSString *)ngaytraNo;
-(NSString *)setDataEditBorrowToJSon:(int)idChovay andIDNSD:(int)idNSD andNguoiVay:(NSString *)nguoiVay andSoTienVay:(int)sotienVay andLai:(float)lai andNgayVay:(NSString *)ngayVay andNgayTra:(NSString *)ngayTra;

@end
