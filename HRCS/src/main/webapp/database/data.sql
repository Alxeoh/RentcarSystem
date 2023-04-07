INSERT INTO vehicle VALUES ('S/01', '150하 3421', '모닝', '1', 0);
INSERT INTO vehicle VALUES ('S/02', '320하 1402', '스파크', '1', 0);
INSERT INTO vehicle VALUES ('S/03', '410하 2322', '레이', '1', 0);
INSERT INTO vehicle VALUES ('S/04', '220하 4399', '캐스퍼', '1', 0);
INSERT INTO vehicle VALUES ('M/01', '140하 9520', '쏘나타', '1', 0);
INSERT INTO vehicle VALUES ('M/02', '513하 4402', 'k5', '1', 0);
INSERT INTO vehicle VALUES ('M/03', '240허 5092', '스팅어', '1', 0);
INSERT INTO vehicle VALUES ('M/04', '438허 4032', '아이오닉6', '1', 0);
INSERT INTO vehicle VALUES ('M/05', '332허 2923', '말리부', '1', 0);
INSERT INTO vehicle VALUES ('V/01', '192허 5039', '투싼', '1', 0);
INSERT INTO vehicle VALUES ('V/02', '239허 2203', '팰리세이드', '1', 0);
INSERT INTO vehicle VALUES ('V/03', '420허 3306', '체로키', '1', 0);
INSERT INTO vehicle VALUES ('V/04', '360허 3291', '렉스턴', '1', 0);
INSERT INTO vehicle VALUES ('V/05', '320허 2840', '랭글러' , '1', 0);


INSERT INTO location VALUES('seo1','잠실');
INSERT INTO location VALUES('seo2','명동');
INSERT INTO location VALUES('seo3','강남');
INSERT INTO location VALUES('seo4','서초');
INSERT INTO location VALUES('seo5','강동');


INSERT INTO client (client_id, client_pw, name)VALUES('admin','admin','관리자');
INSERT INTO client (client_id, client_pw, name)VALUES('10001','123','김대한');
INSERT INTO client (client_id, client_pw, name)VALUES('10002','123','오민국');
INSERT INTO client (client_id, client_pw, name)VALUES('10003','123','김코치');
INSERT INTO client (client_id, client_pw, name)VALUES('10004','123','최코디');
INSERT INTO client (client_id, client_pw, name)VALUES('10005','123','박명수');
INSERT INTO client (client_id, client_pw, name)VALUES('10006','123','유재석');
INSERT INTO client (client_id, client_pw, name)VALUES('10007','123','신동엽');
INSERT INTO client (client_id, client_pw, name)VALUES('10008','123','이영자');
INSERT INTO client (client_id, client_pw, name)VALUES('10009','123','이순신');
INSERT INTO client (client_id, client_pw, name)VALUES('10010','123','박진만');



