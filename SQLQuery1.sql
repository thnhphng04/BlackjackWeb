

create table PlayHistory (
ID int primary key,
Game nvarchar(50),
Detail nvarchar(100),
BetMoney float,
CollectedMoney float,
Username nvarchar(50),
Foreign key (username) references Player(username)
)

create table TransactionHistory (
ID int primary key,
Type nvarchar(50),
Amount float,
Username nvarchar(50),
Foreign key (username) references Player(username)
)
