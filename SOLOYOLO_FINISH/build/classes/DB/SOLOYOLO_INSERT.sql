-- ======== [ SOLOYOLO DB_INSERT TB & SEQ ] ========= --


-- =================== MEMBER TB ==================== --
INSERT INTO MEMBER
VALUES( MEMBERSEQ.NEXTVAL, 'ADMIN', 'ADMIN', 'ADMIN', 'ADMIN', 'ADMIN@naver.com', '010-8765-4321', '178.5', '71.4', 12345, '관리시 관리구 관리동', '관리아파트 관리동 관리호', 37.500637, 127.036371, 'ADMIN', '액션', '복부', SYSDATE );
INSERT INTO MEMBER
VALUES( MEMBERSEQ.NEXTVAL, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST@naver.com', '010-8765-4321', '178.5', '71.4', 12345, '시험시 시험구 시험동', '시험아파트 시험동 시험호', 37.500637, 127.036371, 'USER', '액션', '상체', SYSDATE );

SELECT * FROM MEMBER;
-- ================================================== --


-- =================== DIVBOARD TB ================== --
-- DIVNO : 1( CULTURE ), 2( HOME TRAINNING ), 3( COOK ), 4( DELIVERY )
INSERT INTO DIVTB VALUES( 1, 'Culture' );
INSERT INTO DIVTB VALUES( 2, 'Home Trainning' );
INSERT INTO DIVTB VALUES( 3, 'Cook' );
INSERT INTO DIVTB VALUES( 4, 'Delivery' );

--SELECT * FROM DIVTB;
-- ================================================== --


-- =================== [ MYPAGE ] =================== --
-- =================== CALORIE TB =================== --
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 1, 1432, 2451, '2020-05-11' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 1, 1621, 2178, '2020-05-12' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 1, 1823, 2618, '2020-05-14' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 1, 1298, 2098, '2020-05-16' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 1, 2646, 2187, '2020-05-17' );

INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 2, 1432, 2451, '2020-05-11' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 2, 1621, 2178, '2020-05-12' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 2, 1823, 2618, '2020-05-14' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 2, 1298, 2098, '2020-05-16' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 2, 2646, 2187, '2020-05-17' );

INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 3, 1432, 2451, '2020-05-11' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 3, 1621, 2178, '2020-05-12' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 3, 1823, 2618, '2020-05-14' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 3, 1298, 2098, '2020-05-16' );
INSERT INTO CALORIE
VALUES( CALORIESEQ.NEXTVAL, 3, 2646, 2187, '2020-05-17' );

--SELECT * FROM CALORIE;
-- ================================================== --
-- ===================== SNS TB ===================== --


--SELECT * FROM SNS;
-- ================================================== --
-- ================== FAVORITES TB ================== --


--SELECT * FROM FAVORITES;
-- ================================================== --
-- ==================== HISTORY TB ================== --


--SELECT * FROM HISTORY;
-- ================================================== --
-- ================================================== --


-- ==================== MOVIE TB ==================== --


--SELECT * FROM MOVIE;
-- ================================================== --


-- ================== TRAINING TB =================== --
insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'헌드레드',
'점프하지 않는 동작으로 이루어져있는 초보자를 위한 전신지방연소 운동입니다.;
 이 운동을 통해 초보자도 쉽게 할 수 있는 운동입니다.;
<br><img width="900px" height="500px" src="images/ht/ht01_detail01.png"><br>;
<br>1.누운자세에서 어깨를 끌어 내리고 무릎을 붙어 한다리씩 골반위에 세워줍니다.<br>;
<br><img width="900px" height="500px" src="images/ht/ht01_detail02.png"><br>;
<br>2.테이블 탑 자세를 유지합니다.(이때 등이 바닥에 빈틈없이 붙어 있어야 합니다)<br>;
<br><img width="900px" height="500px" src="images/ht/ht01_detail03.png"><br>;
<br>3.테이블탑 자세를 유지한 후 두팔을 천장으로 뻗어 준 상태에서<br>;
<br><img width="900px" height="500px" src="images/ht/ht01_detail04.png"><br>;
<br>4.상체만 들어올려 코로 숨을 들여 마시고 내쉬는 호흡에 턱을 당겨 시선은 배꼽을 봅니다.<br>;
<br><img width="900px" height="500px" src="images/ht/ht01_detail05.png"><br>;
<br>5.두팔을 위아래로 가볍게 바운스하며 5번 짧개 호흡을 마시고 5번 짧게 내쉬어 줍니다.<br>;
<br><b>10세트를 반복하여 총100회의 호흡을 완성하셔야 헌드레드 운동이 마무리 됩니다.</b>;
 ※주의 사항: 목과 어깨가 땅에 닿지 않도록 주의하기',
'13분30초',
'중급',
'복부',
151,
'https://www.youtube.com/embed/qH8oC4G30EQ',
'images/ht/ht01.png');


insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'땀나는 전신운동',
'10분 만에 버닝 업 평소하던 운동이 지겨울때 단시간에 바짝 쪼이고 싶을떄 도전해보세요.;
※6분씩 운동 2세트에 중간 1분 휴식으로 구성되어 있어요.다양한 동작에 진행이빠른 편이라 충분한 스트레친 후 시작해주세요',
'13분30초',
'고급',
'전신',
154,
'https://www.youtube.com/embed/QUn2iTnPOyw',
'images/ht/ht02.png');




insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'지방연소운동',
'점프하지 않는 동작으로 이루어져있는 초보자를 위한 전신지방연소 운동입니다.; 
이 운동을 통해 초보자도 쉽게 할 수 있는 운동입니다',
'13분30초',
'중급',
'전신',
151,
'https://www.youtube.com/embed/bleOTMDa3_4',
'images/ht/ht03.png');



insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'7일 7분 배 지방 없애는 운동',
'7일동안 7분동안 운동을 통해 배 지방을 없애주는 운동입니다.;
 꾸준히 진행시 효과가 탁월한 점!!',
'13분30초',
'중급',
'복부',
121,
'https://www.youtube.com/embed/Rsljw3JgY3c',
'images/ht/ht04.png'); 



insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'벤치딥스',
'흔들리고 힘없는 팔뚝살을 없애주는 운동입니다.;
<br><img width="900px" height="500px" src="images/ht/ht05_detail01.png"><br>;
<br>1.의자에 앉아 두 팔을 엉덩이 옆에 두고 발을 사진과 같이 쭉 뻗어줍니다.<br>;
<br><img width="900px" height="500px" src="images/ht/ht05_detail02.png"><br>;
<br>2.그 자세에서 그대로 팔꿈치를 수직으로 접어 내려갑니다.<br>;
<br><img width="900px" height="500px" src="images/ht/ht05_detail03.png"><br>;
<br>3.삼두근의(등과 어깨사이의 근육)함으로 숨을 내쉬며 올러옵니다.<br>;
<br><img width="900px" height="500px" src="images/ht/ht05_detail04.png"><br>;
<br>4.다시 숨을 마시면서 팔꿈치를 접어 의자를 스치듯 내려갔다가<br>;
<br><img width="900px" height="500px" src="images/ht/ht05_detail05.png"><br>;
<br>5.내쉬는 호흡을 팔꿈치를 펴서 제자리로 돌어갑니다.<br>;
<br>위의 동작들을 <b>15개씩 4세트</b> 반복해줍니다.;
 ※주의 사항: 팔꿈치가 옆으로 벌어지지 않도록 신경써서 동작해주세요.',
'11분 00초',
'초급',
'상체',
8,
'https://www.youtube.com/embed/euP1mG1DOEI',
'images/ht/ht05.png');


insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'벤드로우',
'등의 근력을 키우고 군살을 없애주는 운동입니다.;
<br><img width="900px" height="500px" src="images/ht/ht06_detail01.png"><br>;
<br>1.두손으로 밴드 끝을 잡고, 골반 넓이러 서서 밴드를 잡습니다.<br>;
<br><img width="900px" height="500px" src="images/ht/ht06_detail02.png"><br>;
<br>2.무릎은 접어 무게 중심을 엄지 발가락 앞쪽으로 두세요<br>;
<br><img width="900px" height="500px" src="images/ht/ht06_detail03.png"><br>;
<br>3.그 자세에서 엉덩이를 뒤로 빼로 허리를 사진과 갗이 곱게 펍니다.<br>;
<br><img width="900px" height="500px" src="images/ht/ht06_detail04.png"><br>;
<br>4.자세를 유지하며,크개 숨을 마쉬고 내시는 호흡에 팔꿈치를 접어<br>;
<br><img width="900px" height="500px" src="images/ht/ht06_detail05.png"><br>;
<br>5.몸통을 스치듯 올려주세요. 이때,날개뼈를 조이며 최대한 등의 자극을 느끼고<br>;
<br><img width="900px" height="500px" src="images/ht/ht06_detail06.png"><br>;
<br>6.마시는 호흡에 팔을 쭉 펴서 제자리로 돌아옵니다.<br>;
<br><img width="900px" height="500px" src="images/ht/ht06_detail07.png"><br>;
<br>7.이동작을 15개씩 총 3세트씩 중간에 휴식을 많이 취하지 않고 진행하면 완료.<br>;',
'2분 36초',
'초급',
'상체',
9,
'https://www.youtube.com/embed/jDrDvhLKcUM',
'images/ht/ht06.png');

insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'5분 스쿼트 운동',
'애플힙을 만들어 주는 매일매일 5분씩하는 스쿼트 운동입니다.;
<br><img width="900px" height="500px" src="images/ht/ht07_detail01.png"><br>;
<br>1.무릎이 발끝을 나가지 않도록 주의하면서 스쿼트 운동을 진행해주세요<br>;
<br><img width="900px" height="500px" src="images/ht/ht07_detail02.png"><br>;
<br>2.스쿼트 운동으로 앉았아다가 일어나며 한 쩌ㅗㄱ 다리를 옆으로 쭉 펴주세요<br>;
<br><img width="900px" height="500px" src="images/ht/ht07_detail03.png"><br>;
<br>3.코어에 집중하며 한 쪽 다리로 선 채로 다른 쪽 다리는 옆으로 쭉 펴서 올렸다 내렸다 반복해주세요.;
그다음 2~3번 운동을 반대쪽으로 진행해주세요<br>;
<br><img width="900px" height="500px" src="images/ht/ht07_detail04.png"><br>;
<br>4.다리를 넓게 벌린 후 와이드 스퀴트 운동을 진행해주세요<br>;',
'5분 44초',
'초급',
'하체',
40,
'https://www.youtube.com/embed/6XpGQ2EhfUQ',
'images/ht/ht07.png');


insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'런지리프트',
'매끈한 다리라인과 힙라인을 만들어주는 운동입니다.;
<br><img width="900px" height="500px" src="images/ht/ht08_detail01.png"><br>;
<br>1.다리 한쪽을 앞으로 내밀고 구부려요.<br>;
<br><img width="900px" height="500px" src="images/ht/ht08_detail02.png"><br>;
<br>2.허리를 펴고 구부렸던 무릎을 천천히 세우면서 중심을 잡아주던 뒷다리를 뒤로 높이 올려요<br>;
<br><img width="900px" height="500px" src="images/ht/ht08_detail03.png"><br>;
<br>3.다시 마시는 호흡에 뒷다리를 내리면서 무릎을 굽혀줍니다.<br>;
<br><img width="900px" height="500px" src="images/ht/ht08_detail04.png"><br>;
<br>4.같은 방법으로 반복해요.15회씩 4세트<br>;
<br>※주의 사항: 구부린 무릎은 기준으로 앞으로 넘어가지 않도록 주의해요',
'1분 48초',
'초급',
'하체',
60,
'https://www.youtube.com/embed/mAS5qbRUkFs',
'images/ht/ht08.png');


insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'워밍업운동',
'운동하기전 부상을 예방하고 운동의 효과를 극대화 시켜주는 운동 전 5분 워밍업 운동입니다.;
이 워밍업을 통해 부상의 위험에서 벗어나면서 운동을 진행해주세요.',
'8분 22초',
'초급',
'스트레칭',
77,
'https://www.youtube.com/embed/dpnN3Fu4ip0',
'images/ht/ht09.png');


insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'아침 스트레칭 5가지 운동',
'아침에 스트레칭 하기좋은 5가지의 운동입니다.',
'4분 17초',
'초급',
'스트레칭',
55,
'https://www.youtube.com/embed/RLpeLjHq7l0',
'images/ht/ht10.png');



insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'침대에서 할수 있는 5분 지방 분해 운동',
'침대에서 바로 할수 있는 5분 운동으로 지방을 불태워보세요. 단! 꾸준히 해주시는게 매우 효과적입니다.;
10가지 운동을 통해 바로 시작해보세요.♥',
'10분 00초',
'중급',
'전신',
132,
'https://www.youtube.com/embed/j-sOWLKGmKs',
'images/ht/ht11.png');



insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'조용하게 운동을 할 수 있는 1번째 전신운동',
'아파트에 사시는분! 발목이 약하신분! 부상 당하신분!;
조용하고 부드러운 동작으로 조용하게 운동을 원하는 분들께 좋습니다.^^',
'11분 12초',
'중급',
'전신',
152,
'https://www.youtube.com/embed/B4HbkXFlrJA',
'images/ht/ht12.png');



insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'초보자를 위한 전신 25분 운동',
'집에서 쉽게 할 수 있는 전신운동을 배워보세요! 쉬운 동작을 통해 꾸준히 진행하시다 보면 칼로리 소모와 체력까지 높여준답니다.;
영상과 함께 따라해보세요~♥',
'28분 34초',
'초급',
'전신',
220,
'https://www.youtube.com/embed/UzMJ6dVwyRs',
'images/ht/ht13.png');



insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'초보자도 쉽게 할 수 있는 복부 운동',
'14분 동안 초보자도 쉽게 따라하실수 있는 복부 운동입니다.;
어려운 동작이 없어 초보자도 쉽게 하실수 있습니다.',
'15분 56초',
'초급',
'복부',
191,
'https://www.youtube.com/embed/boRMhMrWtWI',
'images/ht/ht14.png');



insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'배 지방을 2주안에 잃게 하는 운동',
'배 지방을 2주안에 빠르게 잃게 하는;
20가지 동작으로 이루어진 운동입니다.',
'16분 35초',
'고급',
'복부',
336,
'https://www.youtube.com/embed/DHM5rj05BOE',
'images/ht/ht15.png');



insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'어깨라인을 살려주는 5가지 운동',
'캐시언니와 함께 어깨라인과 팔 라인을 이쁘게 만들어주는 5가지 운동입니다.;
이 운동을 통해서 상체 전체라인을 살려준답니다.^^',
'10분 19초',
'중급',
'상체',
131,
'https://www.youtube.com/embed/U4J6NwAc8ag',
'images/ht/ht16.png');



insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'탄력있는 팔, 어깨라인 만들기',
'최고의 팔, 어깨라인을 만들기 위한 다양한 동작 운동을 배워보세요~;
몸에 무리가 가지 않도록 주의해주세요',
'19분 23초',
'고급',
'상체',
182,
'https://www.youtube.com/embed/SkMjxWAKF8w',
'images/ht/ht17.png');



insert into TRAINING values(TRAININGSEQ.NEXTVAL,
'유연성을 높여주며 심신을 안정시켜주는 5가지 스트레칭',
'유연성을 높여주는 동시에 심신까지 안정시켜주는 최고의 5가지 스트레칭을 배워보세요!;
최고의 몸과 마음을 같이 단련해보아요^^',
'12분 50초',
'중급',
'스트레칭',
71,
'https://www.youtube.com/embed/CxF4DWUn-VE',
'images/ht/ht18.png');

--SELECT * FROM TRAINING;
-- ================================================== --



-- ==================== COOK TB ===================== --
insert into COOK values(COOKSEQ.NEXTVAL,
'새송이버섯간장버터구이',
'images/cook/cook01_detail.png',
'<br><img width="500px" src="images/cook/cook01_detail01.png"><br>;
<br>1.버섯의 밑동과 갓을 잘라낸 뒤 3~4등분 한다.<br>;
<br><img width="500px" src="images/cook/cook01_detail02.png"><br>;
<br>2.자른버섯의 양면에 칼집을 낸다.<br>;
<br><img width="500px" src="images/cook/cook01_detail03.png"><br>;
<br>3.팬에 버터를 녹인다.<br>;
<br><img width="500px" src="images/cook/cook01_detail04.png"><br>;
<br>4.버섯을 굽는다.<br>;
<br><img width="500px" src="images/cook/cook01_detail05.png"><br>;
<br>5.불을 약불로 줄이고 소스를 넣고 졸인다<br>',
'술안주',
299,
'images/cook/cook01.png',
'새송이버섯 2개,버터 30g,어린잎채소',
'간장 1T,맛술 1T,올리고당 1/2T'
);


insert into COOK values(COOKSEQ.NEXTVAL,
'대패덮밥',
'images/cook/cook02_detail.png',
'<br><img width="500px" src="images/cook/cook02_detail01.png"><br>;
<br>1.궁중팬에 대패삼겹살을 넣어줍니다.<br>;
<br><img width="500px" src="images/cook/cook02_detail02.png"><br>;
<br>2.대파는 큼직하게 썰어서 준비합니다.<br>;
<br><img width="500px" src="images/cook/cook02_detail03.png"><br>;
<br>3.대패삼겹살이 골고루 익도록 볶아줍니다.<br>;
<br><img width="500px" src="images/cook/cook02_detail04.png"><br>;
<br>4.고기가 적당히 익으면 준비한 대파를 넣고 좀더 볶아줍니다.<br>;
<br><img width="500px" src="images/cook/cook02_detail05.png"><br>;
<br>5.대패삼겹살이 노릇해질 정도로 충분히 익혀준 뒤<br>;
<br><img width="500px" src="images/cook/cook02_detail06.png"><br>;
<br>6.설탕 2스푼을 넣고 한번 더 볶아줍니다.<br>;
<br><img width="500px" src="images/cook/cook02_detail07.png"><br>;
<br>7.설탕을 넣고 볶아주면 고기에 윤기가 돌아요.<br>;
<br><img width="500px" src="images/cook/cook02_detail08.png"><br>;
<br>8.맛간장 또는 진간장을 4큰술 넣고 한번 더 볶아줍니다.<br>;
<br><img width="500px" src="images/cook/cook02_detail09.png"><br>;
<br>9.삼겹살에 간장 양념이 골고루 베이도록 볶아주면 완성이에요.<br>;
<br><img width="500px" src="images/cook/cook02_detail10.png"><br>;
<br>10.오목한 그릇에 따뜻한밥을 담고, 그 위에 볶은 고기를 올려주면 대패덥밥 완성<br>',
'일상',
1329,
'images/cook/cook02.png',
'대패삼겹살 400g,대파 2뿌리',
'설탕 2스푼,맛간장(OR진간장) 4스푼'
);