INSERT INTO board(no, type, client_id, title, contents) VALUES(1, '2', 'admin', '공지사항 확인필수', '렌터카서비스를 찾아주신 고객님들께 감사의 말씀드리며, 몇가지 안내사항을 공지합니다. 홈페이지를 이용하시기전, 반드시 읽으신 후 이용하시길 바랍니다.');
INSERT INTO board(no, type, client_id, title, contents) VALUES(2, '1', '10001', '서비스 너무 좋네요', '여행가는길에 인기가 많은 브랜드길래 사용해봤는데 편하고 좋더라구요 잘이용했습니다~~~ ');
INSERT INTO board(no, type, client_id, title, contents) VALUES(3, '1', '10002', '즐거운 여행동반자', '안전하게 잘 다녀온게 좋은 차를 타고 가서 그런가봐요 ㅎㅎ 잘 덕분에 즐거운 여행이였습니다 ~~');
INSERT INTO board(no, type, client_id, title, contents) VALUES(4, '1', '10003', '급하게 이용했어요', '회사에서 급하게 외근나갈일 때문에 사용했는데 처리도 빠르고 바로 이용할 수 있어서 좋네요 ㅎ');
INSERT INTO board(no, type, client_id, title, contents) VALUES(5, '1', '10004', '동승자가 더 좋아하네요ㅎㅎㅎ', '와이프가 차가 너무 깨끗하다면서 좋아하니 여행내내 기분좋게 다녀왔습니다 꼭 후기 남기라고 해서 후기 남깁니다~ ㅋㅋ ');
INSERT INTO board(no, type, client_id, title, contents) VALUES(6, '1', '10005', '벚꽃 구경 다녀왔어요 ㅎ' , '벚꽃지기전에 나들이 한번 다녀왔습니다 렌트카 컨디션이 너무 좋네요 ㅎ 좋은 가격으로 잘 다녀왔어여~~~! 추천합니다!');
INSERT INTO board(no, type, client_id, title, contents) VALUES(7, '1', '10006', '재이용 후기입니당', '저번에 이용해보고 좋아서 또 이용했습니다ㅎ 여전히 차 상태가 너무 좋네요 관리 잘하시는 것 같습니다.');
INSERT INTO board(no, type, client_id, title, contents) VALUES(8, '2', 'admin', '성수기전 예약이 몰리고 있습니다!', '여러분들의 많은 응원과 관심 감사드립니다. 이번 연휴 안전운전하시고 좋은 여행되시길 바랍니다 ! -렌터카서비스 임직원일동-');
INSERT INTO board(no, type, client_id, title, contents) VALUES(10, '2', 'admin', '공지사항 확인필수', '렌터카서비스를 찾아주신 고객님들께 감사의 말씀드리며, 몇가지 안내사항을 공지합니다. 홈페이지를 이용하시기전, 반드시 읽으신 후 이용하시길 바랍니다.');
INSERT INTO board(no, type, client_id, title, contents) VALUES(11, '1', '10001', '서비스 너무 좋네요', '여행가는길에 인기가 많은 브랜드길래 사용해봤는데 편하고 좋더라구요 잘이용했습니다~~~ ');
INSERT INTO board(no, type, client_id, title, contents) VALUES(12, '1', '10002', '즐거운 여행동반자', '안전하게 잘 다녀온게 좋은 차를 타고 가서 그런가봐요 ㅎㅎ 잘 덕분에 즐거운 여행이였습니다 ~~');
INSERT INTO board(no, type, client_id, title, contents) VALUES(13, '1', '10003', '급하게 이용했어요', '회사에서 급하게 외근나갈일 때문에 사용했는데 처리도 빠르고 바로 이용할 수 있어서 좋네요 ㅎ');
INSERT INTO board(no, type, client_id, title, contents) VALUES(14, '1', '10004', '동승자가 더 좋아하네요ㅎㅎㅎ', '와이프가 차가 너무 깨끗하다면서 좋아하니 여행내내 기분좋게 다녀왔습니다 꼭 후기 남기라고 해서 후기 남깁니다~ ㅋㅋ ');
INSERT INTO board(no, type, client_id, title, contents) VALUES(15, '1', '10005', '벚꽃 구경 다녀왔어요 ㅎ' , '벚꽃지기전에 나들이 한번 다녀왔습니다 렌트카 컨디션이 너무 좋네요 ㅎ 좋은 가격으로 잘 다녀왔어여~~~! 추천합니다!');
INSERT INTO board(no, type, client_id, title, contents) VALUES(16, '1', '10006', '재이용 후기입니당', '저번에 이용해보고 좋아서 또 이용했습니다ㅎ 여전히 차 상태가 너무 좋네요 관리 잘하시는 것 같습니다.');
INSERT INTO board(no, type, client_id, title, contents) VALUES(17, '2', 'admin', '성수기전 예약이 몰리고 있습니다!', '여러분들의 많은 응원과 관심 감사드립니다. 이번 연휴 안전운전하시고 좋은 여행되시길 바랍니다 ! -렌터카서비스 임직원일동-');