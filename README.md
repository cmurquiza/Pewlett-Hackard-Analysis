# Pewlett-Hackard-Analysis_SQL

# Overview of the analysis:

The purpose of this analysis was to determine how many employees would be retiring in the upcoming years, which departments and titles would be most affected, and which of the current employees would be eligible to participate in the mentorship program. With this analysis, Pewlett Hackard will be able to prepare efficiently with this upcoming transition.

# Results:

## Retiring Titles

 Use: 'SELECT COUNT(title), title FROM retirement_titles GROUP BY title ORDER BY count DESC;' to see this output. (see bottom of Employee_Challenge.sql file to run code)

<img width="182" alt="Screen Shot 2023-02-11 at 11 19 45 PM" src="https://user-images.githubusercontent.com/109998935/218294911-78480130-84a6-40b7-af5e-8ca6254dbed2.png">

You can see here that the top 3 titles of thos retiring are: Senior Engineer, Senior Staff, and Engineer. With this in mind, it may be essential to ensure those titles become mentors since those titles and jobs require higher education and company experience to know how things run which will be helpful to continually promote a smooth functioning day-to-day work flow. 

## Mentorship Eligbility 

Use: 'SELECT COUNT(emp_no), emp_no FROM mentorship_eligibility GROUP BY emp_no;' to see this output. (see bottom of Employee_Challenge.sql file to run code)

<img width="208" alt="Screen Shot 2023-02-11 at 11 26 05 PM" src="https://user-images.githubusercontent.com/109998935/218295068-468a9a44-5edd-4458-adc5-9529d391fa57.png">

You can see 1,549 employees are eligible for the mentorship program. With this amount, we can see it is only about 1% of the companies entire employee population, but that isn't the entire retirement population for the company. The company can look into expanding what they consider eligible for the mentorship program so more individuals can be included. It can definitely be a benefit if they are looking to hire internally for many of the roles since the company will already have company insider knpwledge, but regardless, it will still add positive impact for the company during this entire process.

# Summary

## Total roles needing to be replaced during the "Silver Tsunami"

Use: 'SELECT DISTINCT ON (last_name) last_name FROM retirement_titles;' to see this output. (see bottom of Employee_Challenge.sql file to run code)

<img width="178" alt="Screen Shot 2023-02-11 at 11 36 16 PM" src="https://user-images.githubusercontent.com/109998935/218295297-79c4d19b-e648-4bea-855e-ad180afd6952.png">

• Total Employees in the Silver Tsunami: 72,458
• Roles that need to be replaced as "Silver Tsunami" starts to make an impact: 1,637
If Pewlett Hackard wanted to replace employees 1:1, they should replace 1,637 of the roles.

## Staffing Impact

Use: 'SELECT COUNT(emp_no), emp_no FROM mentorship_eligibility GROUP BY emp_no;' to see this output. (see bottom of Employee_Challenge.sql file to run code)

<img width="221" alt="Screen Shot 2023-02-12 at 12 12 28 AM" src="https://user-images.githubusercontent.com/109998935/218295399-385a64d3-da92-4027-85b8-d0e2cd0c2638.png">

There was 1,549 employees that are eligible for the mentorship program, and there are enough staff members to have their own mentee to make this transition as smooth as possible. An idea is to get a list of who will be retiring first by date, and scheduling mentors in a cascading fashion so the employees that are retiring don't retire all at once after mentoring those replacing them. It can be a gradual process done in each department so it can have a more seamless and gradual retirement and inprocessing process. It can also be implemented and taken into account for the entire retirement population for the company. 

# Futher Assessment: 

Further assessment can be done to see what the cost will be to accomodate this new business structure and plan. A cascading retirement plan can be looked into to see if that will not only ease the transition burden from it being all at once, but also if it would be better from a financial standpoint since the onboarding would be gradual as well, where a new one inboards as another is fully retired etc. Analysis can also be done to see how quick this can be done, or what the appropriate length should while also being financially sound. 
