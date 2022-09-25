
Create database tes
Drop database tes
create table Account(
 account_id uniqueidentifier not null,
 username varchar(50) unique not null,
 [password] varchar(50) not null,
 email varchar(100) not null,
 phone varchar(10) not null,
 firstname nvarchar(10) not null,
 lastname nvarchar(10) not null,
 url_img varchar(2084),
 gender bit not null,
 [status] char(10) not null,
 Primary key(account_id),
 
)
create table Candidate(
candidate_id uniqueidentifier not null,
Primary key(candidate_id),
FOREIGN KEY (candidate_id) REFERENCES Account(account_id),
)
create table role_tbl(
role_id int Identity(1,1),
role_name char(10),
Primary Key(role_id)
)
create table Employee(
employee_id uniqueidentifier not null,
Primary key(employee_id),
FOREIGN KEY (employee_id) REFERENCES Account(account_id),
role_id int not null, 
FOREIGN KEY (role_id) REFERENCES role_tbl(role_id),
)
create table Post(
post_id int  Identity(1,1) not null,
start_time datetime not null,
employee_id uniqueidentifier not null,
[description] nvarchar(2084) not null,
title varchar(500) not null,
thumnail_url  nvarchar(2084) not null,
[status] int not null,
FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
Primary Key(post_id)
)
create table User_CV(
cv_id uniqueidentifier not null,
apply_time datetime not null,
post_id int not null,
FOREIGN KEY (post_id) REFERENCES Post(post_id),
candidate_id uniqueidentifier unique not null,
FOREIGN KEY (candidate_id) REFERENCES Candidate(candidate_id),
link_cv varchar(1024) unique not null,
Primary Key(cv_id)
)
create table Final_Result(
result_id uniqueidentifier not null,
cv_id uniqueidentifier unique not null,
result_status int not null,
Primary Key(result_id),
FOREIGN KEY (cv_id) REFERENCES User_CV(cv_id),
)
create table Schedule(
schedule_id uniqueidentifier not null,
employee_id uniqueidentifier not null,
cv_id uniqueidentifier not null,
Primary Key(schedule_id),
FOREIGN KEY (cv_id) REFERENCES User_CV(cv_id),
FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
[status] int not null,
url_meeting varchar(512) not null,
start_time Datetime not null,
end_time Datetime not null,
)
create table Note(
note_id int Identity(1,1) not null,
[message] nvarchar(1700) not null,
point float not null,
schedule_id  uniqueidentifier  unique not null,
Primary key(note_id),
FOREIGN KEY (schedule_id) REFERENCES Schedule(schedule_id),
)
 

