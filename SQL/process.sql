SET SQL_SAFE_UPDATES = 0; 

delete from vertex;
insert into vertex select distinct vertex_id from halt_vertex;

insert into vertex_ss(vid,ss) select v.id, S.id from (select distinct (id) from finish_superstep where id <= (select max(ss) from halt_vertex)) S, (select * from vertex) v;

update vertex_ss 
set active=0
where (vid,ss) in (select vertex_id, ss from halt_vertex h );

update vertex_ss vss, start_vertex sv
set vss.start_ts=sv.ts
where vss.vid=sv.vertex_id and vss.ss=sv.ss;

update vertex_ss vss, finish_vertex sv
set vss.finish_ts=sv.ts
where vss.vid=sv.vertex_id and vss.ss=sv.ss;

-- delete
delete from vertex_ss where finish_ts is null;
delete from vertex_ss where active =0;



drop table if exists wait_time;

create table wait_time ( ss int, vid int, wait_time float);

insert into wait_time
select v.ss, v.vid, greatest((m.finish_ts)-v.finish_ts,0) waittime from vertex_ss v, vertex_ss m , graph g
where  m.ss=v.ss and g.start=m.vid and g.end=v.vid;


-- order by v.ss, v.vid;

-- wait all
-- select ss, sum(waittime) from (select ss, vid, max(wait_time) from wait_time) all_neighbor_done

-- group by ss;



SET SQL_SAFE_UPDATES = 1; 
