# maximum-subarray problem
## stock problem: how to maximize profit?
- highest profits doesn't necessarily involves the highest price day or lowest price day (though it's true if the lowest occurs before the highest)

- brute-force solution is O(n^2)
    - a simple 'n choose 2' issue

## transforming the input: subarray problem
- some initial thoughts
    - why transforming the problems from looking for 'max difference' to maximime subarrays? is it because the divide and couquer method only works for the latter?
- (1) brute-forc after transformation
    - count the sum of each subarray and compare
    - n^2 subarray and each takes O(1)
- (2) divide and conquer method

- (3-4) linear time method
    - kadane's algorithm
    - dp with prefix sums
     
## CLRS exercise
4.1-1
- the max element?

4.1-2
- use dp to calculate the sum of subarray from each potential i to j?

4.1-4    
- (1) go through each element and check if it's all negative
- (2) return the empty array if it is, otherwise proceed as usuall