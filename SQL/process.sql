
use a;



SET SQL_SAFE_UPDATES = 0; 
delete from vertex;
insert into vertex select distinct vertex_id from halt_vertex;



insert into vertex_ss(vid,ss) select v.id, S.id from (select distinct (id) from finish_superstep where id <= (select max(ss) from halt_vertex)) S, (select * from vertex) v;

update vertex_ss vs ,halt_vertex h

set active =0 
where h.ss=vs.ss and h.vertex_id=vs.vid;

update vertex_ss vss, start_vertex sv
set vss.start_ts=sv.ts
where vss.vid=sv.vertex_id
and vss.ss=sv.ss;

update vertex_ss vss, finish_vertex sv
set vss.finish_ts=sv.ts
where vss.vid=sv.vertex_id
and vss.ss=sv.ss;
drop table if exists wait_time;
create table wait_time ( ss int, vid int, wait_time float);

insert into wait_time
select v.ss, v.vid, greatest((m.finish_ts)-v.finish_ts,0) waittime from vertex_ss v, vertex_ss m , graph g
where 
v.active =1 and 
m.ss=v.ss and g.start=m.vid and g.end=v.vid
and m.active=1 and m.finish_ts is not null and v.finish_ts is not null
order by v.ss, v.vid;

-- wait all
-- select ss, sum(waittime) from (select ss, vid, max(wait_time) from wait_time) all_neighbor_done

-- group by ss;



SET SQL_SAFE_UPDATES = 1; 
