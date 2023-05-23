-- 1
-- Список сотрудников отсортированных по фамили в обратном порядке
select * from employees 
order by surname desc;

-- 2
-- Количество сотрудников сгруппированных по специализации
select specialization_id, count(*) from employees 
group by specialization_id;

-- 3
-- Список сотрудников, у которых специализации доктор или фельдшер
select * from employees 
where specialization_id = 1 or specialization_id = 2;
