insert into 
    o_element_texts (record_id, record_type_id, element_id, html, text)
select
    i.id as record_id,
    e.record_type_id as record_type_id,
    e.id as element_id,
    0 as html,
    "Person" as text
from
    o_items as i
join
    o_item_types as it on i.item_type_id = it.id
join
    o_elements as e
left outer join
    (
        select distinct
            et.record_id as record_id
        from
            o_element_texts as et
        join
            o_elements as e on et.element_id = e.id
        where e.name="Subject Type"
    ) as wf on wf.record_id = i.id
where
    e.name="Subject Type" and it.name="Portrait" and wf.record_id is NULL;
