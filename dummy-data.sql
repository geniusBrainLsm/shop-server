DROP table category, user, merchandise, user_refresh_token;



create table category
(
    id          bigint       not null auto_increment,
    created_at  datetime(6),
    modified_at datetime(6),
    is_leaf     bit          not null,
    sequence    integer      not null,
    title       varchar(255) not null,
    parent_id   bigint,
    register_id bigint       not null,
    primary key (id)
) engine = InnoDB;
create table merchandise
(
    id                    bigint                                       not null auto_increment,
    created_at            datetime(6),
    modified_at           datetime(6),
    chat                  integer                                      not null,
    description           TEXT,
    image_urls            varchar(255),
    location              varchar(255)                                 not null,
    merchandise_state     enum ('AVERAGE','BAD','BROKEN','GOOD','NEW') not null,
    name                  varchar(255)                                 not null,
    negotiation_available bit                                          not null,
    price                 integer                                      not null,
    sale_state            enum ('RESERVED','SALE','SOLD')              not null,
    transaction_method    enum ('BOTH','DELIVERY','DIRECT')            not null,
    view                  integer                                      not null,
    wish                  integer                                      not null,
    category_id           bigint                                       not null,
    register_id           bigint                                       not null,
    primary key (id)
) engine = InnoDB;
create table user
(
    id             bigint not null auto_increment,
    created_at     datetime(6),
    modified_at    datetime(6),
    address        varchar(128),
    auth_provider  enum ('GOOGLE','KAKAO','NAVER','local'),
    dealing_count  integer,
    email          varchar(100),
    name           varchar(12),
    password       varchar(128),
    phone_number   varchar(15),
    profile_images varchar(512),
    reputation     integer,
    role           enum ('ADMIN','USER'),
    primary key (id)
) engine = InnoDB;
create table user_refresh_token
(
    refresh_token_seq bigint not null auto_increment,
    refresh_token     varchar(256),
    user_id           bigint not null,
    primary key (refresh_token_seq)
) engine = InnoDB;



INSERT INTO user (name, email, password, address, phone_number, dealing_count, reputation, role, auth_provider,
                  profile_images)
VALUES ('홍길동', 'hong@example.com', 'hashed_password', 'Seoul, Korea', '01012345678', 0, 30, 'USER', 'local',
        'profile_image_url');



INSERT INTO category (id, title, is_leaf, parent_id, register_id, sequence) VALUES
(1, '기타', true, NULL, 1, 1),
(2, '핸드폰', false, NULL, 1, 2),
(3, '노트북', true, NULL, 1, 3),
(4, '안드로이드', false, 2, 1, 1),
(5, '아이폰', false, 2, 1, 2),
(6, '삼성', false, 3, 1, 1),
(7, '애플', false, 3, 1, 2),
(8, 's9', true, 4, 1, 1),
(9, 's10', true, 4, 1, 2),
(10, 'iphone1', true, 5, 1, 1),
(11, 'iphone2', true, 5, 1, 2);



INSERT INTO merchandise (id, name, register_id, description, price, category_id, sale_state, merchandise_state,
                         image_urls, view, wish, chat, location, negotiation_available, transaction_method, created_at,
                         modified_at)
