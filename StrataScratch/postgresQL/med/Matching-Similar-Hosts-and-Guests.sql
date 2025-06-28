-- find match gender,nationality of host and guest
select distinct h.host_id,
        g.guest_id
from airbnb_hosts h
left join airbnb_guests g on (h.nationality = g.nationality)
where h.gender = g.gender
order by host_id;
-- link soal: https://platform.stratascratch.com/coding/10078-find-matching-hosts-and-guests-in-a-way-that-they-are-both-of-the-same-gender-and-nationality?code_type=1