insert into COOK values(COOKSEQ.NEXTVAL,
'비엔나만두강정',
'images/cook/cook03_detail.png',
'<br><img width="500px" src="images/cook/cook03_detail01.png"><br>;
<br>1.만두는 기름을 두룬 팬에 노릇하게 구워줍니다.<br>;
<br><img width="500px" src="images/cook/cook03_detail02.png"><br>;
<br>2.비엔나 소세지에 원하는 모양대로 칼집을 내고 팬에 볶아줍니다.<br>;
<br><img width="500px" src="images/cook/cook03_detail03.png"><br>;
<br>3.비엔나가 어느정도 구워지면 만두를 같이 넣어줍니다.<br>;
<br><img width="500px" src="images/cook/cook03_detail04.png"><br>;
<br>4.양념장을 넣고 양념이 고루 베이도록 잘 섞어줍니다.<br>;
<br><img width="500px" src="images/cook/cook03_detail05.png"><br>;
<br>5.양념이 어느정도 베이면 위에 통깨를 뿌려 마무리합니다.<br>;
<br><img width="500px" src="images/cook/cook03_detail06.png"><br>;
<br>6.간식이나 술안주, 밑반찬으로 먹기 좋은 비엔나만두강정 완성!<br>',
'간식',
757,
'images/cook/cook03.png',
'만두(교자만두/물만두) 10개,비엔나소세지 작은거 1봉',
'물 1T,간장 1T,고추장 2T,케찹 2T,올리고당 1.5T,다진마늘 1t,참기름 약간,깨 약간'
);

insert into COOK values(COOKSEQ.NEXTVAL,
'버터갈릭새우',
'images/cook/cook04_detail.png',
'<br><img width="500px" src="images/cook/cook04_detail01.png"><br>;
<br>1.새우는 껍질을 깐 뒤 내장을 제거한다.<br>;
<br><img width="500px" src="images/cook/cook04_detail02.png"><br>;
<br>2.손질한 새우에 소금, 올리브유, 후추를 약간씩 넣고 버무린 다음 10분간 재운다.<br>;
<br><img width="500px" src="images/cook/cook04_detail03.png"><br>;
<br>3.버터 20g, 다진 마늘 2큰술, 올리고당 2큰술, 파슬리 가루 약간을 넣어 버터갈릭 소스를 만든다.<br>;
<br><img width="500px" src="images/cook/cook04_detail04.png"><br>;
<br>4.프라이팬을 중불로 달군 뒤 새우를 넣고 굽는다.<br>;
<br><img width="500px" src="images/cook/cook04_detail05.png"><br>;
<br>5.새우가 살짝 익으면 만들어 둔 버터갈릭 소스를 넣고 볶는다.<br>;
<br><img width="500px" src="images/cook/cook04_detail06.png"><br>;
<br>6.버터갈릭 소스가 졸아들 때까지 계속 볶으면 버터갈릭새우가 완성된다.<br>',
'야식',
386,
'images/cook/cook04.png',
'새우 20마리,버터 20g,올리고당 2큰술,다진마늘 1큰술,파슬리 약간',
'후추 약간,올리브유 약간,소금 약간'
);

insert into COOK values(COOKSEQ.NEXTVAL,
'갈릭베이컨또띠아',
'images/cook/cook05_detail.png',
'<br><img width="500px" src="images/cook/cook05_detail01.png"><br>;
<br>1.먼저 베이컨을 잘게 썰어 아무것도 두르지 않은 팬에 바싹 구워 줍니다
<br><img width="500px" src="images/cook/cook05_detail02.png"><br>;
<br> 2.베이컨이 다 볶아지면 베이컨과 녹인버터,파슬리,마늘, 꿀을 한곳에 잘 섞어 줍니다.<br>;
<br>[팁]파슬리가루 없으시면 빼도 되고 꿀 대신 올리고당 가능합니다.<br>;
<br><img width="500px" src="images/cook/cook05_detail03.png"><br>;
<br> 3.또띠아 위에 얇게 펴 발라 주신뒤 전자렌지에서 1-2분 돌려주시면 끝!좀더 바삭하게 드시고 싶으면 팬에 구워주셔도 되요.<br>;
<br><img width="500px" src="images/cook/cook05_detail04.png"><br>;
<br>4.초간단 맥주안주 갈릭베이컨또띠아 완성입니다.위에 파마산 치즈가루 솔솔 뿌려주심 더 맛있지요<br>;
 <br> [팁]파마산 치즈가루 없으심 빼셔도 되요<br>;
<br><img width="500px" src="images/cook/cook05_detail05.png"><br>;
<br>5.고소한 버터냄새 짭쪼롬한 베이컨냄새가 스멀스멀 올라와 군침 돌아요.<br>;
<br><img width="500px" src="images/cook/cook05_detail06.png"><br>;
<br> 6.한입 먹어보니 꿀을 넣어 달달함과 베이컨의 짭쪼롬함이<br>;
 조화를 이루어 정말 맛있어요,단짠단짠한 맛이 맥주를 부르는 맛이랍니다.<br>;
만들기도 쉬우면서 맛있는 갈릭베이컨 또띠아 맥주안주로 한번 만들어 보셔요.',
'술안주',
371,
'images/cook/cook05.png',
'또띠아(소) 1장,베이컨 1줄,파마산치즈가루 1T',
'다진마늘 1/2T,버터 1T,꿀 1T,파슬리가루 1T'
);


insert into COOK values(COOKSEQ.NEXTVAL,'닭가슴살갈비구이',
'images/cook/cook06_detail.png',
'<br><img width="500px" src="images/cook/cook06_detail01.png"><br>;
<br>1.간장2T, 설탕1T, 참기름0.5T, 다진마늘0.5T, 꿀1T를 넣고 갈비양념을 만들어줍니다.<br>;
   (꿀이 없다면 조청이나 올리고당으로 대체 가능합니다);
<br><img width="500px" src="images/cook/cook06_detail02.png"><br>;
<br>2.대파는 길게 채썰어주세요<br>;
<br><img width="500px" src="images/cook/cook06_detail03.png"><br>;
<br>3.닭가슴살은 얇게 편 썰어주세요<br>;
<br><img width="500px" src="images/cook/cook06_detail04.png"><br>;
<br>4.볼에 닭가슴살 편 썬걸 담고, 갈비양념을 넣고 양념을 골고루 묻혀 주세요<br>;
<br><img width="500px" src="images/cook/cook06_detail05.png"><br>;
<br>5.갈비양념을 고루 묻힌 닭가슴살을 냉장고에서 20분정도 숙성시켜줍니다<br>;
<br><img width="500px" src="images/cook/cook06_detail06.png"><br>;
<br>6.프라이팬에 올리브오일을 살짝 두르고 닭가슴살을 구워줍니다<br>;
<br><img width="500px" src="images/cook/cook06_detail07.png"><br>;
<br>7.앞뒤로 노릇노릇하게 구워주세요<br>;
<br><img width="500px" src="images/cook/cook06_detail08.png"><br>;
<br>8.접시에 닭가슴살 갈비구이를 예쁘게 놓고, 대파 썬것도 올려줍니다.파채와 닭가슴살을 곁들여 드시면 됩니다',
'다이어트',
364,
'images/cook/cook06.png',
'닭가슴살 200g,대파 1개',
'간장 2T,설탕 1T,참기름 0.5T,다진마늘 0.5T,꿀 1T'
);



insert into COOK values(COOKSEQ.NEXTVAL,'매콤한 두부덮밥',
'images/cook/cook07_detail.png',
'<br><img width="500px" src="images/cook/cook07_detail01.png"><br>;
<br>1.[재료 준비]먼저 두부는 키친타월이나 면포를 이용해 물기를 뺀 뒤 으깨서 준비해주시고요.<br>;
<br><img width="500px" src="images/cook/cook07_detail02.png"><br>;
<br>2.대파는 송송 썰어줍니다.<br>;
<br><img width="500px" src="images/cook/cook07_detail03.png"><br>;
<br>3.[고추장 양념 볶기]냄비에 들기름 1.5 큰 술, 고추장 4 큰 술, 다진 마늘 1 큰 술, 올리고당 2 큰 술, 미림 1 큰 술, 후춧가루 적당량을 넣고 약불에서 5분 정도 끓여주시고요.<br>;
 <br> * 올리고당 양은 각자 입맛에 맞게 조절해주세요 ^^<br>;
<br><img width="500px" src="images/cook/cook07_detail04.png"><br>;
<br>4.볶은 고추장 양념에 으깬 두부와 대파를 넣고 가볍게 볶아줍니다. (이때도 마찬가지로 약불!)<br>;
 <br>대파의 숨이 죽으면 가스불을 끈 뒤 통깨를 샤샥 뿌려 마무리해주세요.<br>;
<br><img width="500px" src="images/cook/cook07_detail05.png"><br>;
<br> 5.그릇에 밥 한 공기 퍼 담고, 매콤하게 볶은 두부양념을 적당히 올려준 다음 계란 반숙 하나 탁 올려주면 초간단 덮밥요리 매콤한 두부덮밥 완성!',
'다이어트',
569,
'images/cook/cook07.png',
'두부 1/2모(약200g),대파 1/2대,통깨 적당량',
'들기름 1.5큰술,고추장 4큰술,다진마늘 1큰술,올리고당 2큰술,미림 1큰술,후춧가루 약간'
);


insert into COOK values(COOKSEQ.NEXTVAL,
'양념치킨너겟',
'images/cook/cook08_detail.png',
'<br><img width="500px" src="images/cook/cook08_detail01.png"><br>;
<br>1.마트에서 파는 치킨너겟 15~20개를 기름에 튀겨주고 키친타올에 올려 기름기를 빼줍니다.<br>;
<br><img width="500px" src="images/cook/cook08_detail02.png"><br>;
<br>2.모든 양념 재료를 잘 섞어준뒤 조금만 졸여주면 소스 완성!<br>;
<br><img width="500px" src="images/cook/cook08_detail03.png"><br>;
<br>3.소스에 치킨너겟을 넣고 약불에서 섞어줍니다.또는 그릇에 치킨너겟을 놓고 그 위에 소스를 부어먹어도 맛있고 다른그릇에 소스를 담아 찍어먹어도 맛있습니다',
'간식',
919,
'images/cook/cook08.png',
'치킨너겟 15~20개',
'물엿(올리고당) 5T(3T),케첩 2T,고추장 1T,간장 1T,다진마늘 2T,고춧가루 1T,설탕 2T,물 2T'
);


