def falling(n, k):
    """Compute the falling factorial of n to depth k.

    >>> falling(6, 3)  # 6 * 5 * 4
    120
    >>> falling(4, 3)  # 4 * 3 * 2
    24
    >>> falling(4, 1)  # 4
    4
    >>> falling(4, 0)
    1
    """
    factorial = 1
    while (k > 0):
        factorial *= n
        n -=1
        k -=1
    return factorial


def divisible_by_k(n, k):
    """
    >>> a = divisible_by_k(10, 2)  # 2, 4, 6, 8, and 10 are divisible by 2
    2
    4
    6
    8
    10
    >>> a
    5
    >>> b = divisible_by_k(3, 1)  # 1, 2, and 3 are divisible by 1
    1
    2
    3
    >>> b
    3
    >>> c = divisible_by_k(6, 7)  # There are no integers up to 6 divisible by 7
    >>> c
    0
    """
    counter = 0
    increment = 1
    while (increment <= n):
        if (increment % k == 0):
            print(increment)
            counter += 1
        increment +=1
    return counter


def sum_digits(y):
    """Sum all the digits of y.

    >>> sum_digits(10) # 1 + 0 = 1
    1
    >>> sum_digits(4224) # 4 + 2 + 2 + 4 = 12
    12
    >>> sum_digits(1234567890)
    45
    >>> a = sum_digits(123) # make sure that you are using return rather than print
    >>> a
    6
    """
    counter = 0
    num_of_natural_nos = 10
    while (y >= num_of_natural_nos):
      y_last_digit =  y % num_of_natural_nos
      counter += y_last_digit
      y = (y - y_last_digit) // 10
    counter += y
    return (counter)

def double_eights(n):
    """Return true if n has two eights in a row.
    >>> double_eights(8)
    False
    >>> double_eights(88)
    True
    >>> double_eights(2882)
    True
    >>> double_eights(880088)
    True
    >>> double_eights(12345)
    False
    >>> double_eights(80808080)
    False
    """
    num_of_adj_8 = 0
    num_of_natural_nos = 10
    while (n > 0):
      n_last_digit =  n % num_of_natural_nos
      if (n_last_digit == 8 ):
        num_of_adj_8 += 1
        if (num_of_adj_8 >= 2):
            return True
      else:
        num_of_adj_8 = 0
      n = (n - n_last_digit) // 10
    return False
    

