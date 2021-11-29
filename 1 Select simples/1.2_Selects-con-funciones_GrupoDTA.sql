------------------------------------------------------------------------------------------------
-- SELECT CON FUNCIONES
------------------------------------------------------------------------------------------------
/* 1
Mostrar la fecha actual de la siguiente forma:
Fecha actual
------------------------------
Sábado, 11 de febrero de 2017. 16:06:06

El día en palabras con la primera letra en mayúsculas, seguida de una coma, el día en números,
la palabra "de", el mes en minúscula en palabras, la palabra "de", el año en cuatro dígitos
finalizando con un punto. Luego la hora en formato 24h con minutos y segundos.
Y de etiqueta del campo "Fecha actual".
*/
SELECT TO_CHAR( SYSDATE, 'Day, DD "de" month"de" YYYY. HH24:MI:SS' ) FROM dual ;
/* 2
Día en palabras en el cual naciste
*/
SELECT sysdate,TO_CHAR(TIMESTAMP'1982-12-01 10:00:00 -8:00', 'Day, DD "de" month"de" YYYY.') FROM DUAL;
/* 3
La suma de salarios, cuál es el mínimo, el máximo y la media de salario
*/
select
    sum(salary) SumaSalario,
    min(salary) SalarioMin,
    max(salary) SalarioMax,
    round(avg(salary),2) SalarioMed
from employees;
/* 4
Cuántos empleados hay, cuántos tienen salario y cuántos tienen comisión.
*/
select
    COUNT(*) EmpleadosTotal, 
    count(commission_pct) EmpleadosComision,
    count(salary) EmpleadosSalario
from employees;
/* 5
Por un lado la media entre la media de salarios y el mínimo salario
Y por otro lado, la media entre la media de salarios y el máximo salario
Solo la parte entera, sin decimales ni redondeo.
*/
select
    round(((avg(salary)+min(salary))/2),0), 
    round(((avg(salary)+max(salary))/2),0) 
from employees;

/* 6
Listar el número de departamento y el máximo salario en cada uno de ellos.
*/
select distinct
     department_id,
    (select max(salary)
    from employees interna
    where interna.department_id = externa.department_id )
from employees externa
order by 1 desc;
/* 7
Mostrar los nombres de los empleados que se repiten indicando cuántos hay del mismo
en orden descendente.
*/
select first_name,Count(first_name) from employees group by first_name having Count(first_name) >1;
/* 8
Mostrar en una fila cuántos empleados son jefes de departamento
y en otra fila cuántos son jefes de otros empleados.
*/

/* 9
Listar nombre, apellido de los empleados que les coindice a la vez
la primera letra de su nombre y el apellido
*/

/* 10
Número de empleados dados de alta por día
ordenados descendentemente por la fecha
*/

/* 11
Un listado por año de la media de salarios
de los empleados que ingresaron ese año
ordenados de forma descendente por año
*/

/* 12
Nombre del día en el que más empleados
se han dado de alta
*/

------------------------------------------------------------------------------------------------
