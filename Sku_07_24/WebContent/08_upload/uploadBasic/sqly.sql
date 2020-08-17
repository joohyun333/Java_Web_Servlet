create table uploadtest(
file_idx number primary key,
writer varchar2(10),
filename varchar2(100),
realpath varchar2(100),
explain  varchar2(200));

create sequence SEQ_FILEIDX_UPLOAD;