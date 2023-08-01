'''You are given an integer array nums of size n.

Consider a non-empty subarray from nums that has the maximum possible bitwise AND.

In other words, let k be the maximum value of the bitwise AND of any subarray of nums. Then, only subarrays with a bitwise AND equal to k should be considered.
Return the length of the longest such subarray.

The bitwise AND of an array is the bitwise AND of all the numbers in it.

A subarray is a contiguous sequence of elements within an array.'''



def longestSubarray(nums):
    N = len(nums)
    answer = [0, 0]
    for i in range(N):
        andValue = ~0
        for j in range(i, N):
            andValue &= nums[j]

            if andValue == answer[0]:
                answer = [andValue, max(answer[1], j - i + 1)]

            if andValue > answer[0]:
                answer = [andValue, j - i + 1]
                
    return answer[1]

            

            