insert into COOK values(COOKSEQ.NEXTVAL,
'콘치즈파이',
'images/cook/cook09_detail.png',
'<br><img width="500px" src="images/cook/cook09_detail01.png"><br>;
<br>1.먼저 식빵은 2개를 겹쳐서 테두리를 깔끔하게 잘라내 주신 뒤 밀대로 식빵을 얇게 밀어 줍니다.<br>;
  <br>[팁]남은 식빵 테두리는 러스크 만들어 드시면 좋아요<br>;
<br><img width="500px" src="images/cook/cook09_detail02.png"><br>;
<br>2.캔 옥수수2스푼에 설탕1/2스푼,모짜렐라 치즈, 마요네즈를 취향것 넣고 잘 섞어 주세요.<br>;
<br><img width="500px" src="images/cook/cook09_detail03.png"><br>;
<br>3.식빵 가운데 콘치즈를 올려주시구요. 식빵 테두리 겉면에 물이나 계란물을 살짝 발라 포크로 꾹꾹 눌러가며 봉합해줍니다.<br>;
<br><img width="500px" src="images/cook/cook09_detail04.png"><br>;
<br>4.아무것도 두르지 않은 팬에 노릇노릇 하게 구워주시면 끝!!!이때 속에 치즈가 녹아야 하니 약불에서 천천히 구워주셔요!<br>;
<br><img width="500px" src="images/cook/cook09_detail05.png"><br>;
<br>5.톡톡 터지는 고소함 가득 콘치즈 파이 완성입니다^^<br>;
<br><img width="500px" src="images/cook/cook09_detail06.png"><br>;
<br>6.반으로 갈라보면 치즈가 쭈욱 늘어나는데요.한입 먹어보니 바삭한 식빵에 고소한 콘치즈가 만나 넘 맛있어요.톡톡 씹히는 옥수수 식감이 참 좋습니다.',
'간식',
324,
'images/cook/cook09.png',
'식빵 2장,캔옥수수 2T,마요네즈 적당히,피자치즈 적당히',
'설탕 1/2T'
);


insert into COOK values(COOKSEQ.NEXTVAL,
'로스트치킨윙',
'images/cook/cook10_detail.png',
'<br><img width="500px" src="images/cook/cook10_detail01.png"><br>;
<br>1.닭날개는 우유에 10분 정도 담가두었다가 건져 낸 후 물에 헹궈 물기를 제거해주세요.<br>;
<br><img width="500px" src="images/cook/cook10_detail02.png"><br>;
<br>2.닭날개에 칼집을 넣고, 소스재료에 10분간 재워주세요.<br>;
<br><img width="500px" src="images/cook/cook10_detail03.png"><br>;
<br>3.달군 팬에 약간의 올리브유를 두르고 닭날개의 표면이 노릇하게 색이 나도록 앞뒤로 2분간 구워주세요.<br>;
<br><img width="500px" src="images/cook/cook10_detail04.png"><br>;
<br>4.오븐팬에 닭날개를 넣고, 200도로 예열한 오븐에서 13~15분간 구워 속까지 익혀주시면 완성! <br>;
<br>(오븐이 없을 시에는 닭날개 표면을 노릇하게 구운 후 불을 약불로 줄이고 뚜껑을 닫아 10분 정도 은근히 구워 속까지 익혀주세요.)',
'술안주',
995,
'images/cook/cook10.png',
'닭날개 500g,우유 1/2컵,칠리소스or허니머스터드 약간',
'올리브유 2큰술,맛술 2큰술,굴소스 1큰술,올리고당 1큰술,다진마늘 1/2큰술,카레가루 1작은술,후추 약간,소금 약간,파슬리가루 약간,로즈마리 약간'
);


insert into COOK values(COOKSEQ.NEXTVAL,
'치킨너겟 간장치킨',
'images/cook/cook11_detail.png',
'<br><img width="500px" src="images/cook/cook11_detail01.png"><br>;
<br>1.프라이팬에 치킨너겟이 절반 정도 잠길정도의 식용유를 두르고 로 한 면씩 뒤집어 가며 튀겨주세요.<br>;
<br><img width="500px" src="images/cook/cook11_detail02.png"><br>;
<br>2.튀겨진 너겟은 키친타월에 올려서 표면 기름을 제거해주세요.<br>;
<br><img width="500px" src="images/cook/cook11_detail03.png"><br>;
<br>3.작은 볼에 진간장 3 스푼, 설탕 2스푼, 올리고당 3 스푼, 다진 마늘 1 스푼, 매실액 1 스푼, 맛술 2 스푼, 물 3스푼을 넣고 섞어주세요.<br>;
<br><img width="500px" src="images/cook/cook11_detail04.png"><br>;
<br>4.움푹 팬 프라이팬에 소스를 넣고 로 가열해 주세요. 몇 초 후 끓기 시작하면 로 내린 후, 치킨너겟을 모두 넣고, 주걱으로 버무려 주세요.<br>;
<br><img width="500px" src="images/cook/cook11_detail05.png"><br>;
<br>5.소스가 거의 없어졌을 때 먹기 좋게 부셔놓은 견과류를 넣어주시고 에서 30초 정도만 버무려 주세요.<br>',
'간식',
526,
'images/cook/cook11.png',
'치킨너겟 20개,견과류(아몬드or땅콩) 1줌(생략 가능)',
'진간장 3스푼(밥수저),설탕 2스푼(밥수저),올리고당 3스푼(밥수저),다진 마늘 1스푼(밥수저),매실액 1스푼(밥수저),맛술 2스푼(밥수저),물 3스푼(밥수저)'
);



insert into COOK values(COOKSEQ.NEXTVAL,
'차돌박이 파스타',
'images/cook/cook12_detail.png',
'<br><img width="500px" src="images/cook/cook12_detail01.png"><br>;
<br>1.파스타면을 제일 먼저 삶습니다. 물을 넉넉하게 담아 끓여주시고 파스타를 넣어주세요. 7분 : 단단한 식감을 원할때 8분 : 쫄깃하고 탄력있는 식감 9분 : 부드럽고 통통한 면을 원할때<br>;
<br><img width="500px" src="images/cook/cook12_detail02.png"><br>;
<br>2.마늘은 편으로 썰고 양파도 적당히, 고추도 얇게 썰어주세요. 특히 고추는 얇게 썰어주셔야 입에서 겉돌지 않고 면에 착착 감깁니다.<br>;
<br><img width="500px" src="images/cook/cook12_detail03.png"><br>;
<br>3.간장 2숟갈, 굴소스 1숟갈, 맛술 1숟갈, 다진마늘 1숟갈, 후추약간을 넣어 소스를 만들어주세요. 다 삶아진 면은 건져서 올리브유를 살짝 넣어 비벼놓으시면 됩니다.<br>;
<br><img width="500px" src="images/cook/cook12_detail04.png"><br>;
<br>4.재료 준비가 끝났다면 기름을 두른팬에 마늘과 고추를 먼저 넣어 볶아 향을 내주세요. 그다음 양파도 넣어주세요.<br>;
<br><img width="500px" src="images/cook/cook12_detail05.png"><br>;
<br>5.차돌박이까지 넣어 반 정도 볶은뒤, 면을 넣고 미리 만들어둔 소스를 넣고 함께 볶아주시 면됩니다. 소스는 입맛에 따라 약간씩 넣으며 가감하세요.<br>',
'일상',
479,
'images/cook/cook12.png',
'차돌박이 15장,양파 1/2개,청량고추 2개,홍고추 1개,통마늘 5톨',
'간장 2숟갈,굴소스 1숟갈,맛술 1숟갈,다진마늘 1숟갈,후추 약간'
);



insert into COOK values(COOKSEQ.NEXTVAL,
'숙주로 간단한 나시고랭 볶음밥',
'images/cook/cook13_detail.png',
'<br><img width="500px" src="images/cook/cook13_detail01.png"><br>;
<br>1.팬에 올리브유를 두른후 다진마늘을 볶아주세요. 마늘을 너무 다지지말고 씹히는맛이 있도록 다져주시면되요.<br>;
<br><img width="500px" src="images/cook/cook13_detail02.png"><br>;
<br>2.칵테일새우를 넣고 같이 볶아주세요.<br>;
<br><img width="500px" src="images/cook/cook13_detail03.png"><br>;
<br>3.나시고랭볶음밥 소스를 만들어주세요. 간장1T 굴소스1T 맛술2T 후추0.5t 설탕0.5t<br>;
<br><img width="500px" src="images/cook/cook13_detail04.png"><br>;
<br>4.팬에 소스를 넣고 같이 재료들과 볶아주세요.<br>;
<br><img width="500px" src="images/cook/cook13_detail05.png"><br>;
<br>5.공기밥2그릇과 잘게자른 숙주를 넣고 같이 볶아줍니다.<br>
<br><img width="500px" src="images/cook/cook13_detail06.png"><br>;
<br>6.숙주가 익을때쯤 한쪽에 스크램블에그를 만들어주세요.<br>
<br><img width="500px" src="images/cook/cook13_detail07.png"><br>;
<br>7.스크램블에그와 같이 한번더 볶아주면 맛있는 나시고랭완성!<br>',
'일상',
346,
'images/cook/cook13.png',
'다진마늘 1T,올리브유 1T,숙주 1/2봉지,밥 2공기,계란 2개,대파 1개,칵테일새우 10개',
'간장 1T,굴소스 1T,맛술 2T,후추 0.5t,설탕 0.5t'
);



