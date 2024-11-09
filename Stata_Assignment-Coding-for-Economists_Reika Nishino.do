* Assignment-Coding-for-Economists: Reika Nishino, MPA 1st year
cd "C:\Users\Nishino_Reika\Downloads\Assignment-Coding-for-Economists"
ls

* capture make directory-> being able to save my outputs(grapgh for e.g.) in a folder 
cap mkdir stata

**** 5. Read .csv data in. Fix common data quality errors (for example, string vs number, missing value). 
import delimited "city-size-japan.csv", clear
export delimited "city-size-japan-stata.csv"
import delimited "city-size-japan-stata.csv", clear

list
browse
describe
codebook

* fix an error (replace "?" to "o" in the "name" column)
generate city=name
help subinstr
replace city = subinstr(city, "?", "o", 1)
browse

**** 6. Prepare a sample for analysis by filtering observations and variables and creating transformations of variables.
drop name
keep in 1/25
reshape long pop_@, i(city) j(year)
browse

**** 7. Save data
export delimited "city-size-japan-stata.csv", replace
save "city-size-japan-stata.dta"

**** 8. Create a summary statistics table. 
summarize

**** 9. Create a grapgh
line pop_ year, legend(title("Population of 5 Japanese cities: 1995~2015") ///
	subtitle("cities") ///
	order(1 "Ageo" 2 "Akashi" 3 "Akita" 4 "Amagasaki" 5 "Anjo"))

