use "hw1.sml";
(*QUESTION 1*)
(*It should return `true` since it is older*)
is_older((2,2,1997), (2,2,1998));
(*It should return `false` since it is equal*)
is_older((2,2,1998), (2,2,1998));
(*It should return `false` since it is earlier*)
is_older((2,2,1999), (2,2,1998));

(*QUESTION 2*)
(*It should return `1`*)
number_in_month([(12,2,1998)], 2);
(*It should return `0`*)
number_in_month([(12,2,1998)], 3);
(*It should return `2`*)
number_in_month([(12,2,1998), (12,2,2004), (12,3,2005)], 2);

(*Question 3*)
(*It should return `0`*)
number_in_months([(2,3,2025),(2,4,2022),(2,6,2027)],[7,8,9]);
(*It should return `2`*)
number_in_months([(2,3,2025),(2,4,2022),(2,6,2027)],[3,4]);
(*It should return 2*)
number_in_months([(2,3,2025),(2,4,2022),(2,6,2027)],[4,4]);

(*Question 4*)
(*returns this element*)
dates_in_month([(12,2,1998)], 2);
(*returns an empty list*)
dates_in_month([(12,2,1998)], 3);
dates_in_month([(12,2,1998), (12,2,2004), (12,3,2005)], 2);

(*Question 5*)
dates_in_months([(12,2,2024),(11,3,2023),(13,5,2022)],[2,5]);
dates_in_months([(12,2,2024),(11,3,2023),(13,5,2022)],[4,4,3,3]);

(*Question 6*)
get_nth(["apple", "banana", "cherry"], 1);

(*Question 7*)
date_to_string((12,2,2024));

(*Question 8*)
number_before_reaching_sum(5, [2,3,5]);
number_before_reaching_sum(2, [2,3,5]);
number_before_reaching_sum(3, [1,1,1,1]);
number_before_reaching_sum(4, [1,2,3]);

(*Question 9*)
what_month(365);
what_month(320);
what_month(250);

(*Question 10*)
month_range(40,60);
month_range(363,365);

(*Question 11*)
oldest([(12,2,2024),(11,3,2023),(13,5,2022)]);

(*Question 12*)
cumulative_sum([2,3,5]);
cumulative_sum([12,27,13]);
