select * from bank_loan_data


/*Total Loan Application*/
select count(id) as Total_Loan_Applications from bank_loan_data;


/*MTD Total Loan Applications*/
select count(id) as MTD_Total_loand_Applications from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

/*PMTD Total Loan Applications*/
select count(id) as PMTD_Total_load_Applications from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;

/*Total Fund Amount*/
select sum(loan_amount) as Total_Fond_Amount from bank_loan_data;

/*MTD Total Fund Amount*/
select sum(loan_amount) as MTD_Total_Fond_Amount from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

/*PMTD Total Fund Amount*/
select sum(loan_amount) as PMTD_Total_Fond_Amount from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;


/*Total Amount Recived*/
select sum(total_payment) as Total_Amount_Receive from bank_loan_data

/*MTD Total Amount Recived*/
select sum(total_payment) as MTD_Total_Amount_Receive from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

/*PMTD Total Amount Recived*/
select sum(total_payment) as PMTD_Total_Amount_Receive from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

/*Average Interest Rate*/
select avg(int_rate) as AVG_Interest_Rate from bank_loan_data

/*MTD Average Interest Rate*/
select avg(int_rate) as MTD_AVG_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021


/*PMTD Average Interest Rate*/
select round(avg(int_rate)*100,2) as PMTD_AVG_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

/*Average Debt-to-Income Ratio */
select round(avg(dti)*100,2) as AVG_Interest_Rate from bank_loan_data

/*DTM Average Debt-to-Income Ratio */
select round(avg(dti)*100,2) as DTD_AVG_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

/*PDTM Average Debt-to-Income Ratio */
select round(avg(dti)*100,2) as PDTD_AVG_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

/*Good Loan Application Percentage*/
select (count(case when loan_status = 'fully Paid' or loan_status = 'Current' then id end)*100)/count(id) as Good_Loan_Percentage 
from bank_loan_data

/*Good Loan Applications*/
select count(id) as Good_Loan_Appications from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current';

/*Good Loan Funded Amount*/
select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current';

/*Good Loan Total Received Amount*/
select sum(total_payment) as Good_Loan_Received_Amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current';

/*Bad Loan Application Percentage*/
select count(case when loan_status ='Charged Off' then id end)*100 / count(id) as Bad_Loan_Percentage from 

/*Bad Load Applications*/
select count(id) as Bad_Loan_Appications from bank_loan_data
where loan_status = 'Charged Off';

/*Bad Loan Fund Amount*/
select sum(loan_amount) as Bad_Load_Fund_Amount from bank_loan_data
where loan_status = 'Charged Off';

/*Bad Loan Total Recieve Amount*/
select sum(total_payment) as Bad_Loand_Recieve_Amount from bank_loan_data
where loan_status = 'Charged Off';

/*Loan Status Grid View*/
select
	loan_status,
	count(id) as Total_Loan_Applications,
	sum(total_payment) as Total_Amount_Recieved,
	sum(loan_amount) as Total_Founded_Amount,
	avg(int_rate)*100 as AVG_Interest_Rate,
	avg(dti)*100 as DIT
from bank_loan_data
group by loan_status

/*MTD Loan Status Grid View*/
select
	loan_status,
	sum(total_payment) as MTD_Total_Amount_Recieved,
	sum(loan_amount) as MTD_Total_Founded_Amount
from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021
group by loan_status


/* Monthly Trends by Issue Date (Line Chart)*/
select
	MONTH(issue_date) as Month_Number,
	DATENAME(MONTH, issue_date) as Month_Name,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Recieve_Amount
from bank_loan_data
group by MONTH(issue_date), DATENAME(MONTH, issue_date)
order by MONTH(issue_date)


/*Regional Analysis by State (Filled Map):*/
select 
	address_state,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Recieve_Amount
from bank_loan_data
group by address_state
order by count(id) DESC


/*Loan Term Analysis (Donut Chart) by term*/
select 
	term,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Recieve_Amount
from bank_loan_data
group by term
order by count(id) DESC


/*Employee Length Analysis (Bar Chart):*/
select 
	emp_length,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Recieve_Amount
from bank_loan_data
group by emp_length
order by count(id) DESC


/* Loan Purpose Breakdown (Bar Chart)*/
select 
	purpose,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Recieve_Amount
from bank_loan_data
group by purpose
order by count(id) DESC


/* Home Ownership Analysis (Tree Map)*/
select
	home_ownership,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Recieve_Amount
from bank_loan_data
group by home_ownership
order by count(id) DESC