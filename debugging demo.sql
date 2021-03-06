DECLARE
  l_location agent_sales.agent_loc%TYPE := 'NY' ;
  l_total_sales        NUMBER ;
  l_previous_year_comm NUMBER ;
  l_new_commission     NUMBER := 0;
  l_ratio              NUMBER;
BEGIN
  l_previous_year_comm := 0;
  FOR agent_sales_var IN  (SELECT * FROM agent_sales WHERE agent_loc = l_location  )
  LOOP
    l_total_sales := l_total_sales + agent_sales_var.agent_sales_amt;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('l_total_sales '||TO_CHAR(l_total_sales));
  IF l_total_sales     > 2000 THEN
    l_new_commission  := 2000 * 0.10;
  ELSIF l_total_sales <= 2000 THEN
    l_new_commission  := 2000 * 0.05;
  END IF;
  l_ratio := l_previous_year_comm / l_new_commission;
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error Stack: '||SYS.dbms_utility.format_error_stack);
  DBMS_OUTPUT.PUT_LINE('Error Backtrace: '||SYS.dbms_utility.format_error_backtrace);
END;