create schema ambulance;

create table patients (
  patient_id smallint not null,
  date_reg date,
  birth_date date,
  surname varchar(30),
  name varchar(30),
  patronymic varchar(30),
  primary key (patient_id)
);

create table employees (
  employee_id smallint not null,
  date_reg date,
  surname varchar(30),
  name varchar(30),
  patronymic varchar(30),
  specialization_id smallint,
  primary key (employee_id)
);

create table specializations (
  specialization_id smallint not null,
  description varchar(30),
 primary key (specialization_id)
);

create table ambulance_cars (
  ambulance_car_id smallint not null,
  car_brand varchar(30),
  car_number smallint,
  car_type_id smallint,
  driver_id smallint,
  doctor_id smallint,
  paramedic_id smallint,
 primary key (ambulance_car_id)
);

create table car_types (
  car_type_id smallint  not null,
  description varchar(100),
 primary key (car_type_id)
);

create table calls_history (
  call_id smallint  not null,
  date_call date default current_date,
  status_id smallint,
  phone_number varchar(11),
  address varchar(100),
  call_request_id smallint,
  patient_id smallint,
  ambulance_id smallint,
  diagnosis_id smallint,
  date_arrival date,
  call_result_id smallint,
 primary key (call_id)
);

create table call_requests (
  call_request_id smallint  not null,
  description varchar(100),
  primary key (call_request_id)
);

create table statuses (
  status_id smallint  not null,
  description varchar(100),
  primary key (status_id)
);

create table diagnoses (
  diagnosis_id smallint  not null,
  description varchar(100),
  primary key (diagnosis_id)
);

create table call_results (
  call_result_id smallint  not null,
  description varchar(100),
  primary key (call_result_id)
);


ALTER TABLE employees ADD CONSTRAINT fk_employees_specializations 
FOREIGN KEY (specialization_id) REFERENCES specializations (specialization_id);

ALTER TABLE ambulance_cars ADD CONSTRAINT fk_ambulances_car_types 
FOREIGN KEY (car_type_id) REFERENCES car_types (car_type_id);

ALTER TABLE calls_history ADD CONSTRAINT fk_calls_history_statuses
FOREIGN KEY (status_id) REFERENCES statuses (status_id);
ALTER TABLE calls_history ADD CONSTRAINT fk_calls_history_call_requests
FOREIGN KEY (call_request_id) REFERENCES call_requests (call_request_id);
ALTER TABLE calls_history ADD CONSTRAINT fk_calls_history_ambulance_cars
FOREIGN KEY (ambulance_id) REFERENCES ambulance_cars (ambulance_car_id);
ALTER TABLE calls_history ADD CONSTRAINT fk_calls_history_diagnoses
FOREIGN KEY (diagnosis_id) REFERENCES diagnoses (diagnosis_id);
ALTER TABLE calls_history ADD CONSTRAINT fk_calls_history_call_results
FOREIGN KEY (call_result_id) REFERENCES call_results (call_result_id);

ALTER TABLE ambulance_cars ADD CONSTRAINT fk_ambulance_cars_employees_doc
FOREIGN KEY (doctor_id) REFERENCES employees (employee_id);
ALTER TABLE ambulance_cars ADD CONSTRAINT fk_ambulance_cars_employees_par
FOREIGN KEY (paramedic_id) REFERENCES employees (employee_id);
ALTER TABLE ambulance_cars ADD CONSTRAINT fk_ambulance_cars_employees_dri
FOREIGN KEY (driver_id) REFERENCES employees (employee_id);
