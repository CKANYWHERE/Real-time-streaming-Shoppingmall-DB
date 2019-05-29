
drop table customer;
drop table product;
drop table orderProduct;
drop table streaming;
drop table streamingView;

create table customer(
  customerId char(20) primary key NOT NULL,
  password varchar(20) NOT NULL,
  name varchar(12)NOT NULL,
  phone varchar(17)NOT NULL,
  address varchar(60),
  birthDay date,
  sex varchar(1),
  willReceiveSms varchar(2),
  willReceiveEmail varchar(2),
  isKakaoLogin varchar(2)
); /*고객 테이블*/

create table product(
  productId char(20) primary key NOT NULL,
  productName varchar(30) NOT NULL,
  sellerName varchar(12) NOT NULL,
  price int NOT NULL,
  imgUrl varchar(100),
  productVolume varchar(20),
  productType varchar(20),
  isOnSale varchar(2),
  liked int default 0,
  isFreeDelivery varchar(2)
); /*물품 테이블*/

create table orderProduct(
  orderId char(20) primary key NOT NULL,
  customerId char(20) NOT NULL,
  productId char(20) NOT NULL,
  orderDate date NOT NULL,
  isDeliverd varchar(2) NOT NULL,
  willReturn varchar(2), /*반품 요청*/
  isReturned varchar(2),/*반품 여부*/
  deliveryCompany varchar(20),/*배송회사*/
  deliveryFee int,
  currentLocation varchar(30),/*물품 현재 위치*/
  foreign key(customerId) references customer(customerId),
  foreign key(productId) references product(productId)
); /*주문 테이블*/

create table streaming(
	streamingId char(20) primary key NOT NULL,
    streamingName varchar(50) NOT NULL,
    streamerName varchar(12)  NOT NULL,
    resolution varchar(12),/*해상도*/
    streamUri varchar(100) NOT NULL,
    streamQuality varchar(10) NOT NULL, /*화질*/
    bufferSize varchar(10)
);/*스트리밍 방송국 테이블*/

create table streamingView(
	streamingId char(20) NOT NULL,
    customerId char(20) NOT NULL,
    productId char(20) NOT NULL,
    startTime date NOT NULL,
    ip_address char(25) NOT NULL,
    foreign key(streamingId) references streaming(streamingId),
	foreign key(customerId) references customer(customerId),
	foreign key(productId) references product(productId),
    primary key(streamingId,customerId,productId)
);/*시청 테이블*/
SELECT SYSDATE FROM DUAL;


alter session set nls_timestamp_format = 'YYYY-MM-DD HH24:MI';
insert into customer(customerId, password, name, phone, address, sex, birthDay, willReceiveSms, willReceiveEmail,isKakaoLogin) 
values('janu723@naver.com','1234','민창경','01035577940','인천시 미추홀구 용현동 75-15','m',TO_DATE('1996-07-23','YYYY-MM-DD'),'n','n','y');
insert into customer(customerId, password, name, phone, address, sex, birthDay, willReceiveSms, willReceiveEmail,isKakaoLogin) 
values('imgroot@google.com','groot','홍길동','01055548795','대구광역시 중앙동 한성아파트 401호','m',TO_DATE('1985-05-23','YYYY-MM-DD'),'y','n','n');
insert into customer(customerId, password, name, phone, address, sex, birthDay, willReceiveSms, willReceiveEmail,isKakaoLogin) 
values('harmonie@naver.com','7894','권예진','01029153790','안산시 와동구 나는 아파트','w',TO_DATE('1995-12-07','YYYY-MM-DD'),'n','n','y');
insert into customer(customerId, password, name, phone, address, sex, birthDay, willReceiveSms, willReceiveEmail,isKakaoLogin) 
values('vustkd@google.com','4545','편상진','01048453984','포항시 북구 용흥동 우미삼성빌라 1304호','m',TO_DATE('1996-08-25','YYYY-MM-DD'),'y','y','n');
insert into customer(customerId, password, name, phone, address, sex, birthDay, willReceiveSms, willReceiveEmail,isKakaoLogin) 
values('hnyb0101@naver.com','717qwe1','김지은','01045477667','서울특별시 강남구 청담동 삼성아파트 2056호','w',TO_DATE('1967-01-01','YYYY-MM-DD'),'y','y','n');
insert into customer(customerId, password, name, phone, address, sex, birthDay, willReceiveSms, willReceiveEmail,isKakaoLogin) 
values('alsrudgnl@naver.com','855ssda','민경휘','01025897767','서울특별시 강남구 청담동 삼성아파트 2056호','m',TO_DATE('1968-03-23','YYYY-MM-DD'),'n','n','y');
insert into customer(customerId, password, name, phone, address, sex, birthDay, willReceiveSms, willReceiveEmail,isKakaoLogin) 
values('fjeifjei@hanmail.net','efdas712','김여진','01078921546','고양시 어딘가','w',TO_DATE('1997-09-17','YYYY-MM-DD'),'y','n','n');
insert into customer(customerId, password, name, phone, address, sex, birthDay, willReceiveSms, willReceiveEmail,isKakaoLogin) 
values('ddfefe@naver.com','789789','이순신','01078542385','신라시 왕궁 어딘가','m',TO_DATE('1901-04-23','YYYY-MM-DD'),'y','n','y');
insert into customer(customerId, password, name, phone, address, sex, birthDay, willReceiveSms, willReceiveEmail,isKakaoLogin) 
values('sinsa@naver.com','1234','신사임당','01055548333','조선시 왕궁 어딘가','w',TO_DATE('1902-07-13','YYYY-MM-DD'),'y','n','y');
insert into customer(customerId, password, name, phone, address, sex, birthDay, willReceiveSms, willReceiveEmail,isKakaoLogin) 
values('steev@naver.com','1234','스티븐','01088552264','미국 실리콘 벨리','m',TO_DATE('1970-11-15','YYYY-MM-DD'),'y','n','n');
SELECT * FROM CUSTOMER;

