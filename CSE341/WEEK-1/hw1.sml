
(*Check if the first date is older and returns true...*)
(*otherwise returns false in any other case*)
(*day-month-year*)
(*Question 1*)
fun is_older(date1:(int*int*int) , date2:(int*int*int)) =
  if (#3 date1) < (#3 date2)
  then true
  else if (#3 date1) > (#3 date2)
  then false
  else if (#2 date1) < (#2 date2)
  then true
  else if (#2 date1) > (#2 date2)
  then false
  else if (#1 date1) < (#1 date2)
  then true
  else if (#1 date1) > (#1 date2)
  then false
  else false

(*Takes a list of dates and a month (i.e., an int) and returns how many dates in
the list are in the given month.*) 
fun number_in_month(dates: (int * int * int) list, month: int) =
    let
        fun cal(dates: (int * int * int) list, count: int) =
            if null dates
            then count
            else if #2 (hd dates) = month
            then cal(tl dates, count + 1)
            else cal(tl dates, count)
    in
        cal(dates, 0)
    end

fun number_in_months(dates: (int * int * int) list, months: int list) =
    let
        fun cal(months: int list, count: int) =
            if null months
            then count
            else cal(tl months, count + number_in_month(dates, hd months))        
    in
        cal(months, 0)
    end

fun dates_in_month(dates: (int * int * int) list, month: int) =
       let
            fun cal(dates: (int * int * int) list, filter_dates: (int * int * int) list) =
                if null dates
                then filter_dates
                else if #2 (hd dates) = month
                then cal(tl dates, filter_dates @ [hd dates])
                else cal(tl dates, filter_dates)
        in
            cal(dates, [])
        end

fun dates_in_months(dates: (int * int * int) list, months: int list) =
        let
            fun cal(months: int list, filtered_dates: (int * int * int) list) =
                if null months
                then filtered_dates
                else cal(tl months, filtered_dates @ dates_in_month(dates, hd months))        
        in
            cal(months, [])
        end

fun get_nth(words: string list, position: int) =
    let
        fun cal(words: string list, count: int) =
            if count = position
            then hd words
            else cal(tl words, count + 1)        
    in
        cal(words, 1)
    end

fun date_to_string(date: (int * int * int)) =
    let 
        val months = ["January", "February", "March", "April", "May", "June", 
                      "July", "August", "September", "October", "November", "December"]
    in
        Int.toString(#1 date)^"-"^get_nth(months, #2 date)^"-"^Int.toString(#3 date)
    end

fun number_before_reaching_sum(sum: int, positive_numbers: int list) =
    let
        fun cal(positive_numbers: int list, acc: int, nth_element: int) =
            if acc >= sum
            then nth_element
            else cal(tl positive_numbers, acc + hd positive_numbers, nth_element + 1)        
    in
        cal(tl positive_numbers, hd positive_numbers, 0)
    end

fun what_month(day: int) =
  let
    val days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in
    number_before_reaching_sum(day, days_in_months) + 1
  end

fun month_range(day1: int, day2: int) =
    let
            fun cal(day: int, months: int list) =
                if day > day2
                then months
                else cal(day + 1, months @ [what_month(day)])
    in
            cal(day1, [])
    end

fun oldest(dates: (int * int * int) list) =
    if null dates
    then NONE 
    else let
            fun oldest_nonempty(dates: (int * int * int) list) =
                if null (tl dates)
                then hd dates
                else let val tl_ans = oldest_nonempty(tl dates)
                     in
                        if is_older(hd dates, tl_ans)
                        then hd dates
                        else tl_ans
                     end
        in
            SOME (oldest_nonempty dates)
        end


fun cumulative_sum(numbers: int list) =
    if null numbers
    then NONE
    else let
            fun cal(acc: int, nums: int list) =
                if null (nums)
                then []
                else let
                        val acc = acc + hd nums
                     in
                        acc :: cal(acc, tl nums)
                     end
         in
            SOME (cal(0, numbers))
         end
