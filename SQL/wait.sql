select ss, sum(waittime) from (select v.vid, v.ss, greatest(max(m.finish_ts)-v.finish_ts,0) waittime from vertex_ss v, vertex_ss m , graph g
where 
v.active =1 and 
m.ss=v.ss and g.start=m.vid and g.end=v.vid
and m.active=1
group by v.vid,v.ss) all_neighbor_done

group by ss;