insert into product(productId,productName,price,imgUrl,productVolume,sellerName,productType,isOnSale,liked,isFreeDelivery) 
values('p100','에어팟 정품','200000','https://localhost:3000/airpods','50g','김지태','전자기기','n',150,'n');
insert into product(productId,productName,price,imgUrl,productVolume,sellerName,productType,isOnSale,liked,isFreeDelivery) 
values('p101','맛있는 가지 개꿀','1000','https://localhost:3000/gazi','1kg','전강룡','식품','y',0,'y');
insert into product(productId,productName,price,imgUrl,productVolume,sellerName,productType,isOnSale,liked,isFreeDelivery) 
values('p102','시디즈의자','380000','https://localhost:3000/sidiz','3kg','전의표','가구','y',53,'n');
insert into product(productId,productName,price,imgUrl,productVolume,sellerName,productType,isOnSale,liked,isFreeDelivery) 
values('p103','구찌신발','3580000','https://localhost:3000/guzzi','200g','김상오','의류','y',81,'y');
insert into product(productId,productName,price,productVolume,sellerName,productType,isOnSale,liked,isFreeDelivery) 
values('p104','청정한우','120000','500g','변동훈','식품','n',26,'y');
insert into product(productId,productName,price,imgUrl,sellerName,productType,isOnSale,liked,isFreeDelivery) 
values('p105','리빙홈 식기도구','28900','https://localhost:3000/livinghome','전의표','식기도구','n',12,'y');
insert into product(productId,productName,price,imgUrl,productVolume,sellerName,productType,isOnSale,liked,isFreeDelivery) 
values('p106','알레르망 이불','35800','https://localhost:3000/ebool','300g','김지태','가구','y',31,'n');
insert into product(productId,productName,price,imgUrl,productVolume,sellerName,productType,isOnSale,liked,isFreeDelivery) 
values('p107','RTX2080ti','1200000','https://localhost:3000/gtx2080','150g','김지태','전자기기','n',89,'y');
insert into product(productId,productName,price,imgUrl,productVolume,sellerName,productType,isOnSale,liked,isFreeDelivery)
 values('p108','맥북','315000','https://localhost:3000/macbook','100g','50g','전자기기','y',248,'y');
insert into product(productId,productName,price,imgUrl,productVolume,sellerName,productType,isOnSale,liked,isFreeDelivery) 
values('p109','뉴발란스 가방','70000','https://localhost:3000/newbalance','100g','김상오','의류','y',150,'y');
SELECT * FROM PRODUCT;
update product
set sellerName = '홍준기'
where sellerName = '50g';


