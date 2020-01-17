----prime numbers----

DECLARE 
  i number(3);
  j number(3); 
  BEGIN 
  i := 2;
  LOOP 
    j:= 2; 
      LOOP 
         exit WHEN ((mod(i, j) = 0) or (j = i));
         j := j +1; 
      END LOOP; 
  IF (j = i ) 
      THEN 
      dbms_output.put_line(i || ' is prime'); 
  END IF;
  i := i + 1; 
  exit WHEN i = 50; 
  END LOOP; 
  END;



-----sum of odds------

declare
v_start constant number :=1;
v_end constant number :=100;
v_sum number :=0;

begin

    for i in v_start..v_end
    loop
    
        if mod(i, 2) = 1 
        then
        v_sum := v_sum + i; 
        end if;
        
    end loop;
    dbms_output.put_line('Sum: '|| v_sum);
    
end;



----factorial----


create or replace
function fn_factorial(p_num number) return number
is
v_factorial number:=1;
begin

    if p_num < 0 
    then return -1;
    end if;
    
    if p_num =0 
    then return 1;
    end if;
    
    for i in 1..p_num
    loop
        v_factorial:=v_factorial * i;
    end loop;
    return v_factorial;
end;  --ddl
/

select fn_factorial(-10) as fact from dual;

select employee_id, fn_factorial(employee_id-100) as fact from employees;

/


-----pifagor----

create or replace function pifagor(n1 number, n2 number, n3 number) return varchar2 is
begin
   if (n1*n1+n2*n2=n3*n3) or (n2*n2+n3*n3=n1*n1) or (n1*n1+n3*n3=n2*n2)
   then
   return 'true';
   end if;
return 'false';
end;
/
select pifagor(3, 4, 59) from dual;




----factorial recursive------



DECLARE
num number;
factorial number;
FUNCTION fact(x number) RETURN number 
IS
f number;
BEGIN 

    IF x=0 
         THEN
          f := 1;
    ELSE 
          f := x * fact(x-1);
     END IF;
     
RETURN f; 
END; 

BEGIN 

num:= 6; 
factorial := fact(num);
dbms_output.put_line(' Factorial '|| num || ' is ' || factorial);

END;
































