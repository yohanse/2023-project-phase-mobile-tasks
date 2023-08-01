'''You are given an integer array nums of size n.

Consider a non-empty subarray from nums that has the maximum possible bitwise AND.

In other words, let k be the maximum value of the bitwise AND of any subarray of nums. Then, only subarrays with a bitwise AND equal to k should be considered.
Return the length of the longest such subarray.

The bitwise AND of an array is the bitwise AND of all the numbers in it.

A subarray is a contiguous sequence of elements within an array.'''



def longestSubarray(nums):
    count = answer = 0

    # To ascertain the maximum value.
    max_num = max(nums) 

    '''Let us determine the subarray with the maximum length that 
        comprises solely of elements equal to the maximum number.'''
    for num in nums:
        if num == max_num:
            # Increment the count by 1 as we have encountered a contiguous element that is equal to the maximum value.
            count += 1
        else:
            #Set the value back to zero.
            count = 0
        # Optimize or maximize the resulting answer.
        answer = max(answer, count)
    return answer