insert into COOK values(COOKSEQ.NEXTVAL,
'우유달걀카레',
'images/cook/cook14_detail.png',
'<br><img width="500px" src="images/cook/cook14_detail01.png"><br>;
<br>1.먼저 양파 1/2개 먹기좋은 크기로 잘라주시구요.
햄도 한입 크기로 깍뚝 썰어주시구요..
음..저는 통조림햄이 좋더라구요.
스팸이나 리챔, 아무거나 추천합니다.<br>;
<br><img width="500px" height="500px" src="images/cook/cook14_detail02.png"><br>;
<br>2.뜨겁게 달궈진 냄비에 식용유를 붓구요. 양파와 햄을 볶아주세요.<br>;
<br><img width="500px" height="500px" src="images/cook/cook14_detail03.png"><br>;
<br>3.양파와 햄이 노릇노릇하게 볶아졌으면 우유 200ml 부어주세요.<br>;
<br><img width="500px" height="500px" src="images/cook/cook14_detail04.png"><br>;
<br>4.우유가 몽글몽글 끓어오르면 카레가루를 넣어주세요.<br>;
<br><img width="500px" height="500px" src="images/cook/cook14_detail05.png"><br>;
<br>5.카레가 걸쭉해져서 끓어오르면 계란 1개를 넣고 풀어주세요. 그리고 계란도 다 익으면 완성입니다.<br>',
'일상',
340,
'images/cook/cook14.png',
'우유 200ml,달걀 1개,양파 1/2개,통조림햄 제일작은거1/2통',
'카레가루 3.5큰술'
);



insert into COOK values(COOKSEQ.NEXTVAL,
'깐풍만두',
'images/cook/cook15_detail.png',
'<br><img width="500px" src="images/cook/cook15_detail01.png"><br>;
<br>1.먼저 야채를 잘게 썰어 주시는데요. 이연복 쉐프님은 쥐똥고추를 말씀하셨는데 저는 없어서 매운 청양홍고추를 사용했습니다.<br>;
<br><img width="500px" src="images/cook/cook15_detail02.png"><br>;
<br>2.후추를 제외한 양념은 미리 한곳에 섞어 줍니다<br>;
<br><img width="500px" src="images/cook/cook15_detail03.png"><br>;
<br>3.달궈진 팬에 기름 약간 두르고 만두를 약불에서 노릇하게 구워 주세요.<br>;
<br><img width="500px" src="images/cook/cook15_detail04.png"><br>;
<br>4.만두가 다 구워지면 한쪽에 밀어두고 다른 한켠에서 대파,다진마늘,매운홍고추를 넣고 볶다가 만두와 섞어 줍니다.<br>;
<br><img width="500px" src="images/cook/cook15_detail05.png"><br>;
<br>5.준비해둔 양념에 후추약간과 물 3-4스푼을 넣어주고 재빨리 저어 살짝 졸여주면 끝!<br>
<br><img width="500px" src="images/cook/cook15_detail06.png"><br>;
<br>6.야식으로 추천드리고 싶은 이연복쉐프님 깐풍만두 완성입니다.<br>',
'야식',
462,
'images/cook/cook15.png',
'만두 10개,대파 1대,쥐똥고추(or청양고추) 기호에맞게,다진마늘 1T',
'간장 1T,설탕 1T,식초 2T,물엿 1/2T,후추 톡톡'
);




insert into COOK values(COOKSEQ.NEXTVAL,
'항정살 된장구이 샐러드',
'images/cook/cook16_detail.png',
'<br><img width="500px" src="images/cook/cook16_detail01.png"><br>;
<br>1.먼저 분량의 양념을 볼에 넣어 준비합니다.<br>;
<br><img width="500px" src="images/cook/cook16_detail02.png"><br>;
<br>2.준비해놓은 항정살을 양념볼에 넣고 조물조물 양념이 베이도록 해주세요.<br>;
<br><img width="500px" src="images/cook/cook16_detail03.png"><br>;
<br>3.이대로 냉장고에 30분이상 재어놓습니다.<br>;
<br><img width="500px" src="images/cook/cook16_detail04.png"><br>;
<br>4.가열 된 팬에 종이호일을 깔고 중약불에 구워주기 시작해요.<br>;
<br><img width="500px" src="images/cook/cook16_detail05.png"><br>;
<br>5.양념이 된 고기라 쉽게 탈 수 있으니 종이호일을 깔고 타지않게 잘 뒤집어가며 속까지 잘 익혀주세요.<br>
<br><img width="500px" src="images/cook/cook16_detail06.png"><br>;
<br>6.샐러드 야채를 접시에 담아내고 구워낸 항정살구이를 올려주면 완성!<br>',
'술안주',
1056,
'images/cook/cook16.png',
'항정살 400g,양상추(샐러드채소)',
'된장 1T,간장 2T,맛술 2T,올리고당 2T,설탕 1T,다진마늘 0.5T,참기름 1T,후추 조금'
);



insert into COOK values(COOKSEQ.NEXTVAL,
'참치 알리올리오 볶음밥',
'images/cook/cook17_detail.png',
'<br><img width="500px" src="images/cook/cook17_detail01.png"><br>;
<br>1.팬에 올리브유를 두르고 팬이 달궈지면 얇게 채 썬 마늘을 넣고 볶아주세요.<br>;
<br><img width="500px" src="images/cook/cook17_detail02.png"><br>;
<br>2.마늘이 익는 동안 달걀을 곱게 풀고 굴소스 1큰술 또는 소금을 넣어 한번 더 섞어주세요.<br>;
<br><img width="500px" src="images/cook/cook17_detail03.png"><br>;
<br>3.마늘이 노릇노릇하게 익으면 밥을 넣고 볶아줍니다.<br>;
<br><img width="500px" src="images/cook/cook17_detail04.png"><br>;
<br>4.밥이 어느 정도 볶아지면 참치를 넣어 볶아주세요.<br>;
<br><img width="500px" src="images/cook/cook17_detail05.png"><br>;
<br>5.참치까지 고루 볶아지면 달걀을 넣고 여러번 뒤적거려 줍니다. 달걀이 다 익으면 완성!<br>
<br><img width="500px" src="images/cook/cook17_detail06.png"><br>;
<br>6.완성된 참치 알리올리오 볶음밥입니다~<br>',
'일상',
553,
'images/cook/cook17.png',
'밥 1공기,마늘 5개,참치 2스푼,올리브유 약간,달걀 1개',
'소금 약간'
);



insert into COOK values(COOKSEQ.NEXTVAL,
'배추 된장 들깨무침',
'images/cook/cook18_detail.png',
'<br><img width="500px" src="images/cook/cook18_detail01.png"><br>;
<br>1.배추는 한잎한잎 떼어서 깨끗히 씻어서 준비하고 반을 잘라서 준비해주세요..<br>;
<br><img width="500px" src="images/cook/cook18_detail02.png"><br>;
<br>2.끓는물에 배추 줄기부분부터 넣어서 데쳐준후 아랫잎쪽도 넣어서 데쳐주세요..<br>;
<br><img width="500px" src="images/cook/cook18_detail03.png"><br>;
<br>3.찬물에 재빨리 넣어 헹궈준후 슬쩍~짜서 물기 제거해주세요..<br>;
<br><img width="500px" src="images/cook/cook18_detail04.png"><br>;
<br>4.배추는 겹쳐서 준비한후 한입크기로 썰어서 준비<br>;
<br><img width="500px" src="images/cook/cook18_detail05.png"><br>;
<br>5.볼에 된장 1ts+참기름 1ts+들깨 1Ts를 넣고 잘섞어준후~ 어른들이 먹을꺼면 여기에 다진마늘 1/2ts을 넣으면 더 맛나지요.<br>
<br><img width="500px" src="images/cook/cook18_detail06.png"><br>;
<br>6.된장에 배추를 넣고~ 조물조물 버무려주면 완성!<br>',
'다이어트',
28,
'images/cook/cook18.png',
'배추 10장',
'된장 1ts,들깨 1ts,참기름 1ts'
);



insert into COOK values(COOKSEQ.NEXTVAL,
'브로콜리새우 샐러드',
'images/cook/cook19_detail.png',
'<br><img width="500px" src="images/cook/cook19_detail01.png"><br>;
<br>1.브로콜리는 먹기좋은 크기로 떼어내 씻어준후 끓는물에 소금을 조금 넣고 살짝 데쳐내 물기를 빼줍니다.<br>;
<br><img width="500px" src="images/cook/cook19_detail02.png"><br>;
<br>2.칵테일 새우는 깨끗이씻어, 끓는물에 삶아준비합니다.<br>;
<br><img width="500px" src="images/cook/cook19_detail03.png"><br>;
<br>3.드레싱재료를 모두 섞어 냉장고에 시원하게 보관해둡니다.<br>;
<br><img width="500px" src="images/cook/cook19_detail04.png"><br>;
<br>4.데쳐논 브로콜리와칵테일 새우를 접시에 답고, 만들어놓은 요구르트 드레싱을 솔솔 뿌려줍니다.<br>',
'다이어트',
214,
'images/cook/cook19.png',
'브로콜리 1.5컵,칵테일새우 1컵,소금 약간,후춧가루 약간',
'우유 7큰술,올리브오일 1t,검은깨 2t,식초 1큰술,설탕 1큰술,마요네즈 2큰술'
);



