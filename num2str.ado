********************************************************************************
* Programme       : num2str.ado                                                *
* Programmer      : Jonas Ranstam                                              *
* Programmed date : 13.06.2016                                                 *
********************************************************************************

*! num2str v1.0.0 JRanstam 13jun2016

program define num2str, rclass
   version 14
   
/* 
Syntax: num2str var dec

Where var is a numerical variable and dec is the desired number of decimals in the format.

*/   
   args var dec
  
   if ("`dec'"=="") local dec=2 

   if (`var'!=.) {
      replace `var'=int(10^`dec'*`var'+.5)/10^`dec'
      tostring `var', replace force
      replace `var'=`var'+"." if strpos(`var',".")==0
      replace `var'="0"+`var' if strpos(`var',".")==1
      replace `var'=`var'+substr("000000000000",1,`dec')
      replace `var'=substr(`var',1,strpos(`var',".")+`dec')
   }
   else {
      tostring `var', replace force
   }
   if (`dec'==0) {
      replace `var'=subinstr(`var',".","",.)
   }

end
