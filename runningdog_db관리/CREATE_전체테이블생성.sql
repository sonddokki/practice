-- 테이블 생성

CREATE TABLE users (
	userNo	NUMBER	NOT NULL,
	locationNo	NUMBER	NOT NULL,
	id	varchar2(20)	NOT NULL,
	password	varchar2(20)	NOT NULL,
	name	varchar2(20)	NOT NULL,
	code	varchar2(20)	NOT NULL,
	birth	date	NULL,
	gender	varchar2(20)	NULL,
	status	char	NOT NULL
);

CREATE TABLE dog (
	dogNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	name	varchar2(50)	NOT NULL,
	birth	date	NOT NULL,
	gender	varchar2(20)	NOT NULL,
	weight	NUMBER	NOT NULL,
	kind	varchar2(50)	NULL,
	neuter	varchar2(20)	NULL,
	personality	varchar2(50)	NULL,
	cert	varchar2(20)	NULL,
	color	varchar2(20)	NULL,
	status	char	NOT NULL
);

CREATE TABLE walkLog (
	walkLogNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	locationNo	NUMBER	NOT NULL,
	meetingNo	NUMBER	NULL,
	regDate	date	NOT NULL,
	startTime	varchar2(50)	NOT NULL,
	endTime	varchar2(50)	NOT NULL,
	logTime	varchar2(50)	NOT NULL,
	distance	varchar2(50)	NOT NULL,
	content	varchar2(2000)	NULL,
	security	varchar2(10)	NOT NULL,
	status	char	NOT NULL
);

CREATE TABLE coords (
	coordNo	NUMBER	NOT NULL,
    type	varchar2(50)	NOT NULL,
    useNo	NUMBER	NOT NULL,
	coordOrder	NUMBER	NOT NULL,
	lat	NUMBER	NOT NULL,
	lng	NUMBER	NOT NULL
);

CREATE TABLE blog (
	blogNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL
);

CREATE TABLE images (
	imageNo	NUMBER	NOT NULL,
	orgName	varchar2(500)	NULL,
	saveName	varchar2(500)	NOT NULL,
	filePath	varchar2(500)	NOT NULL,
	fileSize	NUMBER	NULL,
	type	varchar2(50)	NOT NULL,
	useNo	NUMBER	NOT NULL,
	imageOrder	NUMBER	NULL
);

CREATE TABLE club (
	clubNo	NUMBER	NOT NULL,
	name	VARCHAR2(50)	NOT NULL,
	description	VARCHAR2(1000)	NOT NULL,
	startYear	DATE	NULL,
	endYear	DATE	NULL,
	gender	VARCHAR2(20)	NULL,
	regDate	DATE	NOT NULL,
	status	CHAR	NOT NULL,
	join	CHAR	NOT NULL,
	authNoti	CHAR	NOT NULL,
	authBoard	CHAR	NOT NULL,
	authJoin	CHAR	NOT NULL,
	authSece	CHAR	NOT NULL,
	locationNo	NUMBER	NOT NULL
);

CREATE TABLE clubUsers (
	clubUserNo	NUMBER	NOT NULL,
	auth	CHAR	NOT NULL,
	regDate	DATE	NOT NULL,
	status	CHAR	NOT NULL,
	visits	NUMBER	NOT NULL,
	lastVisit	DATE	NOT NULL,
	userNo	NUMBER	NOT NULL,
	clubNo	NUMBER	NOT NULL
);

CREATE TABLE meeting (
	meetingNo	NUMBER	NOT NULL,
	name	VARCHAR2(50)	NOT NULL,
	description	VARCHAR2(1000)	NOT NULL,
	meetingDate	DATE	NOT NULL,
	maxPersonnel	NUMBER	NOT NULL,
	openStatus	CHAR	NOT NULL,
	small	CHAR	NOT NULL,
	medium	CHAR	NOT NULL,
	large	CHAR	NOT NULL,
	status	CHAR	NOT NULL,
	lng	NUMBER	NOT NULL,
	lat	NUMbER	NOT NULL,
	clubNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	trailNo	NUMBER	NULL
);

CREATE TABLE meetingInfo (
	meetingInfoNo	NUMBER	NOT NULL,
	meetingNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	dogNo	NUMBER	NOT NULL
);