insert into COOK values(COOKSEQ.NEXTVAL,
'캔옥수수 치즈범벅',
'images/cook/cook20_detail.png',
'<br><img width="500px" src="images/cook/cook20_detail01.png"><br>;
<br>1.전자렌지 사용가능 용기에 캔옥수수 3스푼듬뿍,마요네즈한스푼,설탕 반스푼 넣어 주세요.<br>;
<br><img width="500px" src="images/cook/cook20_detail02.png"><br>;
<br>2.좀더 진한 치즈맛을 위해 파마산 치즈가루(생략가능)도 3번 톡톡 해주시고 비벼 주세요.<br>;
<br><img width="500px" src="images/cook/cook20_detail03.png"><br>;
<br>3.마지막으로 체다치즈 한장 올려서 전자렌지에 40초 정도 돌려 주심 끝~~~~!!<br>;
<br><img width="500px" src="images/cook/cook20_detail04.png"><br>;
<br>4.요렇게 잘녹은 치즈를
여러번 비벼서 진득 진득 하게 드시면 됩니당^^<br>;
<br><img width="500px" src="images/cook/cook20_detail05.png"><br>;
<br>5.내일이면 주말인데 나른한 휴일 더운데 밖에 나가시는것 보다 시원한 에어컨 밑에서 쇼파에 누워 맛난 간식과 함께 영화 한편 어떠셔용~ㅎㅎ<br>',
'초스피드',
288,
'images/cook/cook20.png',
'캔옥수수 3T,마요네즈 1T,체다치즈 1장',
'설탕 1/2T,파마산치즈가루(생략가능) 3번톡톡'
);

--SELECT * FROM COOK;
-- ================================================== --


-- ================== [ DELIVERY ] ================== --
-- ===================== SHOP TB ==================== --
INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'옹브레드',
'서울특별시 강남구 역삼동 테헤란로22길 15',
37.499016,
127.035405,
'역삼 브런치 가벼운 저녁으로 좋은 카페',
'샌드위치',
4.1,
'02-566-1253',
'오전 7:30~오후 9:00',
'images/delivery/delivery01.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'바스버거',
'서울특별시 강남구 역삼동 736-55',
37.499623,
127.035806,
'좋은 분위기와 만족스러운 수제버거, 수제맥주로 즐거운 경험을 드리겠습니다.',
'햄버거',
4.3,
'02-568-6654',
'오전 11:00~오후 10:30',
'images/delivery/delivery02.png'
);



INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'샐러디',
'서울특별시 강남구 역삼동 논현로85길 13',
37.499069,
127.036246,
'간편하게 테이크아웃 가능한 샐러드 역삼 맛집',
'샐러드샵',
3.6,
'02-565-4066',
'오전 8:00~오후 9:00',
'images/delivery/delivery03.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'리밍',
'서울특별시 강남구 역삼동 테헤란로37길 27',
37.503978,
127.040094,
'안녕하세요 역삼동에 위치한 리밍입니다. 문의사항은 전화주세요',
'중국 음식점',
3.8,
'02-538-1115',
'오전 11:30~오후 9:30',
'images/delivery/delivery04.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'보드람치킨',
'서울특별시 강남구 역삼동 테헤란로20길 13',
37.498862,
127.034600,
'보드람 치킨은 매일 매일 신선한 재료로 만든 양념을 엄격한 선별과정을 통과한 35일된 
국내산 프레쉬 영계에 정성을 다해 직접 고기살에 고르게 베이게 하여 숙성시켜 공급하고 있습니다.',
'치킨',
3.8,
'02-568-5001',
'오후 2:00~오전 4:00',
'images/delivery/delivery05.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'송희네 족발',
'서울특별시 강남구 역삼동 역삼로 138',
37.494167,
127.034677,
'안녕하세요 송희네한방왕족발입니다.
저희 송희네에서는 건강한먹거리를위해
항상노력하고있습니다 ^^',
'족발/보쌈',
4.2,
'02-508-7992',
'오전 11:00~오전 12:00',
'images/delivery/delivery06.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'프로마치',
'서울특별시 성북구 안암동 인촌로24가길 13',
37.585378,
127.030120,
'안녕하세요. 서울시 성북구 안암동에 위치한 프로마치입니다.',
'서양음식',
4.2,
'070-4038-8537',
'오전 11:00~오후 9:00',
'images/delivery/delivery07.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'봉추찜닭',
'서울특별시 성북구 안암동5가 101-46',
37.586090,
127.029639,
'봉추찜닭은 안동지방에서 몇 십년 전부터 내려오는 요리를 바탕으로, 
현대인의 입맛에 맞게 양념과 소스를 업그레이드 시킨 퓨전음식입니다.',
'찜닭집',
3.8,
'02-922-6981',
'오전 11:00~오후 10:00',
'images/delivery/delivery08.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'고른햇살',
'서울특별시 성북구 안암동5가 개운사길 27',
37.587494,
127.029088,
'고려대학교 인근에 있는 분식점입니다. 흑미를 넣어 지은 밥을 넣어 두툼하게 말아주는 참치 김밥과 
모짜렐라 치즈를 듬뿍 얹어주는 치즈 라볶이, 이 두 가지 메뉴가 가장 인기인데요. 인근에서 학생들이 즐겨 찾는 곳입니다.',
'분식',
4.5,
'02-953-3394',
'오전 6:00~오후 11:30',
'images/delivery/delivery09.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'오샬',
'서울특별시 성북구 안암동5가 인촌로24길 6',
37.585957,
127.029198,
'뷔페 처럼 1인1세트 주문시 인도커리와 라이스 그리고 NAAN 까지 
모두 리필 해드리는 알찬 세트 메뉴로 손님들의 테이블을 제대로 챙겨 드리겠습니다.',
'인도 레스토랑',
4.1,
'02-6084-6527',
'오전 11:00~오후 9:30',
'images/delivery/delivery10.png'
);



INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'홍콩반점0410',
'서울특별시 성북구 성북구 안암동5가',
37.601040,
127.035474,
'안녕하세요 홍콩반점 성복점입니다.',
'중국 음식점',
4.1,
'02-6084-8864',
'오전 11:00~오후 9:00',
'images/delivery/delivery11.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'죠스떡볶이고대점',
'서울특별시 성북구 안암동 인촌로24길 63',
37.583319,
127.029593,
'생방송아침이좋다 475회',
'분식',
3.5,
'02-929-1525',
'오전 11:00~오전 12:00',
'images/delivery/delivery12.png'
);



INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'두리닭발',
'서울특별시 관악구 남현동 남현3길 78',
37.475357,
126.980829,
'안녕하세요 항상 좋은 재료 와 친절한 서비스로 누구나
맛있게 매운맛을 즐길 수 있도록 노력하겠습니다.',
'닭발',
4.3,
'02-6339-8035',
'오후 4:00~오전 2:00',
'images/delivery/delivery13.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'토시래사당역점',
'서울특별시 서초구 방배천로4길 12',
37.477953,
126.983349,
'족발과 보쌈의 명가, 토시래 사당역점
넓은 단체석도 구비되어 모임 으로도 좋습니다!',
'족발',
3.4,
'02-525-7825',
'오후 1:00~오전 1:00',
'images/delivery/delivery14.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'지코바치킨 사당1호점',
'서울특별시 동작구 사당동 419-146',
37.477966,
126.977013,
'야식이 그리울 때는 지코바 치킨으로 중독성 쩌는 맛으로 드디어 사당점도 탄생했습니다.',
'치킨',
3.6,
'02-583-9245',
'오후 12:00~오전 12:00',
'images/delivery/delivery15.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'토라카레',
'서울특별시 관악구 남현동 남부순환로272길 10',
37.476056,
126.978206,
'매일 11:30 - 21:30♥토라카레 식사 가능시간♥ (마지막주문은 21:00까지 입니다~)
매일 11:30 - 00:00♥토라 술안주 판매시간♥ (술 드실 분들은 21:00전까지 오셔야되요~)',
'카레',
3.6,
'02-588-5705',
'오전 11:30~오후 9:00',
'images/delivery/delivery16.png'
);



INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'롯데리아 사당점',
'서울특별시 서초구 방배2동 동작대로 24',
37.478608,
126.982137,
'안녕하세요. 롯데리아 사당점입니다.',
'햄버거',
3.5,
'02-522-3530',
'24시간 영업',
'images/delivery/delivery17.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'피쉬 퓨전회포차',
'서울특별시 동작구 사당1동 1031-44',
37.479812,
126.981102,
'저렴한 가격에 자연산 회를 맛보실 수 있습니다.',
'회',
3.7,
'02-6083-2898',
'오후 4:00~오전 2:30',
'images/delivery/delivery18.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'북경',
'경기도 성남시 분당구 구미1동 미금일로74번길 7',
37.346489,
127.111508,
'안녕하세요. 북경 구미본점 입니다.',
'중국 음식점',
3.7,
'031-718-8200',
'오전 11:00~오후 9:00',
'images/delivery/delivery19.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'아웃백스테이크하우스 분당미금점',
'경기도 성남시 분당구 구미동 돌마로 46',
37.349662,
127.106963,
'아웃백 스테이크하우스는 전 세계 21개국 1,000여 개 매장을 보유한 
세계적인 캐주얼 다이닝 스테이크 레스토랑 브랜드입니다. 호주 대 자연의 아름다움과 따뜻함을 느낄 수 있는 매장 인테리어와 함께 홈메이드 방식으로 조리되는 신선하고 풍부한 메뉴를 만날 수 있습니다.',
'패밀리레스토랑',
3.8,
'050-71306-1741',
'오전 11:30~오후 9:30',
'images/delivery/delivery20.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'장인족발608',
'경기도 성남시 분당구 구미동 182',
37.340361,
127.109951,
'장인족발608은 오산에서부터 시작되어 줄을 서서 먹을 정도로 유명한,
장인의 정신이 담겨있는 족발 전문점입니다.',
'족발/보쌈',
4.2,
'031-713-5888',
'오후 5:00~오전 12:00',
'images/delivery/delivery21.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'슈퍼맵짱떡볶이',
'경기도 용인시 기흥구 동백동 동백3로11번길',
37.270291,
127.153021,
'스트레스 날려주는 베스트 푸드!
테이크아웃 / 배달 전문~',
'분식',
4.3,
'031-285-1253',
'오전 11:00~오전 1:00',
'images/delivery/delivery22.png'
);



INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'큰맘할매순대국',
'경기도 용인시 수지구 죽전동 1177-1번지',
37.331965,
127.121692,
'안녕하세요. 큰맘할매순대국 입니다.',
'한식당',
3.8,
'031-898-0399',
'24시간 영업',
'images/delivery/delivery23.png'
);


INSERT INTO SHOP VALUES(
SHOPSEQ.NEXTVAL,
'분식쎈타',
'경기도 성남시 분당구 정자동 성남대로331번길 9-3',
37.365261,
127.107082,
'안녕하십니까! 정자동 분식쎈타입니다.
방과 후 국민학교 앞에 있던 떡볶이 집의 맛이 그리웠습니다.
매일 아침 직접 장보는 좋은 재료로 만든 분식을 추억과 함께 드립니다.',
'분식',
3.3,
'031-726-4862',
'오전 11:00~오후 11:00',
'images/delivery/delivery24.png'
);

--SELECT * FROM SHOP;
-- ================================================== --
-- ===================== MENU TB ==================== --
INSERT INTO MENU VALUES(
1,MENUSEQ.NEXTVAL,'크리미 에그 샌드위치',5500,348, 'images/delivery/delivery01_detail01.png');
INSERT INTO MENU VALUES(
1,MENUSEQ.NEXTVAL,'바질페스토 치킨 샌드위치',6700,326, 'images/delivery/delivery01_detail02.png');
INSERT INTO MENU VALUES(
1,MENUSEQ.NEXTVAL,'B.L.T.C 샌드위치',6500,344, 'images/delivery/delivery01_detail03.png');
INSERT INTO MENU VALUES(
1,MENUSEQ.NEXTVAL,'햄치즈&페스토 파니니',10500,286, 'images/delivery/delivery01_detail04.png');


INSERT INTO MENU VALUES(
2,MENUSEQ.NEXTVAL,'바스 버거 세트',8800,600, 'images/delivery/delivery02_detail01.png');
INSERT INTO MENU VALUES(
2,MENUSEQ.NEXTVAL,'바스치킨 버거 세트',9900,597, 'images/delivery/delivery02_detail02.png');
INSERT INTO MENU VALUES(
2,MENUSEQ.NEXTVAL,'하와이안 버거 세트',10200,689, 'images/delivery/delivery02_detail03.png');
INSERT INTO MENU VALUES(
2,MENUSEQ.NEXTVAL,'칠면조 버거 세트',11200,712, 'images/delivery/delivery02_detail04.png');


INSERT INTO MENU VALUES(
3,MENUSEQ.NEXTVAL,'칠리베이컨 웜볼',7600,189, 'images/delivery/delivery03_detail01.png');
INSERT INTO MENU VALUES(
3,MENUSEQ.NEXTVAL,'우삼겹 웜볼',8100,216, 'images/delivery/delivery03_detail02.png');
INSERT INTO MENU VALUES(
3,MENUSEQ.NEXTVAL,'멕시칸 랩',6500,146, 'images/delivery/delivery03_detail03.png');
INSERT INTO MENU VALUES(
3,MENUSEQ.NEXTVAL,'단호박두부 웜볼',7600,147, 'images/delivery/delivery03_detail04.png');


INSERT INTO MENU VALUES(
4,MENUSEQ.NEXTVAL,'짜장면',6000,870, 'images/delivery/delivery04_detail01.png');
INSERT INTO MENU VALUES(
4,MENUSEQ.NEXTVAL,'탕짜면',9500,1116, 'images/delivery/delivery04_detail02.png');
INSERT INTO MENU VALUES(
4,MENUSEQ.NEXTVAL,'짬뽕',7500,800, 'images/delivery/delivery04_detail03.png');
INSERT INTO MENU VALUES(
4,MENUSEQ.NEXTVAL,'간짜장',7500,920, 'images/delivery/delivery04_detail04.png');


INSERT INTO MENU VALUES(
5,MENUSEQ.NEXTVAL,'후라이드치킨',17000,1500, 'images/delivery/delivery05_detail01.png');
INSERT INTO MENU VALUES(
5,MENUSEQ.NEXTVAL,'반반치킨（후라이드 반＋양념 반）',18000,1750, 'images/delivery/delivery05_detail02.png');
INSERT INTO MENU VALUES(
5,MENUSEQ.NEXTVAL,'순살반반세트（후라이드 반＋양념 반＋치킨무＋콜라）',18000,1700, 'images/delivery/delivery05_detail03.png');
INSERT INTO MENU VALUES(
5,MENUSEQ.NEXTVAL,'순살후라이드치킨',17000,1400, 'images/delivery/delivery05_detail04.png');


INSERT INTO MENU VALUES(
6,MENUSEQ.NEXTVAL,'한방 왕족발 小',25000,750, 'images/delivery/delivery06_detail01.png');
INSERT INTO MENU VALUES(
6,MENUSEQ.NEXTVAL,'한방 왕족발 中',28000,1406, 'images/delivery/delivery06_detail02.png');
INSERT INTO MENU VALUES(
6,MENUSEQ.NEXTVAL,'한방 왕족발 大',33000,1950, 'images/delivery/delivery06_detail03.png');
INSERT INTO MENU VALUES(
6,MENUSEQ.NEXTVAL,'쟁반막국수',10000,397, 'images/delivery/delivery06_detail04.png');


INSERT INTO MENU VALUES(
7,MENUSEQ.NEXTVAL,'버섯 스프 세트（버섯 스프＋파니니）',8100,416, 'images/delivery/delivery07_detail01.png');
INSERT INTO MENU VALUES(
7,MENUSEQ.NEXTVAL,'드링크 세트（음료택1＋파니니）',6700,411, 'images/delivery/delivery07_detail02.png');
INSERT INTO MENU VALUES(
7,MENUSEQ.NEXTVAL,'페스토 치킨（샌드위치）',8400,326, 'images/delivery/delivery07_detail03.png');
INSERT INTO MENU VALUES(
7,MENUSEQ.NEXTVAL,'토마토 스프 세트（토마토 스프＋샌드위치）',8100,328, 'images/delivery/delivery07_detail04.png');


INSERT INTO MENU VALUES(
8,MENUSEQ.NEXTVAL,'봉추찜닭 小（2인기준）',20000,481, 'images/delivery/delivery08_detail01.png');
INSERT INTO MENU VALUES(
8,MENUSEQ.NEXTVAL,'봉추찜닭 中（3인기준）',30000,690, 'images/delivery/delivery08_detail02.png');
INSERT INTO MENU VALUES(
8,MENUSEQ.NEXTVAL,'봉추찜닭 大（4인기준）',40000,1097, 'images/delivery/delivery08_detail03.png');
INSERT INTO MENU VALUES(
8,MENUSEQ.NEXTVAL,'당면사리',2000,78, 'images/delivery/delivery08_detail04.png');


INSERT INTO MENU VALUES(
9,MENUSEQ.NEXTVAL,'참치마요김밥',3500,570, 'images/delivery/delivery09_detail01.png');
INSERT INTO MENU VALUES(
9,MENUSEQ.NEXTVAL,'치즈라볶이',4500,720, 'images/delivery/delivery09_detail02.png');
INSERT INTO MENU VALUES(
9,MENUSEQ.NEXTVAL,'토종순대',4000,430, 'images/delivery/delivery09_detail03.png');
INSERT INTO MENU VALUES(
9,MENUSEQ.NEXTVAL,'라볶이',4000,686, 'images/delivery/delivery09_detail04.png');


INSERT INTO MENU VALUES(
10,MENUSEQ.NEXTVAL,'CHICKEN MAKHANI SET（치킨마크니 커리 도시락세트）',10000,525, 'images/delivery/delivery10_detail01.png');
INSERT INTO MENU VALUES(
10,MENUSEQ.NEXTVAL,'LAMB CHILLI KADAI SET（양고기 칠리커리 도시락세트）',10500,670, 'images/delivery/delivery10_detail02.png');
INSERT INTO MENU VALUES(
10,MENUSEQ.NEXTVAL,'TIKKA MASALA SET（치킨 티카마샬라커리 도시락세트）',10000,589, 'images/delivery/delivery10_detail03.png');
INSERT INTO MENU VALUES(
10,MENUSEQ.NEXTVAL,'BEEF BALTI SET（쇠고기커리 도시락세트）',10000,643, 'images/delivery/delivery10_detail04.png');


INSERT INTO MENU VALUES(
11,MENUSEQ.NEXTVAL,'짜장면＋탕수육（소)',15500,1300, 'images/delivery/delivery11_detail01.png');
INSERT INTO MENU VALUES(
11,MENUSEQ.NEXTVAL,'짜장면',4500,870, 'images/delivery/delivery11_detail02.png');
INSERT INTO MENU VALUES(
11,MENUSEQ.NEXTVAL,'짬뽕＋탕수육（소)',16500,1290, 'images/delivery/delivery11_detail03.png');
INSERT INTO MENU VALUES(
11,MENUSEQ.NEXTVAL,'짜장밥',6500,921, 'images/delivery/delivery11_detail04.png');


INSERT INTO MENU VALUES(
12,MENUSEQ.NEXTVAL,'트윈세트',13500,950, 'images/delivery/delivery12_detail01.png');
INSERT INTO MENU VALUES(
12,MENUSEQ.NEXTVAL,'죠스떡볶이',3000,320, 'images/delivery/delivery12_detail02.png');
INSERT INTO MENU VALUES(
12,MENUSEQ.NEXTVAL,'수제튀김 대',6500,460, 'images/delivery/delivery12_detail03.png');
INSERT INTO MENU VALUES(
12,MENUSEQ.NEXTVAL,'치즈떡볶이',4500,417, 'images/delivery/delivery12_detail04.png');


