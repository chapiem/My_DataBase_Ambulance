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

-- 4
-- Список сотрудников с описанием их специализации
select e.*, s.description  from employees e
join specializations s on  e.specialization_id = s.specialization_id;

-- 5
-- Список машин скорой помощи, тип которых "Реанимация", с указанием имени водителя
select ac.*, e.name, ct.description  as doctor  from ambulance_cars ac 
join employees e on  ac.driver_id = e.employee_id
join car_types ct on  ac.car_type_id = ct.car_type_id
where ct.description = 'Реанимация';

-- 6
-- Список всех id сотрудников и машин скорой помощи, с указанием имени сотрудника и марки машины
select employee_id, name from employees 
union all
select ambulance_car_id, car_brand from ambulance_cars;

-- 7
-- Список всех сотрудников которые не назначены водителями машин скорой помощи
select e.* from employees e 
left join ambulance_cars ac on e.employee_id = ac.driver_id 
where ac.driver_id is null;

-- 8
-- 
