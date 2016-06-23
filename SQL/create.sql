
CREATE TABLE `start_superstep` (
  `job_id` int(11) DEFAULT NULL,
  `worker` int(11) DEFAULT NULL,
  `ts` datetime(5) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `finish_superstep` (
  `job_id` int(11) DEFAULT NULL,
  `worker` int(11) DEFAULT NULL,
  `ts` datetime(5) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `finish_vertex` (
  `job_id` int(11) DEFAULT NULL,
  `worker` int(11) DEFAULT NULL,
  `ts` datetime(5) DEFAULT NULL,
  `vertex_id` int(11) ,
  `ss` int(11) ,
  primary key (ss,vertex_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `graph` (
  `gid` int(11) DEFAULT NULL,
  `start` int(11) ,
  `end` int(11) ,
    primary key (start,end)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `halt_vertex` (
  `job_id` int(11) DEFAULT NULL,
  `worker` int(11) DEFAULT NULL,
  `ts` datetime(5) DEFAULT NULL,
  `vertex_id` int(11) ,
  `ss` int(11) ,
    primary key (ss,vertex_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `start_vertex` (
  `job_id` int(11) DEFAULT NULL,
  `worker` int(11) DEFAULT NULL,
  `ts` datetime(5) DEFAULT NULL
 , `vertex_id` int(11) ,
  `ss` int(11) ,
  primary key (ss,vertex_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vertex` (
  `id` int(11) ,
  primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table vertex_ss (
vid int,
ss int,
active int default 1,
start_ts  datetime(5),
finish_ts  datetime(5),
primary key (ss,vid)
);




/*

create table vertex_ss_1 (
vid int,
ss int,
active int default 1,
start_ts  datetime(5),
finish_ts  datetime(5),
primary key (ss,vid)
);


create table vertex_ss_2 (
vid int,
ss int,
active int default 1,
start_ts  datetime(5),
finish_ts  datetime(5),
primary key (ss,vid)
);



create table vertex_ss_3 (
vid int,
ss int,
active int default 1,
start_ts  datetime(5),
finish_ts  datetime(5),
primary key (ss,vid)
);


create table vertex_ss_4 (
vid int,
ss int,
active int default 1,
start_ts  datetime(5),
finish_ts  datetime(5),
primary key (ss,vid)
);

*/