insert into orderProduct(orderId,customerId,productId,orderdate,isDeliverd,willReturn,isReturned,deliveryCompany,deliveryFee,currentLocation)
values('o100','janu723@naver.com','p100','2018-07-30','y','y','n','우체국택배',2500,'대전HUB');
insert into orderProduct(orderId,customerId,productId,orderdate,isDeliverd,willReturn,isReturned,deliveryCompany,deliveryFee,currentLocation)
values('o101','vustkd@google.com','p105','2018-02-12','y','y','y','한진택배',2500,' 군포HUB');
insert into orderProduct(orderId,customerId,productId,orderdate,isDeliverd,willReturn,isReturned,deliveryCompany,deliveryFee,currentLocation)
values('o102','harmonie@naver.com','p100','2018-07-30','y','y','y','cj택배',2500,'가산콘솔HUB');
insert into orderProduct(orderId,customerId,productId,orderdate,isDeliverd,willReturn,isReturned,deliveryCompany,deliveryFee,currentLocation)
values('o103','steev@naver.com','p107','2019-08-23','n','y','n','한진택배',2500,'옥천HUB');
insert into orderProduct(orderId,customerId,productId,orderdate,isDeliverd,willReturn,isReturned,deliveryCompany,deliveryFee,currentLocation)
values('o104','janu723@naver.com','p108','2019-05-08','n','y','n','cj택배',2500,'대전HUB');
insert into orderProduct(orderId,customerId,productId,orderdate,isDeliverd,willReturn,isReturned,deliveryCompany,deliveryFee,currentLocation)
values('o105','hnyb0101@naver.com','p108','2019-03-13','y','y','n','cj택배',2500,'대전HUB');
insert into orderProduct(orderId,customerId,productId,orderdate,isDeliverd,willReturn,isReturned,deliveryCompany,deliveryFee,currentLocation)
values('o106','ddfefe@naver.com','p100','2018-07-30','y','n','n','현대로지엠',3000,'토평콘솔HUB');
insert into orderProduct(orderId,customerId,productId,orderdate,isDeliverd,willReturn,isReturned,deliveryCompany,deliveryFee,currentLocation)
values('o107','ddfefe@naver.com','p101','2018-07-30','n','n','n','현대로지엠',3000,'도척2CP');
insert into orderProduct(orderId,customerId,productId,orderdate,isDeliverd,willReturn,isReturned,deliveryCompany,deliveryFee,currentLocation)
values('o108','alsrudgnl@naver.com','p103','2018-11-25','n','n','n','한진택배',2500,'용인HUB');
insert into orderProduct(orderId,customerId,productId,orderdate,isDeliverd,willReturn,isReturned,deliveryCompany,deliveryFee,currentLocation)
values('o109','harmonie@naver.com','p109','2018-05-30','n','n','n','우체국택배',2500,'용인HUB');
SELECT * FROM orderProduct;

insert into streaming(streamingId,streamingName,streamerName,resolution,streamUri,streamQuality,bufferSize)
values('s100','두번다시 한국에서는 못볼 구찌 신발!','김상오','1080p','https://play.ko.stream/guzzi','2000k','1.5mb');
insert into streaming(streamingId,streamingName,streamerName,resolution,streamUri,streamQuality,bufferSize)
values('s101','2019 최신 맥북 프로 15인치','김지태','720p','https://play.ko.stream/macbook','3000k','3.2mb');
insert into streaming(streamingId,streamingName,streamerName,resolution,streamUri,streamQuality,bufferSize)
values('s102','굉장히 편리한 리빙홈 식기도구','전의표','1080p','https://play.ko.stream/livinghome','2500k','4.7mb');
insert into streaming(streamingId,streamingName,streamerName,resolution,streamUri,streamQuality,bufferSize)
values('s103','편안한 알레르망 이불','김지태','650p','https://play.ko.stream/ebool','3000k','1.7mb');
insert into streaming(streamingId,streamingName,streamerName,resolution,streamUri,streamQuality,bufferSize)
values('s104','더이상 좋은 그래픽카드는 없다 GTX2080','김지태','1080p','https://play.ko.stream/gtx2080','2300k','4.1mb');
insert into streaming(streamingId,streamingName,streamerName,resolution,streamUri,streamQuality,bufferSize)
values('s105','국산 청정한우!','전강룡','720p','https://play.ko.stream/hanu','3000k','4.5mb');
insert into streaming(streamingId,streamingName,streamerName,resolution,streamUri,streamQuality,bufferSize)
values('s106','이렇게 편할수 없는 시디즈 의자','전의표','650p','https://play.ko.stream/sidiz','2700k','3.5mb');
insert into streaming(streamingId,streamingName,streamerName,resolution,streamUri,streamQuality,bufferSize)
values('s107','신학기 맞이 뉴발란스 가방','김상오','1080p','https://play.ko.stream/newbalance','3000k','5.5mb');
SELECT * FROM streaming;