CREATE TABLE clubBoardCategory (
	categoryNo	NUMBER	NOT NULL,
	name	VARCHAR2(50)	NOT NULL,
	orderNo	NUMBER	NOT NULL,
	regDate	DATE	NOT NULL,
	status	CHAR	NULL,
	defaultCategory	CHAR	NULL,
	clubNo	NUMBER	NOT NULL
);

CREATE TABLE walkedDog (
	walkedDogNo	NUMBER	NOT NULL,
	walkLogNo	NUMBER	NOT NULL,
	dogNo	NUMBER	NOT NULL
);

CREATE TABLE trail (
	trailNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	locationNo	NUMBER	NOT NULL,
	name	varchar2(50)	NOT NULL,
	spot	varchar2(500)	NOT NULL,
	distance	varchar2(20)	NOT NULL,
	eta	varchar2(20)	NOT NULL,
	parking	char	NOT NULL,
	restroom	char	NOT NULL,
	trashCan	char	NOT NULL,
	explanation	varchar2(1000)	NULL,
	regDate	date	NOT NULL,
	updateDate	date	NULL,
	status	char	NOT NULL
);

CREATE TABLE trailUsed (
	trailUserdNo	NUMBER	NOT NULL,
	walkLogNo	NUMBER	NOT NULL,
	trailNo	NUMBER	NOT NULL
);

CREATE TABLE trailStar (
	trailStarNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	trailNo	NUMBER	NOT NULL,
	StarDate	date	NOT NULL
);

CREATE TABLE trailCmt (
	trailCmtNo	NUMBER	NOT NULL,
	trailNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	regDate	date	NOT NULL,
	content	varchar2(1000)	NULL,
	status	char	NOT NULL
);

CREATE TABLE trailTag (
	trailTagNo	NUMBER	NOT NULL,
	trailNo	NUMBER	NOT NULL,
	tagName	varchar2(20)	NOT NULL
);

CREATE TABLE walkLogCmt (
	walkLogCmtNo	NUMBER	NOT NULL,
	walkLogNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	content	varchar2(1000)	NOT NULL,
	regDate	NUMBER	NOT NULL,
	status	char	NOT NULL
);

CREATE TABLE commBoard (
	commBoardNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	commCategory	varchar2(50)	NOT NULL,
	title	varchar2(50)	NOT NULL,
	content	varchar2(2000)	NULL,
	regDate	date	NOT NULL,
	count	NUMBER	NOT NULL,
	status	char	NOT NULL
);

CREATE TABLE commCmt (
	commCmtNo	NUMBER	NOT NULL,
	commBoardNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	content	varchar2(1000)	NULL,
	regDate	date	NOT NULL,
	groupNo	NUMBER	NOT NULL,
	status	char	NOT NULL
);

CREATE TABLE follow (
	followNo	NUMBER	NOT NULL,
	followeeNo	NUMBER	NOT NULL,
	followerNo	NUMBER	NOT NULL
);

CREATE TABLE friend (
	friendNo	NUMBER	NOT NULL,
	applyUserNo	NUMBER	NOT NULL,
	appliedUserNo	NUMBER	NOT NULL,
	status	char	NOT NULL
);

CREATE TABLE clubJoin (
	joinNo	NUMBER	NOT NULL,
	regDate	DATE	NULL,
	userNo	NUMBER	NOT NULL,
	clubNo	NUMBER	NOT NULL
);

CREATE TABLE complaints (
	complNo	NUMBER	NOT NULL,
	complDate	date	NULL,
	complUser	varchar2(100)	NOT NULL,
	complTarget	varchar2(100)	NOT NULL,
	complProcess	varchar2(50)	NULL
);

CREATE TABLE location (
	locationNo	NUMBER	NOT NULL,
	SI	varchar2(20)	NOT NULL,
	GU	varchar2(20)	NOT NULL,
	DONG	varchar2(20)	NOT NULL
);

CREATE TABLE clubBoard (
	clubBoardNo	NUMBER	NOT NULL,
	title	VARCHAR2(50)	NOT NULL,
	contents	VARCHAR2(1000)	NOT NULL,
	regDate	DATE	NOT NULL,
	status	CHAR	NOT NULL,
	visits	NUMBER	NOT NULL,
	categoryNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL
);

