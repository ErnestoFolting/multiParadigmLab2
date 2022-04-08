(*year month day*)

(*1*)
fun is_older(firstDate: int*int*int ,secondDate: int*int*int) =
if #1 firstDate < #1 secondDate 
then true
else if #2 firstDate < #2 secondDate andalso #1 firstDate = #1 secondDate 
then true 
else if #3 firstDate < #3 secondDate andalso #1 firstDate = #1 secondDate andalso #2 firstDate = #2 secondDate
then true 
else false;

fun test1() =
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
in is_older(date1,date2)
end

val ans1 = test1() (*expected: true*)

(*2*)
fun number_in_month(dateList: (int*int*int) list, monthNumber:int) = 
if null dateList 
then 0
else 
    if #2 (hd dateList) = monthNumber 
    then number_in_month(tl dateList, monthNumber) +1
    else
        number_in_month(tl dateList, monthNumber);

fun test2() =
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
    val date3 = (2023,01,25)
    val dataList = [date1,date2,date3]
    val monthNumber = 2;
in number_in_month(dataList,1)
end

val ans2 = test2() (*expected: 2*)

(*3*)
fun number_in_months(dateList: (int*int*int) list, monthList: int list) = 
if null monthList orelse null dateList 
then 0 
else if number_in_month(dateList, hd monthList) <> 0
    then number_in_months(dateList, tl monthList) + 1
    else 
        number_in_months(dateList,tl monthList);


fun test3()=
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
    val date3 = (2023,01,25)
    val dateList = [date1,date2,date3]
    val monthList = [1,2,3]
in number_in_months(dateList,monthList)
end 

val ans3 = test3(); (*expected: 2*)

(*4*)
fun dates_in_month(dateList: (int*int*int) list, monthNumber: int) = 
if null dateList 
then []
else 
    if (#2 (hd dateList)) = monthNumber
        then (hd dateList) :: dates_in_month(tl dateList,monthNumber)
    else dates_in_month(tl dateList,monthNumber)

fun test4()=
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
    val date3 = (2023,03,25)
    val date4 = (2019,01,29)
    val dateList = [date1,date2,date3,date4]
in dates_in_month(dateList,1)
end 

val ans4 = test4(); (*expected: [(2021,1,20),(2019,1,29)] *)

(*5*)
fun dates_in_months(dateList: (int*int*int) list, monthList: int list) = 
if null monthList 
then []
else 
    dates_in_month(dateList,hd monthList) @ dates_in_months(dateList,tl monthList)

fun test5()=
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
    val date3 = (2023,03,25)
    val date4 = (2019,04,29)
    val dateList = [date1,date2,date3,date4]
    val monthList = [1,2,3]
in dates_in_months(dateList,monthList)
end 

val ans5 =  test5(); (*expected: [(2021,01,20),(2021,02,20),(2023,03,25)]*)

(*6*)
fun get_nth(lst: string list, n: int) =
if null lst 
then ""
else 
if n = 1 
then hd lst 
else 
get_nth (tl lst, n-1);

fun test6()=
let val str1 = "1111aaaa"
    val str2 = "2222bbbb"
    val str3 = "3333cccc"
    val lst = [str1,str2,str3]
in
get_nth(lst,2)
end

val ans6 = test6(); (*expected: "2222bbbb"*)

(*7*)
fun date_to_string(date:int*int*int) = 
let val lst = ["January","February","March","April","May","June","July","August","September","October","November","December"]
in 
get_nth(lst,#2 date) ^ " " ^(Int.toString (#3 date)) ^ ", " ^ (Int.toString (#1 date))
end;

fun test7()=
let val date = (1991,8,24)
in 
date_to_string(date)
end 

val ans7 = test7();(*expected: August 24, 1991*)

(*8*)
fun number_before_reaching_sum(sum:int, lst: int list)=
if null lst 
then 0
else 
if(sum - hd lst > 0)
then 
number_before_reaching_sum(sum-hd lst, tl lst) + 1
else 
0;

fun test8()=
let val lst = [1,2,3,4,5]
    val sum = 15
in 
number_before_reaching_sum(sum,lst)
end 

val ans8 = test8(); (*expected: 4*)


(*9*)
fun what_month(day:int)=
if day > 0 andalso day < 366 
then
let val lst = [31,28,31,30,31,30,31,31,30,31,30,31]
in 
number_before_reaching_sum(day,lst) + 1
end
else 
~1;

fun test9()=
let val day = 91
in
what_month(day)
end

val ans9 = test9(); (*expected: 4*)