insert into streamingView(streamingId,customerId,productId,startTime,ip_address)
values('s104','janu723@naver.com','p107',TO_DATE('2019-05-15 15:30', 'YYYY-MM-DD HH24:MI'),'192.168.0.124');
insert into streamingView(streamingId,customerId,productId,startTime,ip_address)
values('s100','hnyb0101@naver.com','p103',TO_DATE('2019-05-15 12:16', 'YYYY-MM-DD HH24:MI'),'192.168.0.125');
insert into streamingView(streamingId,customerId,productId,startTime,ip_address)
values('s103','harmonie@naver.com','p106',TO_DATE('2019-05-15 14:26', 'YYYY-MM-DD HH24:MI'),'192.168.0.126');
insert into streamingView(streamingId,customerId,productId,startTime,ip_address)
values('s101','steev@naver.com','p108',TO_DATE('2019-05-15 09:57', 'YYYY-MM-DD HH24:MI'),'192.168.0.127');
insert into streamingView(streamingId,customerId,productId,startTime,ip_address)
values('s104','ddfefe@naver.com','p107',TO_DATE('2019-05-15 15:37', 'YYYY-MM-DD HH24:MI'),'192.168.0.128');
insert into streamingView(streamingId,customerId,productId,startTime,ip_address)
values('s106','fjeifjei@hanmail.net','p102',TO_DATE('2019-05-15 12:46', 'YYYY-MM-DD HH24:MI'),'192.168.0.129');
insert into streamingView(streamingId,customerId,productId,startTime,ip_address)
values('s104','vustkd@google.com','p107',TO_DATE('2019-05-15 17:23', 'YYYY-MM-DD HH24:MI'),'192.168.0.130');
insert into streamingView(streamingId,customerId,productId,startTime,ip_address)
values('s103','sinsa@naver.com','p106',TO_DATE('2019-05-15 15:30', 'YYYY-MM-DD HH24:MI'),'192.168.0.131');
insert into streamingView(streamingId,customerId,productId,startTime,ip_address)
values('s104','imgroot@google.com','p107',TO_DATE('2019-05-15 16:45', 'YYYY-MM-DD HH24:MI'),'192.168.0.132');
insert into streamingView(streamingId,customerId,productId,startTime,ip_address)
values('s101','imgroot@google.com','p108',TO_DATE('2019-05-15 20:31', 'YYYY-MM-DD HH24:MI'),'192.168.0.133');

select * from customer;
select * from product;
select * from orderProduct;
select * from streaming;
select * from streamingView;

/*1번 이메일 수신 동의한 사용자들의 id,이름,휴대폰번호 출력*/
select customerId,name,phone 
from customer
where willReceiveSms = 'y';

/*2번 상품을 교환하고 싶지만 아직 환불이 안된 사용자 id 출력*/
select customerId
from orderProduct
where willReturn = 'y' and isReturned = 'n';

/*3번 김씨인 사용자들의 id,이름,생일 출력*/
select customerId,name,birthDay
from customer
where name like '김%';

/*4번 반품요청 한 물품중에 배송회사가 우체국택배 일경우 택배회사 물품이름 출력*/
select deliveryCompany,productName
from product,orderProduct
where product.productId = orderProduct.productId and orderProduct.deliveryCompany='우체국택배' and willReturn = 'y';

select * from streamingView;
select * from product;
/*5번 현재 스트리밍 방송중에있는 사용자들이 몇명인지, 누구인지, 시청중인 유저는 몇개의 채널을 보고있는지 판매자들의 이름으로 정렬해서 보여주기*/
select 
 case grouping (customerId)
 when 1 then 'user count'
 else customerId end as customerId,
 case grouping(sellerName)
 when 1 then 'how many watches'
 else sellerName end as sellerName,
 count(*) "user"
 from streamingview,product
 where streamingview.productid = product.productid
 group by cube(sellerName,customerId);