CREATE TABLE clubCmt (
	clubCommentNo	NUMBER	NOT NULL,
	contents	VARCHAR2(1000)	NOT NULL,
	regDate	DATE	NOT NULL,
	groupNo	NUMBER	NOT NULL,
	status	CHAR	NOT NULL,
	clubBoardNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL
);

CREATE TABLE userLike (
	likeNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	type	varchar2(50)	NOT NULL,
	useNo	NUMBER	NOT NULL
);

ALTER TABLE users ADD CONSTRAINT PK_USERS PRIMARY KEY (
	userNo
);

ALTER TABLE dog ADD CONSTRAINT PK_DOG PRIMARY KEY (
	dogNo
);

ALTER TABLE walkLog ADD CONSTRAINT PK_WALKLOG PRIMARY KEY (
	walkLogNo
);

ALTER TABLE coords ADD CONSTRAINT PK_COORDS PRIMARY KEY (
	coordNo
);

ALTER TABLE blog ADD CONSTRAINT PK_BLOG PRIMARY KEY (
	blogNo
);

ALTER TABLE images ADD CONSTRAINT PK_IMAGES PRIMARY KEY (
	imageNo
);

ALTER TABLE club ADD CONSTRAINT PK_CLUB PRIMARY KEY (
	clubNo
);

ALTER TABLE clubUsers ADD CONSTRAINT PK_CLUBUSERS PRIMARY KEY (
	clubUserNo
);

ALTER TABLE meeting ADD CONSTRAINT PK_MEETING PRIMARY KEY (
	meetingNo
);

ALTER TABLE meetingInfo ADD CONSTRAINT PK_MEETINGINFO PRIMARY KEY (
	meetingInfoNo
);

ALTER TABLE clubBoardCategory ADD CONSTRAINT PK_CLUBBOARDCATEGORY PRIMARY KEY (
	categoryNo
);

ALTER TABLE walkedDog ADD CONSTRAINT PK_WALKEDDOG PRIMARY KEY (
	walkedDogNo
);

ALTER TABLE trail ADD CONSTRAINT PK_TRAIL PRIMARY KEY (
	trailNo
);

ALTER TABLE trailUsed ADD CONSTRAINT PK_TRAILUSED PRIMARY KEY (
	trailUserdNo
);

ALTER TABLE trailStar ADD CONSTRAINT PK_TRAILSTAR PRIMARY KEY (
	trailStarNo
);

ALTER TABLE trailCmt ADD CONSTRAINT PK_TRAILCMT PRIMARY KEY (
	trailCmtNo
);

ALTER TABLE trailTag ADD CONSTRAINT PK_TRAILTAG PRIMARY KEY (
	trailTagNo
);

ALTER TABLE walkLogCmt ADD CONSTRAINT PK_WALKLOGCMT PRIMARY KEY (
	walkLogCmtNo
);

ALTER TABLE commBoard ADD CONSTRAINT PK_COMMBOARD PRIMARY KEY (
	commBoardNo
);

ALTER TABLE commCmt ADD CONSTRAINT PK_COMMCMT PRIMARY KEY (
	commCmtNo
);

ALTER TABLE follow ADD CONSTRAINT PK_FOLLOW PRIMARY KEY (
	followNo
);

ALTER TABLE friend ADD CONSTRAINT PK_FRIEND PRIMARY KEY (
	friendNo
);

ALTER TABLE clubJoin ADD CONSTRAINT PK_CLUBJOIN PRIMARY KEY (
	joinNo
);

ALTER TABLE complaints ADD CONSTRAINT PK_COMPLAINTS PRIMARY KEY (
	complNo
);

ALTER TABLE location ADD CONSTRAINT PK_LOCATION PRIMARY KEY (
	locationNo
);

ALTER TABLE clubBoard ADD CONSTRAINT PK_CLUBBOARD PRIMARY KEY (
	clubBoardNo
);

ALTER TABLE clubCmt ADD CONSTRAINT PK_CLUBCMT PRIMARY KEY (
	clubCommentNo
);

ALTER TABLE userLike ADD CONSTRAINT PK_USERLIKE PRIMARY KEY (
	likeNo
);