VALUES (1, '아이패드 9세대', 1, 'Apple <b>아이패드 9세대</b> WIFI 64G 스페이스 그레이 (MK2K3KH/A)', 400690, 1, 'SOLD', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_2928180/29281800623.20211020120244.jpg', 175, 25, 3, '서울 마포구 상암동',
        0, 'DELIVERY', '2024-10-25T13:18:23', '2024-10-25T13:18:23'),
       (2, '갤럭시 탭 S6', 1, '삼성전자 갤럭시탭 <b>갤럭시탭S6</b> 10.4 Lite WiFi 64G (SM-P610)', 359000, 1, 'SOLD', 'NEW',
        'https://shopping-phinf.pstatic.net/main_2228017/22280177621.20220905105531.jpg', 152, 23, 0, '서울 마포구 상암동',
        1, 'BOTH', '2024-10-26T01:36:17', '2024-10-26T01:36:17'),
       (3, '맥북 에어 M1', 1, 'Apple <b>맥북 에어</b> 2020년형 <b>M1</b> 256G 스페이스 그레이 (MGN63KH/A)', 1223090, 1, 'SALE', 'NEW',
        'https://shopping-phinf.pstatic.net/main_2610184/26101847522.20220705135838.jpg', 15, 0, 0, '서울 마포구 상암동',
        0, 'DELIVERY', '2024-11-07T12:42:04', '2024-11-07T12:42:04'),
       (4, '닌텐도 스위치', 1, '<b>닌텐도 스위치</b> OLED', 383950, 1, 'RESERVED', 'NEW',
        'https://shopping-phinf.pstatic.net/main_2921634/29216340620.20211013121846.jpg', 212, 18, 2, '서울 마포구 상암동',
        0, 'BOTH', '2024-10-18T06:59:52', '2024-10-18T06:59:52'),
       (5, 'PS5 디스크 에디션', 1, 'SIE <b>플레이스테이션 5 디스크에디션</b>', 683000, 1, 'SALE', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_2490382/24903820526.20201119111407.jpg', 176, 31, 6, '서울 마포구 상암동',
        1, 'DIRECT', '2024-10-21T03:36:05', '2024-10-21T03:36:05'),
       (6, '아이폰 13 Pro', 1, '<b>아이폰 13 프로</b> 256GB [자급제]', 2500000, 1, 'SOLD', 'BAD',
        'https://shopping-phinf.pstatic.net/main_2903049/29030492586.20220317112329.jpg', 247, 3, 0, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-11T01:24:03', '2024-10-11T01:24:03'),
       (7, '갤럭시 S21 울트라', 1, '삼성전자 <b>갤럭시S21울트라</b> 5G 256GB [자급제]', 1800000, 1, 'SALE', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_2560490/25604903523.20220629131955.jpg', 11, 0, 0, '서울 마포구 상암동',
        0, 'BOTH', '2024-10-28T01:49:14', '2024-10-28T01:49:14'),
       (8, 'LG 올레드 TV 55인치', 1, '<b>LG</b>전자 2024 <b>올레드</b> 4K 138cm (<b>OLED</b>55B4KNA)', 1281100, 1, 'RESERVED',
        'GOOD', 'https://shopping-phinf.pstatic.net/main_4713561/47135616618.20240417105013.jpg', 220, 62, 32,
        '서울 마포구 상암동', 0, 'DIRECT', '2024-10-17T21:37:23', '2024-10-17T21:37:23'),
       (9, '애플워치 시리즈 7', 1, '<b>애플워치 시리즈 7</b> (GPS + 셀룰러 45MM) 티타늄 실버 화이트 스포츠 밴드 포함 (갱신)', 445380, 1, 'SOLD',
        'AVERAGE', 'https://shopping-phinf.pstatic.net/main_4950535/49505355756.jpg', 181, 9, 4, '서울 마포구 상암동', 0,
        'DIRECT', '2024-10-12T07:44:56', '2024-10-12T07:44:56'),
       (10, '삼성 공기청정기', 1, '<b>삼성전자</b> 블루스카이 AX033B310GBD', 154800, 1, 'RESERVED', 'NEW',
        'https://shopping-phinf.pstatic.net/main_3142340/31423408618.20221026140801.jpg', 60, 1, 0, '서울 마포구 상암동',
        1, 'DELIVERY', '2024-11-04T08:56:36', '2024-11-04T08:56:36'),
       (11, '소니 WH-1000XM4 헤드폰', 1, '<b>소니 WH-1000XM4</b>', 315000, 1, 'SOLD', 'BAD',
        'https://shopping-phinf.pstatic.net/main_2380960/23809601528.20220106123038.jpg', 200, 19, 6, '서울 마포구 상암동',
        1, 'BOTH', '2024-10-29T08:41:09', '2024-10-29T08:41:09'),
       (12, '샤오미 로봇청소기', 1, '<b>샤오미 로봇 청소기</b> X20+자동 물걸레 올인원', 529000, 1, 'RESERVED', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_8799174/87991745365.6.jpg', 85, 5, 2, '서울 마포구 상암동', 1, 'DIRECT',
        '2024-10-21T05:13:49', '2024-10-21T05:13:49'),
       (13, '다이슨 V11 청소기', 1, '<b>다이슨 V11</b> 앱솔루트', 684000, 1, 'SOLD', 'BAD',
        'https://shopping-phinf.pstatic.net/main_3697404/36974047618.20230104142604.jpg', 192, 5, 0, '서울 마포구 상암동',
        0, 'BOTH', '2024-10-23T16:23:54', '2024-10-23T16:23:54'),
       (14, '브라운 면도기 시리즈 9', 1, '[BRAUN] <b>브라운</b> 전기<b>면도기 시리즈9</b> PRO Plus 세척&amp;충전스테이션 포함 모델(색상선택)', 399000, 1,
        'SOLD', 'GOOD', 'https://shopping-phinf.pstatic.net/main_8643258/86432583874.50.jpg', 86, 13, 8, '서울 마포구 상암동',
        1, 'BOTH', '2024-10-29T09:49:33', '2024-10-29T09:49:33'),
       (15, '에어팟 프로', 1, 'Apple <b>에어팟 프로</b> 2세대 (USB-C)', 253900, 1, 'RESERVED', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_4262072/42620727618.20230913151851.jpg', 10, 2, 0, '서울 마포구 상암동',
        1, 'BOTH', '2024-11-08T20:16:35', '2024-11-08T20:16:35'),
       (16, '버즈 프로', 1, '삼성전자 갤럭시 <b>버즈</b>2 <b>프로</b> SM-R510', 125260, 1, 'RESERVED', 'NEW',
        'https://shopping-phinf.pstatic.net/main_3410810/34108100618.20220816172630.jpg', 138, 11, 7, '서울 마포구 상암동',
        1, 'DIRECT', '2024-10-14T06:06:13', '2024-10-14T06:06:13'),
       (17, '로지텍 MX 마우스', 1, '<b>로지텍 MX</b> MASTER 3S', 110960, 1, 'RESERVED', 'NEW',
        'https://shopping-phinf.pstatic.net/main_3271369/32713692618.20220602150522.jpg', 191, 33, 11, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-23T04:22:39', '2024-10-23T04:22:39'),
       (18, '레노버 노트북 씽크패드', 1, '<b>씽크패드</b> <b>노트북</b> 폭탄가 <b>레노버</b> <b>씽크패드</b> 라이젠5 8G SSD256G 15형 윈도우10', 276000, 1,
        'SALE', 'BROKEN', 'https://shopping-phinf.pstatic.net/main_4599814/45998140062.8.jpg', 136, 14, 0, '서울 마포구 상암동',
        1, 'DIRECT', '2024-10-30T07:24:25', '2024-10-30T07:24:25'),
       (19, '캐논 EOS 200D 카메라', 1, '<b>캐논 EOS 200D</b> II', 389830, 1, 'SALE', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_1875097/18750979184.20190923150337.jpg', 51, 7, 0, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-31T06:21:06', '2024-10-31T06:21:06'),
       (20, '닌텐도 3DS XL', 1, '<b>닌텐도</b> 중고 <b>3DS</b> <b>3DS XL</b> 휴대용 게임기 <b>닌텐도</b>', 179100, 1, 'SALE', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_4542300/45423006666.1.jpg', 143, 13, 0, '서울 마포구 상암동', 1, 'BOTH',
        '2024-10-20T20:22:04', '2024-10-20T20:22:04'),
       (21, '삼성 무풍 에어컨', 1, '<b>삼성전자 무풍</b>클래식 AF17B7538TZRS', 1969000, 1, 'RESERVED', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_3191010/31910105621.20240527133520.jpg', 37, 4, 0, '서울 마포구 상암동',
        0, 'BOTH', '2024-11-01T20:51:44', '2024-11-01T20:51:44'),
       (22, '애플 매직 키보드', 1, '<b>Apple</b> 터치아이디 탑재 <b>매직 키보드</b> MK293KH/A', 170050, 1, 'SOLD', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_2842095/28420951555.20210813165850.jpg', 130, 8, 0, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-26T19:07:23', '2024-10-26T19:07:23'),
       (23, 'JBL 블루투스 스피커', 1, '삼성전자 <b>JBL</b> FLIP 6', 114900, 1, 'RESERVED', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_3155049/31550493618.20220406091409.jpg', 180, 3, 1, '서울 마포구 상암동',
        1, 'DIRECT', '2024-10-30T17:02:11', '2024-10-30T17:02:11'),
       (24, '레고 스타워즈 밀레니엄 팔콘', 1, '<b>레고 스타워즈 밀레니엄 팔콘</b> 75375', 92070, 1, 'SALE', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_4616821/46168210623.20240304155416.jpg', 238, 29, 6, '서울 마포구 상암동',
        0, 'BOTH', '2024-10-12T18:53:03', '2024-10-12T18:53:03'),
       (25, '한샘 책상 세트', 1, '<b>한샘</b> 티오 단독<b>책상세트</b> 5단 120cm', 289872, 1, 'RESERVED', 'BAD',
        'https://shopping-phinf.pstatic.net/main_4477970/44779706618.20231220160544.jpg', 54, 6, 0, '서울 마포구 상암동',
        1, 'BOTH', '2024-10-22T16:17:03', '2024-10-22T16:17:03'),
       (26, '삼성 전자레인지', 1, '<b>삼성전자</b> 비스포크 MG23T5018', 149000, 1, 'RESERVED', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_2315116/23151161490.20230615112157.jpg', 10, 0, 0, '서울 마포구 상암동',
        0, 'DELIVERY', '2024-11-09T13:00:49', '2024-11-09T13:00:49'),
       (27, '코닥 필름 카메라', 1, '<b>코닥</b> ULTRA F9', 46550, 1, 'SALE', 'BAD',
        'https://shopping-phinf.pstatic.net/main_2865274/28652747554.20210831101010.jpg', 187, 14, 5, '서울 마포구 상암동',
        1, 'DIRECT', '2024-10-29T17:25:37', '2024-10-29T17:25:37'),
       (28, '브라더 프린터', 1, '<b>브라더</b> 무한잉크 복합기 가정용<b>프린터기</b> 프린트 T426W', 199000, 1, 'SALE', 'BAD',
        'https://shopping-phinf.pstatic.net/main_8219702/82197025216.6.jpg', 133, 12, 5, '서울 마포구 상암동', 0,
        'DIRECT', '2024-10-27T02:26:54', '2024-10-27T02:26:54'),
       (29, '보스 블루투스 스피커', 1, 'BOSE 사운드링크 미니2 SE', 398000, 1, 'SALE', 'NEW',
        'https://shopping-phinf.pstatic.net/main_2170654/21706542030.20210421095515.jpg', 204, 3, 0, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-11T18:55:30', '2024-10-11T18:55:30'),
       (30, '아이패드 미니 6세대', 1, 'Apple <b>아이패드 미니 6세대</b> WIFI 64G 퍼플 (MK7R3KH/A)', 659990, 1, 'RESERVED', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_2928120/29281203630.20220705170122.jpg', 221, 55, 52, '서울 마포구 상암동',
        0, 'BOTH', '2024-10-13T12:10:53', '2024-10-13T12:10:53'),
       (31, '구글 픽셀 6', 1, '관부가세 포함 <b>Google Pixel 6</b> 128GB 언락 스마트폰 미국수입 - 언락, 북미판, 공기계', 319000, 1, 'RESERVED',
        'GOOD', 'https://shopping-phinf.pstatic.net/main_8625364/86253646178.jpg', 159, 49, 23, '서울 마포구 상암동', 0,
        'BOTH', '2024-10-13T23:16:47', '2024-10-13T23:16:47'),
       (32, 'MS 서피스 프로 7', 1, '<b>서피스프로7</b> 플러스 대여 렌탈 2in1 윈도우태블릿 21년 <b>MS</b> 사무용 인강용 임대', 8000, 1, 'RESERVED',
        'BROKEN', 'https://shopping-phinf.pstatic.net/main_8766917/87669170205.jpg', 202, 9, 5, '서울 마포구 상암동', 0,
        'DELIVERY', '2024-10-26T09:12:15', '2024-10-26T09:12:15'),
       (33, '라미 만년필', 1, '<b>LAMY</b> 사파리 <b>만년필</b> EF촉', 16200, 1, 'SALE', 'BAD',
        'https://shopping-phinf.pstatic.net/main_1185933/11859339924.20240910142305.jpg', 10, 1, 0, '서울 마포구 상암동',
        0, 'DIRECT', '2024-11-09T15:55:18', '2024-11-09T15:55:18'),
       (34, '필립스 커피머신', 1, '<b>필립스</b> <b>필립스</b>생활가전 1200 시리즈 라떼클래식 EP1224/03', 315890, 1, 'SALE', 'NEW',
        'https://shopping-phinf.pstatic.net/main_2608975/26089754525.20220523172917.jpg', 150, 18, 7, '서울 마포구 상암동',
        1, 'BOTH', '2024-10-31T14:28:30', '2024-10-31T14:28:30'),
       (35, '샤오미 전기스쿠터', 1, '<b>샤오미</b> Baicycle <b>전기</b> 자전거 <b>스쿠터</b> 전동 바이크 접이식 S1 12인치 화이트', 341910, 1,
        'RESERVED', 'BAD', 'https://shopping-phinf.pstatic.net/main_4903520/49035206101.jpg', 186, 12, 5, '서울 마포구 상암동',
        0, 'DELIVERY', '2024-10-24T17:12:05', '2024-10-24T17:12:05'),
       (36, 'LG 미니빔 프로젝터', 1, '<b>LG</b> 시네빔 PH550 <b>미니빔</b> 가정용 휴대용 <b>빔프로젝터</b> 단기 대여렌탈 방문수령/퀵발송전용', 20000, 1,
        'SALE', 'BAD', 'https://shopping-phinf.pstatic.net/main_8320047/83200476376.jpg', 185, 25, 8, '서울 마포구 상암동',
        0, 'DELIVERY', '2024-10-25T10:44:22', '2024-10-25T10:44:22'),
       (37, '카시오 전자계산기', 1, '<b>카시오 전자계산기</b> 데스크용 사무용 탁상용 MX-120B', 8670, 1, 'RESERVED', 'BAD',
        'https://shopping-phinf.pstatic.net/main_3088131/30881319454.20221224083913.jpg', 234, 42, 7, '서울 마포구 상암동',
        1, 'BOTH', '2024-10-18T06:16:21', '2024-10-18T06:16:21'),
       (38, '델 모니터 27인치', 1, '<b>DELL</b> UltraSharp U2718Q 4K UHD <b>27인치</b> <b>모니터</b>', 279000, 1, 'RESERVED',
        'AVERAGE', 'https://shopping-phinf.pstatic.net/main_5052872/50528723443.jpg', 27, 0, 0, '서울 마포구 상암동', 0,
        'DIRECT', '2024-11-05T12:14:16', '2024-11-05T12:14:16'),
       (39, '휴대용 외장하드 1TB', 1, '삼성전자 삼성 J3 <b>Portable</b> USB3.0', 99900, 1, 'RESERVED', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_1182634/11826344801.20240510111344.jpg', 204, 40, 11, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-21T19:55:39', '2024-10-21T19:55:39'),
       (40, '닌텐도 위 스포츠 세트', 1, '<b>닌텐도wii</b> 2인용<b>세트</b> 중고 +게임(<b>위스포츠</b>)', 149800, 1, 'RESERVED', 'BAD',
        'https://shopping-phinf.pstatic.net/main_3962216/39622166631.45.jpg', 148, 4, 0, '서울 마포구 상암동', 0,
        'DIRECT', '2024-10-27T10:35:18', '2024-10-27T10:35:18'),
       (41, '파나소닉 헤어드라이어', 1, '<b>파나소닉</b> EH-NA0J', 300390, 1, 'SALE', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_4538987/45389872618.20240122105411.jpg', 124, 18, 3, '서울 마포구 상암동',
        0, 'BOTH', '2024-10-21T18:59:24', '2024-10-21T18:59:24'),
       (42, '고프로 히어로 9', 1, '<b>고프로 HERO9</b> 블랙', 308700, 1, 'RESERVED', 'BAD',
        'https://shopping-phinf.pstatic.net/main_2419497/24194970525.20201021154529.jpg', 76, 2, 0, '서울 마포구 상암동',
        1, 'DIRECT', '2024-10-14T22:33:03', '2024-10-14T22:33:03'),
       (43, '티파니앤코 목걸이', 1, '<b>티파니앤코</b> <b>티파니 앤코</b> 리턴 투 더블 하트 <b>목걸이</b> 펜던트 미니 60014069 60014070', 368000, 1,
        'SOLD', 'NEW', 'https://shopping-phinf.pstatic.net/main_4496343/44963438856.20241107063904.jpg', 51, 2, 1,
        '서울 마포구 상암동', 1, 'BOTH', '2024-10-13T05:55:38', '2024-10-13T05:55:38'),
       (44, '빔프로젝터 M5', 1, '휴대용 미니 캠핌용 가정용 샤오미 <b>빔프로젝터</b> 광미 <b>M5</b> 마이크로폰 <b>프로젝터</b> 고화질 1', 589600, 1,
        'RESERVED', 'BROKEN', 'https://shopping-phinf.pstatic.net/main_8351793/83517935566.jpg', 42, 1, 0, '서울 마포구 상암동',
        1, 'DIRECT', '2024-10-21T02:49:26', '2024-10-21T02:49:26'),
       (45, '삼성 갤럭시 워치 4', 1, '<b>삼성전자</b> 갤럭시 <b>갤럭시워치4</b> 44mm SM-R870N (블루투스)', 218000, 1, 'RESERVED', 'BAD',
        'https://shopping-phinf.pstatic.net/main_2866987/28669873555.20220628135249.jpg', 127, 23, 10, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-22T02:55:37', '2024-10-22T02:55:37'),
       (46, '샤넬 향수 No.5', 1, '<b>샤넬</b> <b>No.5</b> 오 드 <b>퍼퓸</b>', 50000, 1, 'SOLD', 'NEW',
        'https://shopping-phinf.pstatic.net/main_4093320/4093320757.20191231182450.jpg', 114, 23, 17, '서울 마포구 상암동',
        0, 'DELIVERY', '2024-10-31T06:22:47', '2024-10-31T06:22:47'),
       (47, '보쉬 드릴 세트', 1, '<b>보쉬</b> 다목적 <b>드릴</b>비트<b>세트</b> Promo-X line 33pcs', 12490, 1, 'SALE', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_2928213/29282130619.20211018115120.jpg', 227, 39, 1, '서울 마포구 상암동',
        0, 'DELIVERY', '2024-10-25T15:42:03', '2024-10-25T15:42:03'),
       (48, '애플 펜슬 2세대', 1, 'Apple <b>애플 펜슬 2세대</b> (MU8F2KH/A)', 139500, 1, 'SOLD', 'BAD',
        'https://shopping-phinf.pstatic.net/main_1688020/16880202293.20200723140433.jpg', 72, 2, 1, '서울 마포구 상암동',
        1, 'DIRECT', '2024-11-05T17:57:17', '2024-11-05T17:57:17'),
       (49, '에어프라이어 스마트 XL', 1, 'Air Fryer Rack for Ninja Foodi FG551 Smart <b>XL</b> Indo', 36100, 1, 'SOLD', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_5087129/50871297003.1.jpg', 58, 3, 1, '서울 마포구 상암동', 1, 'DELIVERY',
        '2024-11-04T05:05:55', '2024-11-04T05:05:55'),
       (50, '라이카 M 카메라', 1, '<b>라이카</b> D-LUX 4', 679900, 1, 'RESERVED', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_4149763/4149763693.20130516095617.jpg', 49, 4, 0, '서울 마포구 상암동',
        0, 'DIRECT', '2024-11-05T11:53:46', '2024-11-05T11:53:46'),
       (51, '다이슨 헤어드라이어', 1, '<b>다이슨</b> 슈퍼소닉 HD15', 439910, 1, 'SALE', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_3838455/38384557618.20240731141802.jpg', 111, 19, 8, '서울 마포구 상암동',
        1, 'DELIVERY', '2024-10-24T20:06:55', '2024-10-24T20:06:55'),
       (52, '보스 헤드폰 700', 1, 'BOSE NC<b>700</b> <b>보스</b> 무선 노이즈캔슬링 블루투스 <b>헤드폰</b> - 블랙 정품', 449100, 1, 'SALE', 'BAD',
        'https://shopping-phinf.pstatic.net/main_8845252/88452523022.jpg', 90, 4, 0, '서울 마포구 상암동', 1, 'DIRECT',
        '2024-10-30T19:59:54', '2024-10-30T19:59:54'),
       (53, '닌텐도 라이트', 1, '<b>닌텐도</b> 중고 DS Lite <b>라이트</b> <b>닌텐도</b> 휴대용 게임기 국내판', 85410, 1, 'SALE', 'NEW',
        'https://shopping-phinf.pstatic.net/main_4569011/45690111455.1.jpg', 107, 8, 1, '서울 마포구 상암동', 0, 'BOTH',
        '2024-10-26T03:38:25', '2024-10-26T03:38:25'),
       (54, '일렉트로룩스 무선청소기', 1, '<b>일렉트로룩스</b> WQ61-1EDB', 178990, 1, 'SOLD', 'BAD',
        'https://shopping-phinf.pstatic.net/main_2393570/23935703522.20231129170535.jpg', 240, 15, 0, '서울 마포구 상암동',
        1, 'BOTH', '2024-10-23T22:57:45', '2024-10-23T22:57:45'),
       (55, '루이비통 핸드백', 1, '<b>루이비통</b>가방 여성토트백 몽테뉴 네버풀 루프호보백 <b>핸드백</b>', 2500000, 1, 'SOLD', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_8361048/83610484314.22.jpg', 96, 11, 5, '서울 마포구 상암동', 0,
        'DIRECT', '2024-10-29T07:04:02', '2024-10-29T07:04:02'),
       (56, '델 XPS 노트북', 1, '[리퍼] <b>DELL XPS</b>15 코어 i9 32GB NVME 1TB GTX 윈도우11', 949000, 1, 'SALE', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_5046523/50465235886.jpg', 88, 15, 8, '서울 마포구 상암동', 1, 'DELIVERY',
        '2024-10-23T17:47:03', '2024-10-23T17:47:03'),
       (57, '삼성 UHD TV 65인치', 1, '<b>삼성</b> <b>65인치</b> <b>TV</b> 65TU7000 <b>UHD</b> 4K 스마트<b>TV</b> (163cm) 매장방문수령',
        739000, 1, 'SALE', 'GOOD', 'https://shopping-phinf.pstatic.net/main_8754871/87548710511.jpg', 239, 40, 8,
        '서울 마포구 상암동', 0, 'DELIVERY', '2024-10-13T15:28:09', '2024-10-13T15:28:09'),
       (58, '로지텍 G PRO 키보드', 1, '로지텍 <b>로지텍G</b> G <b>PRO</b> 기계식 <b>키보드</b>', 95690, 1, 'SOLD', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_1130902/11309027577.20170406170657.jpg', 155, 20, 0, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-29T15:18:17', '2024-10-29T15:18:17'),
       (59, '오클리 선글라스', 1, '<b>오클리</b> 홀브룩 프리즘 편광 스포츠 <b>선글라스</b> 아시안핏 OO9244-2556', 99000, 1, 'SOLD', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_4854220/48542203858.20241106185951.jpg', 203, 29, 9, '서울 마포구 상암동',
        1, 'BOTH', '2024-10-19T01:10:50', '2024-10-19T01:10:50'),
       (60, '후지필름 미러리스 카메라', 1, '<b>후지필름</b> X-T30 II', 1600000, 1, 'SOLD', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_3469709/34697097618.20220915114441.jpg', 111, 23, 3, '서울 마포구 상암동',
        1, 'BOTH', '2024-10-21T21:44:42', '2024-10-21T21:44:42'),
       (61, '블랙앤데커 전동드릴', 1, '<b>블랙앤데커</b> 충전 <b>전동드릴</b> LD12SP', 41490, 1, 'SOLD', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_2846177/28461772560.20210817103041.jpg', 10, 0, 0, '서울 마포구 상암동',
        1, 'DIRECT', '2024-11-09T08:10:44', '2024-11-09T08:10:44'),
       (62, '미니 전기히터', 1, '코드26 PTC 사무실 가정용 캠핑용 <b>미니</b> 팬<b>히터</b> <b>전기 히터</b> 온풍기 발난로 1세대 온풍기 우드파우치', 27900, 1,
        'SOLD', 'NEW', 'https://shopping-phinf.pstatic.net/main_8220413/82204130859.6.jpg', 141, 5, 2, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-14T11:54:59', '2024-10-14T11:54:59'),
       (63, '구찌 지갑', 1, '[여주아울렛 제품 당일발송 백화점 AS] <b>구찌</b> 마이크로시마 남자<b>지갑</b> 반<b>지갑</b>', 397000, 1, 'RESERVED',
        'AVERAGE', 'https://shopping-phinf.pstatic.net/main_8179796/81797961786.1.jpg', 167, 5, 1, '서울 마포구 상암동', 1,
        'BOTH', '2024-10-31T18:46:16', '2024-10-31T18:46:16'),
       (64, '니콘 쿨픽스 카메라', 1, '[렌탈] <b>니콘 쿨픽스</b> s01 제니 지젤 정한 지수 정채연 연예인 <b>카메라</b> 디카 대여 렌트', 15000, 1, 'SOLD',
        'BROKEN', 'https://shopping-phinf.pstatic.net/main_8744059/87440592208.jpg', 25, 1, 0, '서울 마포구 상암동', 0,
        'DELIVERY', '2024-11-08T05:59:33', '2024-11-08T05:59:33'),
       (65, '뱅앤올룹슨 스피커', 1, '<b>뱅앤올룹슨</b> Beosound A9 5세대 스페셜 에디션 프리미엄', 4135190, 1, 'SOLD', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_4114756/41147562619.20230712151116.jpg', 183, 36, 14, '서울 마포구 상암동',
        0, 'BOTH', '2024-10-25T00:05:33', '2024-10-25T00:05:33'),
       (66, '에어팟 맥스', 1, 'Apple <b>에어팟 맥스</b>', 523000, 1, 'SALE', 'BAD',
        'https://shopping-phinf.pstatic.net/main_2541303/25413039524.20220321180928.jpg', 68, 11, 2, '서울 마포구 상암동',
        0, 'BOTH', '2024-11-01T13:53:21', '2024-11-01T13:53:21'),
       (67, 'HP 게이밍 모니터', 1, '<b>HP</b> OMEN 27 FHD', 240750, 1, 'RESERVED', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_3994527/39945270618.20230510143929.jpg', 33, 4, 0, '서울 마포구 상암동',
        1, 'DIRECT', '2024-11-05T04:30:20', '2024-11-05T04:30:20'),
       (68, '캐논 파워샷', 1, '<b>캐논 PowerShot</b> G7X Mark 2', 799000, 1, 'SALE', 'NEW',
        'https://shopping-phinf.pstatic.net/main_9721774/9721774188.20160719141254.jpg', 214, 32, 6, '서울 마포구 상암동',
        0, 'BOTH', '2024-10-17T10:13:33', '2024-10-17T10:13:33'),
       (69, '필립스 면도기', 1, '<b>필립스</b> 5000시리즈 S5466/17', 74090, 1, 'RESERVED', 'NEW',
        'https://shopping-phinf.pstatic.net/main_3040302/30403022619.20240514120436.jpg', 16, 1, 0, '서울 마포구 상암동',
        0, 'BOTH', '2024-11-06T12:49:42', '2024-11-06T12:49:42'),
       (70, '삼성 파워건 청소기', 1, '삼성전자 [혜택가:720,000] <b>삼성 파워건 청소기</b> VS80M8090KC', 712800, 1, 'SOLD', 'BAD',
        'https://shopping-phinf.pstatic.net/main_5005538/50055381252.jpg', 174, 41, 7, '서울 마포구 상암동', 1, 'DIRECT',
        '2024-10-24T07:16:10', '2024-10-24T07:16:10'),
       (71, 'JBL 파티박스 스피커', 1, '<b>JBL PARTYBOX</b> 110', 479000, 1, 'SOLD', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_2840340/28403401558.20211118171442.jpg', 67, 5, 1, '서울 마포구 상암동',
        1, 'DELIVERY', '2024-11-04T20:55:26', '2024-11-04T20:55:26'),
       (72, '나이키 운동화 에어맥스', 1, '<b>나이키</b> <b>에어맥스</b> SC CW4554-101', 60280, 1, 'SOLD', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_3322949/33229495946.20221020124218.jpg', 142, 7, 0, '서울 마포구 상암동',
        0, 'DELIVERY', '2024-10-28T18:16:38', '2024-10-28T18:16:38'),
       (73, '티볼리 클래식 라디오', 1, '<b>Tivoli</b> Audio <b>티볼리 클래식</b> 소형 레트로 블루투스 K3', 399260, 1, 'SALE', 'NEW',
        'https://shopping-phinf.pstatic.net/main_8651941/86519412644.jpg', 24, 3, 1, '서울 마포구 상암동', 0, 'BOTH',
        '2024-11-07T17:44:03', '2024-11-07T17:44:03'),
       (74, '브라운 칫솔 오랄B', 1, '<b>브라운</b> 오랄비 전동<b>칫솔</b> 배터리 어드밴스 파워 DB5 리필 호환모 1팩 세트', 15440, 1, 'SALE', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_8717321/87173210572.jpg', 26, 2, 0, '서울 마포구 상암동', 0, 'BOTH',
        '2024-11-07T22:04:45', '2024-11-07T22:04:45'),
       (75, '삼성 QLED TV 75인치', 1, '<b>삼성전자</b> <b>삼성</b> 2023 <b>QLED</b> 4K QC65 189cm (KQ75QC65AFXKR)', 1488340, 1,
        'RESERVED', 'NEW', 'https://shopping-phinf.pstatic.net/main_3872075/38720754620.20230317134657.jpg', 51, 2, 0,
        '서울 마포구 상암동', 1, 'BOTH', '2024-11-05T19:56:03', '2024-11-05T19:56:03'),
       (76, '인스탁스 미니 카메라', 1, '정품 <b>인스탁스 미니</b>12+선물2종SET 폴라로이드 즉석<b>카메라</b>', 118680, 1, 'SALE', 'BAD',
        'https://shopping-phinf.pstatic.net/main_8606957/86069572799.25.jpg', 130, 4, 1, '서울 마포구 상암동', 1, 'BOTH',
        '2024-10-31T10:04:09', '2024-10-31T10:04:09'),
       (77, '셀린느 카드지갑', 1, '[국내백화점] <b>셀린느 카드지갑</b> 트리오페 카드홀더 모음', 374000, 1, 'SOLD', 'NEW',
        'https://shopping-phinf.pstatic.net/main_8745645/87456454956.2.jpg', 87, 8, 3, '서울 마포구 상암동', 1, 'DIRECT',
        '2024-11-04T00:35:54', '2024-11-04T00:35:54'),
       (78, '보스 서브우퍼', 1, 'BOSE 502B <b>보스 서브우퍼</b> 스피커', 2480000, 1, 'SOLD', 'NEW',
        'https://shopping-phinf.pstatic.net/main_1494536/14945362116.jpg', 30, 3, 0, '서울 마포구 상암동', 1, 'DELIVERY',
        '2024-11-06T22:09:05', '2024-11-06T22:09:05'),
       (79, '소니 플레이스테이션 VR', 1, 'PS5 <b>플레이스테이션</b> <b>플스 VR</b>2 PS <b>VR</b> 국내정발 기본세트', 748000, 1, 'SOLD', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_8567530/85675301653.jpg', 22, 0, 0, '서울 마포구 상암동', 0, 'DIRECT',
        '2024-11-07T02:57:29', '2024-11-07T02:57:29'),
       (80, '페라가모 벨트', 1, '남자 정장 <b>페라가모</b> 명품 <b>벨트</b> 호환 교체용 소가죽 끈 허리띠 레더팜 34 32 29 mm', 20000, 1, 'RESERVED',
        'AVERAGE', 'https://shopping-phinf.pstatic.net/main_8664586/86645869731.1.jpg', 127, 20, 4, '서울 마포구 상암동',
        1, 'DIRECT', '2024-10-16T15:41:38', '2024-10-16T15:41:38'),
       (81, '마이크로소프트 X박스 시리즈 X', 1, '<b>마이크로소프트 엑스박스</b> <b>XBOX Series X</b>', 538000, 1, 'SOLD', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_2445484/24454849527.20210127125722.jpg', 177, 1, 0, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-19T23:11:10', '2024-10-19T23:11:10'),
       (82, '파나소닉 면도기', 1, '<b>파나소닉</b> ES-LV67', 167730, 1, 'SOLD', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_2343916/23439167490.20200924163159.jpg', 106, 3, 1, '서울 마포구 상암동',
        1, 'BOTH', '2024-10-15T12:40:03', '2024-10-15T12:40:03'),
       (83, '키친에이드 믹서', 1, '키친에이드 <b>KitchenAid 블렌더</b> 믹서기 베이지', 597930, 1, 'RESERVED', 'GOOD',
        'https://shopping-phinf.pstatic.net/main_8633421/86334213364.jpg', 288, 47, 16, '서울 마포구 상암동', 1, 'DIRECT',
        '2024-10-13T22:31:06', '2024-10-13T22:31:06'),
       (84, '삼성 드럼세탁기', 1, '<b>삼성전자</b> <b>삼성</b> WW90T3000KW', 408050, 1, 'SALE', 'BAD',
        'https://shopping-phinf.pstatic.net/main_2757068/27570689522.20210623090539.jpg', 20, 0, 0, '서울 마포구 상암동',
        1, 'DIRECT', '2024-11-05T05:16:26', '2024-11-05T05:16:26'),
       (85, 'JBL 블루투스 이어폰', 1, '삼성전자 <b>JBL</b> TOUR PRO3', 398000, 1, 'SOLD', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_5091603/50916033618.20241024095807.jpg', 74, 14, 3, '서울 마포구 상암동',
        1, 'DIRECT', '2024-10-19T13:53:15', '2024-10-19T13:53:15'),
       (86, '다이슨 공기청정기', 1, '<b>다이슨</b> 빅앤콰이엇 포름알데히드 <b>공기청정기</b> (블루,골드)', 889480, 1, 'SALE', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_4049956/40499563618.20230612152742.jpg', 74, 13, 1, '서울 마포구 상암동',
        0, 'DIRECT', '2024-11-04T13:14:33', '2024-11-04T13:14:33'),
       (87, '벤큐 게이밍 모니터', 1, '<b>벤큐</b> XL2540K 240', 474050, 1, 'RESERVED', 'NEW',
        'https://shopping-phinf.pstatic.net/main_2850613/28506139554.20220311173751.jpg', 56, 4, 1, '서울 마포구 상암동',
        1, 'DELIVERY', '2024-10-11T10:37:14', '2024-10-11T10:37:14'),
       (88, '삼성 외장 SSD', 1, '삼성전자 <b>삼성 외장SSD</b> T7', 138500, 1, 'SALE', 'BAD',
        'https://shopping-phinf.pstatic.net/main_2290847/22908474426.20200605145708.jpg', 276, 36, 0, '서울 마포구 상암동',
        1, 'DELIVERY', '2024-10-20T06:56:23', '2024-10-20T06:56:23'),
       (89, '소니 알파 7R 카메라', 1, 'Sony Alpha <b>7R</b> V 풀 프레임 미러리스 교체 가능한 렌즈 <b>카메라</b>', 7901250, 1, 'SALE', 'BAD',
        'https://shopping-phinf.pstatic.net/main_8853563/88535635671.jpg', 73, 5, 0, '서울 마포구 상암동', 1, 'BOTH',
        '2024-10-29T21:13:30', '2024-10-29T21:13:30'),
       (90, '애플 매직 마우스', 1, '<b>Apple 매직 마우스</b> 2 실버 (MK2E3KH/A)', 77537, 1, 'SALE', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_2846638/28466381555.20210817152444.jpg', 2, 0, 0, '서울 마포구 상암동',
        0, 'DELIVERY', '2024-10-22T16:37:08', '2024-10-22T16:37:08'),
       (91, '샤오미 블랙샤크 게이밍폰', 1, '<b>샤오미 블랙샤크</b>5 프로 Pro 5G <b>게임용</b> 학생폰 중국판 무음 카메라 듀얼심 효도폰', 599900, 1, 'RESERVED',
        'BAD', 'https://shopping-phinf.pstatic.net/main_8745226/87452269810.jpg', 206, 45, 13, '서울 마포구 상암동', 0,
        'BOTH', '2024-10-11T11:22:27', '2024-10-11T11:22:27'),
       (92, '에코백', 1, '(당일출고) HAY <b>에코백</b> 헤이 토트백 쇼퍼백 9종', 12000, 1, 'RESERVED', 'NEW',
        'https://shopping-phinf.pstatic.net/main_8363942/83639426010.5.jpg', 47, 14, 3, '서울 마포구 상암동', 0, 'DIRECT',
        '2024-10-16T06:20:39', '2024-10-16T06:20:39'),
       (93, '코비 블루투스 이어폰', 1, '<b>코비 블루투스 이어폰</b> 이어셋 넥밴드 아웃도어UPTO4.0', 28300, 1, 'RESERVED', 'BROKEN',
        'https://shopping-phinf.pstatic.net/main_8076743/80767432456.jpg', 26, 5, 0, '서울 마포구 상암동', 1, 'DIRECT',
        '2024-11-06T18:59:55', '2024-11-06T18:59:55'),
       (94, 'LG 그램 17 노트북', 1, '<b>LG그램 17</b>인치 2024 업무용 인강용 사무용 가벼운 <b>노트북</b> 대학생 고사양 포토샵', 1549000, 1, 'RESERVED',
        'GOOD', 'https://shopping-phinf.pstatic.net/main_8564178/85641783785.4.jpg', 114, 0, 0, '서울 마포구 상암동', 0,
        'DIRECT', '2024-10-22T15:44:02', '2024-10-22T15:44:02'),
       (95, '레고 해리포터 성', 1, '<b>레고 해리포터</b> 호그와트 <b>성</b> 71043', 570000, 1, 'SALE', 'AVERAGE',
        'https://shopping-phinf.pstatic.net/main_1633519/16335193689.20181220142936.jpg', 293, 65, 21, '서울 마포구 상암동',
        0, 'DIRECT', '2024-10-24T21:34:22', '2024-10-24T21:34:22'),
       (96, '샤넬 클래식 백', 1, '<b>샤넬 클래식</b> 스몰 플랩백 캐비어 은장 클스 내장칩버전 예물백 결혼선물 A01113 선물용', 15980000, 1, 'SALE', 'NEW',
        'https://shopping-phinf.pstatic.net/main_8308248/83082488334.jpg', 183, 5, 0, '서울 마포구 상암동', 0, 'BOTH',
        '2024-10-29T17:26:43', '2024-10-29T17:26:43'),
       (97, '소니 A6000 카메라', 1, '<b>소니</b> 알파 <b>A6000</b>', 399860, 1, 'RESERVED', 'NEW',
        'https://shopping-phinf.pstatic.net/main_7487879/7487879526.20200629125020.jpg', 82, 0, 0, '서울 마포구 상암동',
        0, 'DELIVERY', '2024-11-01T02:00:44', '2024-11-01T02:00:44'),
       (98, '맥북 프로 16인치', 1, '애플 <b>맥북 프로 16인치</b> 2021 M1 Pro 영상편집 디자인 그래픽 새상품', 2290000, 1, 'SALE', 'NEW',
        'https://shopping-phinf.pstatic.net/main_8753379/87533798611.jpg', 35, 4, 0, '서울 마포구 상암동', 1, 'DIRECT',
        '2024-11-07T18:37:01', '2024-11-07T18:37:01'),
       (99, '에이수스 젠북 듀오', 1, 'ASUS <b>아수스 젠북 듀오</b> UX482EAR 14인치 노트북', 1100000, 1, 'SALE', 'BAD',
        'https://shopping-phinf.pstatic.net/main_4996030/49960303224.1.jpg', 55, 4, 2, '서울 마포구 상암동', 0, 'DIRECT',
        '2024-10-28T02:49:46', '2024-10-28T02:49:46'),
       (100, '닌텐도 위핏 플러스', 1, '<b>닌텐도 위</b> WII <b>위 핏 플러스</b> 피트 한글 새제품 CD', 5500, 1, 'SOLD', 'BAD',
        'https://shopping-phinf.pstatic.net/main_8298134/82981341914.1.jpg', 67, 4, 0, '서울 마포구 상암동', 1, 'DIRECT',
        '2024-10-11T04:10:57', '2024-10-11T04:10:57');