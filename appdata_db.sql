drop database appmetadatadb;
drop user appmetadata;
create user appmetadata with password 'inmobi@123';
create database appmetadatadb with template=template0 owner=appmetadata;
\connect appmetadatadb;
alter default privileges  grant all on tables to appmetadata;
alter default privileges grant all on sequences to appmetadata;

create table publisher(
publisher_id integer primary key not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
email varchar(30) not null,
password text not null
);
--we have create a scheme for ads too.
create table apps(
  bundle_id integer primary key not null,
  publisher_id integer not null,
  app_name varchar(30) not null,
  description varchar(50) not null,
  no_of_downloads integer not null,
  user_rating numeric(10,1) not null
);

alter table apps add constraint app_pub_fk
foreign key (publisher_id) references publisher(publisher_id);


create sequence publisher_seq increment 1 start 1;
create sequence apps_seq increment 1 start 1;