/*6번 맥북 상품의 스트리밍을 보는 회원의 수 출력*/
select count(distinct customer.customerId)
from product,streamingView,customer
where product.productId = streamingView.productId 
and customer.customerId = streamingView.customerId
and product.productName = '맥북';

/*7번 제품종류별로 더한값 구하고 전체 가격 구하기*/
select productType,sum(price)
from product
group by Rollup(productType);

/*8번 스트리밍 방송중인 물품중에 좋아요수가 50개 이상인물품의 물품이름, 물품가격, 좋아요 수 출력*/
select productName,price,liked
from streamingView,product
where streamingView.productId = product.productId and liked >= 50;

/*9번 상품중에 이미지 가 없는 것을 출력*/
select * from product where imgUrl is null;

/*10번 RTX2080ti 제품의 스트리밍을 보고있는 회원들의 ip주소, 이름 출력*/
select customer.name,streamingView.ip_address
from streamingView,product,customer
where streamingView.productId = product.productId and streamingview.customerid = customer.customerId
and product.productName = 'RTX2080ti';

/*11번 구찌신발의 좋아요 갯수를 82개로 변경*/
update product
set liked = 82
where productName = '구찌신발';
select * from product where productName = '구찌신발';
rollback;

/*12번 맥북 제품의 스트리밍uri를 https://play.ko.stream/macbookpro로 변경*/
update streaming
set streamUri = 'https://play.ko.stream/macbookpro'
where streamingId = (select distinct streamingId from StreamingView where productId =(select productId from product where productName = '맥북'));
select * from product where productName = '맥북';
rollback;

/*13번 민창경 회원이 시킨 에어팟 정품 물품이 환불완료가 됬다고 표시*/
update orderProduct 
set isReturned = 'y'
where productId = (select productId from product where productName='에어팟 정품')
and customerId = (select customerId from customer where name='민창경');
select * from orderProduct where productId='p100' and customerID='janu723@naver.com';
rollback;

/*14번 이미지 주소가 없는 상품에 http://localhost:3000 을 넣어준다*/
update product
set imgUrl = 'http://localhost:3000'
where imgUrl is null;
select * from product;
rollback;
/*15번 스트리밍 방송중에 있는 맥북 물품들을 서울hub로 변경 */
update orderProduct
set currentLocation = '서울hub'
where (productId = (select distinct productId from streamingView where productId =(select productId from product where productName='맥북'))) ;
select * from orderProduct;
rollback;

/*16번 배송완료, 환불요청, 환불완료가 된 목록들은 삭제*/
delete from orderProduct
where isDeliverd='y' and willReturn='y' and isReturned = 'y';
select * from orderProduct;
rollback;

/*17번 물품 종류에 따라 좋아요한 수를 누적하여 출력*/
select productType, productName, liked
, sum(liked) over(partition by productType order by liked range unbounded preceding) as liked_sum
from product;

/*18번 물품주문에서 물품마다 물품의 현재 배송료가 500원 적거나 0 원 많은물품의 개수 출력*/
select productId, deliveryFee, Count(*) over(order by deliveryFee RANGE BETWEEN 500 PRECEDING and 0 FOLLOWING) AS DELIVERY_COUNT
FROM orderProduct;

/*19번 사용자가 구매한 물품이름, 물품아이디,물품배송현황 사용자 이름,아이디를 보여주는 view 생성 */
create or replace view trackingService_vw as
 select c.customerId,c.name,p.productId,p.productName,o.isDeliverd,o.willReturn,o.isReturned,o.currentlocation
 from customer c, orderProduct o, product p
 where c.customerId = o.customerId and p.productId = o.productId;
 select * from trackingService_vw;
 
 /*20번 사용자들이 보고있는 스트리밍 서비스의 스트림url,클라이언트ip주소,화질,해상도,버퍼사이즈 view 생성*/
 create or replace view currentStreamingStatus_vw as
 select streamUri,ip_address,resolution,streamQuality,bufferSize
 from streamingView,streaming
 where streamingView.streamingId = streaming.streamingId;
 select * from currentStreamingStatus_vw;
 
 /*21번 currentStreamingStatus_vw 에서 화질이 2700k 이하인 것을 삭제*/
 delete from currentStreamingStatus_vw
 where streamQuality <= '2700k';
 select * from currentStreamingStatus_vw;
 rollback;

 
 
 