INSERT INTO MENU VALUES(
13,MENUSEQ.NEXTVAL,'직화 무뼈닭발세트',21000,840, 'images/delivery/delivery13_detail01.png');
INSERT INTO MENU VALUES(
13,MENUSEQ.NEXTVAL,'국물 닭발세트',20000,710, 'images/delivery/delivery13_detail02.png');
INSERT INTO MENU VALUES(
13,MENUSEQ.NEXTVAL,'무뼈국물닭발세트 중',22000,700, 'images/delivery/delivery13_detail03.png');
INSERT INTO MENU VALUES(
13,MENUSEQ.NEXTVAL,'직화무뼈닭발 중',16000,640, 'images/delivery/delivery13_detail04.png');


INSERT INTO MENU VALUES(
14,MENUSEQ.NEXTVAL,'반반세트大（족발＋매운족발)',39000,1490, 'images/delivery/delivery14_detail01.png');
INSERT INTO MENU VALUES(
14,MENUSEQ.NEXTVAL,'토시래족발（大)',36000,1440, 'images/delivery/delivery14_detail02.png');
INSERT INTO MENU VALUES(
14,MENUSEQ.NEXTVAL,'토시래족발（中)',32000,750, 'images/delivery/delivery14_detail03.png');
INSERT INTO MENU VALUES(
14,MENUSEQ.NEXTVAL,'냉채족발中',35000,974, 'images/delivery/delivery14_detail04.png');


INSERT INTO MENU VALUES(
15,MENUSEQ.NEXTVAL,'순살양념（보통맛)',20000,1500, 'images/delivery/delivery15_detail01.png');
INSERT INTO MENU VALUES(
15,MENUSEQ.NEXTVAL,'순살양념（반마리）＋음료＋햇반',14000,1254, 'images/delivery/delivery15_detail02.png');
INSERT INTO MENU VALUES(
15,MENUSEQ.NEXTVAL,'순살양념（순한맛)',20000,1930, 'images/delivery/delivery15_detail03.png');
INSERT INTO MENU VALUES(
15,MENUSEQ.NEXTVAL,'순살양념（매운맛)',20000,1921, 'images/delivery/delivery15_detail04.png');


INSERT INTO MENU VALUES(
16,MENUSEQ.NEXTVAL,'토라 대표1',11500,540, 'images/delivery/delivery16_detail01.png');
INSERT INTO MENU VALUES(
16,MENUSEQ.NEXTVAL,'토라포크버섯카레국밥',8500,632, 'images/delivery/delivery16_detail02.png');
INSERT INTO MENU VALUES(
16,MENUSEQ.NEXTVAL,'토라닭가라아게카레',8000,734, 'images/delivery/delivery16_detail03.png');
INSERT INTO MENU VALUES(
16,MENUSEQ.NEXTVAL,'소스카츠동（돈까스덮밥)',7500,796, 'images/delivery/delivery16_detail04.png');


INSERT INTO MENU VALUES(
17,MENUSEQ.NEXTVAL,'불고기버거세트',7000,1128, 'images/delivery/delivery17_detail01.png');
INSERT INTO MENU VALUES(
17,MENUSEQ.NEXTVAL,'핫크리스피버거세트',7800,1298, 'images/delivery/delivery17_detail02.png');
INSERT INTO MENU VALUES(
17,MENUSEQ.NEXTVAL,'새우버거세트',7000,1043, 'images/delivery/delivery17_detail03.png');
INSERT INTO MENU VALUES(
17,MENUSEQ.NEXTVAL,'모짜렐라인더 버거-베이컨 세트',8800,1377, 'images/delivery/delivery17_detail04.png');


INSERT INTO MENU VALUES(
18,MENUSEQ.NEXTVAL,'모둠사시미회 中（참다랑어뱃살＋도로＋광어＋연어＋우럭)',35000,654, 'images/delivery/delivery18_detail01.png');
INSERT INTO MENU VALUES(
18,MENUSEQ.NEXTVAL,'광어＋우럭 (1~2人)',25000,499, 'images/delivery/delivery18_detail02.png');
INSERT INTO MENU VALUES(
18,MENUSEQ.NEXTVAL,'산낙지',10000,322, 'images/delivery/delivery18_detail03.png');
INSERT INTO MENU VALUES(
18,MENUSEQ.NEXTVAL,'광어＋연어 (1~2人)',25000,476, 'images/delivery/delivery18_detail04.png');


INSERT INTO MENU VALUES(
19,MENUSEQ.NEXTVAL,'짜장면',6000,870, 'images/delivery/delivery19_detail01.png');
INSERT INTO MENU VALUES(
19,MENUSEQ.NEXTVAL,'알뜰셋트1（탕수육小＋짜장1)',17000,1096, 'images/delivery/delivery19_detail02.png');
INSERT INTO MENU VALUES(
19,MENUSEQ.NEXTVAL,'간짜장',6500,978, 'images/delivery/delivery19_detail03.png');
INSERT INTO MENU VALUES(
19,MENUSEQ.NEXTVAL,'짬뽕',7000,921, 'images/delivery/delivery19_detail04.png');


INSERT INTO MENU VALUES(
20,MENUSEQ.NEXTVAL,'투움바 파스타',22900,749, 'images/delivery/delivery20_detail01.png');
INSERT INTO MENU VALUES(
20,MENUSEQ.NEXTVAL,'아웃백스페셜 갈릭서로인 스테이크',30900,983, 'images/delivery/delivery20_detail02.png');
INSERT INTO MENU VALUES(
20,MENUSEQ.NEXTVAL,'베이비 백립',35900,992, 'images/delivery/delivery20_detail03.png');
INSERT INTO MENU VALUES(
20,MENUSEQ.NEXTVAL,'비프퀘사디아',15900,328, 'images/delivery/delivery20_detail04.png');


INSERT INTO MENU VALUES(
21,MENUSEQ.NEXTVAL,'족발 大（앞다리)',35000,1490, 'images/delivery/delivery21_detail01.png');
INSERT INTO MENU VALUES(
21,MENUSEQ.NEXTVAL,'족발 中（뒷다리)',30000,1049, 'images/delivery/delivery21_detail02.png');
INSERT INTO MENU VALUES(
21,MENUSEQ.NEXTVAL,'보쌈 中',30000,980, 'images/delivery/delivery21_detail03.png');
INSERT INTO MENU VALUES(
21,MENUSEQ.NEXTVAL,'쟁반국수',13000,430, 'images/delivery/delivery21_detail04.png');


INSERT INTO MENU VALUES(
22,MENUSEQ.NEXTVAL,'맵짱세트A（맵떡or맵뎅or맵반＋계란＋모듬튀김＋계란찜＋쿨피스 930mL)',17000,1054, 'images/delivery/delivery22_detail01.png');
INSERT INTO MENU VALUES(
22,MENUSEQ.NEXTVAL,'맵떡＋계란찜',13000,860, 'images/delivery/delivery22_detail02.png');
INSERT INTO MENU VALUES(
22,MENUSEQ.NEXTVAL,'맵짱세트B（맵떡or맵뎅or맵반＋계란＋모듬튀김＋김가루 컴밥＋계란찜＋쿨피스 930mL)',19000,1196, 'images/delivery/delivery22_detail03.png');
INSERT INTO MENU VALUES(
22,MENUSEQ.NEXTVAL,'맵짱 우삼겹 떡볶이＋야채사리＋계란찜',16000,1099, 'images/delivery/delivery22_detail04.png');


INSERT INTO MENU VALUES(
23,MENUSEQ.NEXTVAL,'순대국（특)',8000,898, 'images/delivery/delivery23_detail01.png');
INSERT INTO MENU VALUES(
23,MENUSEQ.NEXTVAL,'뼈해장국',9000,788, 'images/delivery/delivery23_detail02.png');
INSERT INTO MENU VALUES(
23,MENUSEQ.NEXTVAL,'수육국밥（특)',8000,922, 'images/delivery/delivery23_detail03.png');
INSERT INTO MENU VALUES(
23,MENUSEQ.NEXTVAL,'얼큰버섯순대국',8000,833, 'images/delivery/delivery23_detail04.png');


INSERT INTO MENU VALUES(
24,MENUSEQ.NEXTVAL,'찹쌀순대＋내장',3500,455, 'images/delivery/delivery24_detail01.png');
INSERT INTO MENU VALUES(
24,MENUSEQ.NEXTVAL,'국물떡볶이',3000,318, 'images/delivery/delivery24_detail02.png');
INSERT INTO MENU VALUES(
24,MENUSEQ.NEXTVAL,'쎄트 1.（떡볶이＋순대＋튀김B5개＋오뎅2개)',10000,798, 'images/delivery/delivery24_detail03.png');
INSERT INTO MENU VALUES(
24,MENUSEQ.NEXTVAL,'쎄트 2.（떡볶이＋순대＋튀김모듬＋오뎅2개＋음료 中 택1)',12000,988, 'images/delivery/delivery24_detail04.png');

--SELECT * FROM MENU;
-- ================================================== --
-- ================================================== --


-- ============= COMMUNITY( BOARDS ) TB ============= --


--SELECT * FROM COMMUNITY;
-- ================================================== --


-- ================== [ COMMENT ] =================== --
-- ========= CULTURE & DELIVERY COMMENT TB ========== --


--SELECT * FROM MDCOMMENT;
-- ================================================== --
-- ============= COMMUNITY COMMENT TB =============== --


--SELECT * FROM CCOMMENT;
-- ================================================== --
-- ================================================== --








