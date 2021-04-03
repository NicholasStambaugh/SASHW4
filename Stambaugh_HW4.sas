/* /* Nicholas Stambaugh, STA 216 04 */
/* Homework #4 */
proc import datafile="/home/u56440190/STA 216/used cars.xlsx"replace out=kbb dbms=xlsx; 
run;

data kbb;
set kbb;
where Make2 = "Pontiac";

proc means data=kbb maxdec=3;
var Price Mileage;
title "Numerical Summary Statistics";
title2 "Nicholas Stambaugh"; run;

proc sgplot data=kbb;
HISTOGRAM Price;
title "Histogram: Price";
title2 "Nicholas Stambaugh"; run;

proc sgplot data=kbb;
VBOX Price;
title "Boxplot: Price";
title2 "Nicholas Stambaugh"; run;

proc sgplot data=kbb;
HISTOGRAM Mileage;
title "Histogram: Mileage";
title2 "Nicholas Stambaugh"; run;

proc sgplot data=kbb;
VBOX Mileage;
title "Boxplot: Mileage";
title2 "Nicholas Stambaugh"; run;


/*Item #1 */
proc sgplot
data=kbb;
REG X= Mileage Y=Price;
title "Scatterplot: Price vs. Mileage";
title2 "Nicholas Stambaugh";
run;

/*Item #2 */
PROC CORR data=kbb NOSIMPLE;
VAR Price; WITH Mileage;
TITLE "Correlation Coefficient";
TITLE2 "Nicholas Stambaugh"; RUN;

/*Item #3 */
ods graphics on;
proc reg data=kbb plots=diagnostics;
model Price = Mileage / CLB CLM CLI;
ID Mileage;
title "SLR Model: Protein = Fat";
title2 "Nicholas Stambaugh";
 
