--자유게시판 : 테이블 2개 (메인글 저장, 댓글저장)

create table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null,						-- 작성자
	password varchar(10) not null,					-- 글비밀번호
	subject varchar(40) not null,					-- 글제목
	content varchar(2000) not null,					-- 내용
	readCount int default 0,						-- 조회수
	wdate datetime default current_timestamp, 		-- 서버의 현재날짜/시간
	ip varchar(15) default '127.0.0.1',				-- 작성자 ip
	commentCount smallint default 0,				-- 댓글 갯수
	primary key(idx)
);
alter table freeboard modify column wdate timestamp
default current_timestamp;	 -- timezone에 따라 설정



insert into freeboard (name,password,subject,content,ip)
values ('honey','1111','웰컴~~','하이 반가워','192.168.17.3');
insert into freeboard (name,password,subject,content,ip)
values ('Sana','1111','Welcome to my space','Nice to meet ya','192.168.22.3');
insert into freeboard (name,password,subject,content,ip)
values ('Ashley','1111','Hello','Heyheyhey','192.168.23.3');
insert into freeboard (name,password,subject,content,ip)
values ('Josh','1111','Greetings','It is an honey to meet you all!','192.168.14.3');
insert into freeboard (name,password,subject,content,ip)
values ('Sasha','1111','Hey people!','Cannot wait til I meet you in person','192.168.12.3');
insert into freeboard (name,password,subject,content,ip)
values ('George','1111','wazzzzzzzzzup','bruh, wats up','192.168.54.3');

select * from freeboard;

-- mysql 에는 limit 키워드 : limit 번호, 갯수
-- mysql, oracle select 결과에 대해 각행에 순서대로 번호를 부여하는 컬럼(row num)
-- 이 만들어집니다. limit의 번호는 row num 입니다. (mysql 은 0부터 시작)
 
select * from freeboard f orer by idx desc;
select * from freeboard f order by idx desc limit 0,15;		-- 1페이지 목록
select * from freeboard f order by idx desc limit 15,15;	-- 2페이지 목록
select * from freeboard f order by idx desc limit 30,15;	-- 3페이지 목록
-- 계산식 : 10페이지 글은?		(n-1) * 15

select * from freeboard f order by idx desc limit 135,15;	-- 10페이지 목록
commit;

-- 글 수정 : subject, content 수정. idx 컬럼을 조건으로 합니다.
update freeboard set subject = '굿나잇~~', content = '잘자고 내일보자'
where idx = 154;

-- 조회수 변경 : 읽을 때마다(url 요청 발생) 카운트 +1
update freeboard set readCount = readCount +1 where idx=154;

-- 글 삭제 : 글 비밀번호 1)있을 때 2) 없을 때
delete from freeboard where idx=151 and password = '0000';

delete from freeboard where idx=151;
