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
- (2-3) divide and conquer method
    - O(nlogn) method
    - O(n) method
      - https://personal.utdallas.edu/~daescu/maxsa.pdf
      - and https://leetcode.com/problems/maximum-subarray/discuss/20360/C%2B%2B-An-clear-O(n)-divide-and-conquer-solution-with-comments
      - power of preprocessing?
- (4-5) linear time method w/o divide and conquer
    - kadane's algorithm
    - dp with prefix sums
     
## CLRS exercise
4.1-1
- the max element?

4.1-2
- use dp to calculate the sum of subarray from each potential i to j?

4.1-3
```cpp
//divide and conquer approach
int divide(vector<int>&nums, int i, int j){
    if(i == j) return nums[i];
    int mid = (j + i) / 2;
    int maxLeft = divide(nums, i, mid);
    int maxRight = divide(nums, mid + 1, j);
    int maxCur = max(maxLeft, maxRight);
    return max(maxCur, findCrossingMax(nums, i, mid, j));

}
//assuming valid indexs
int findCrossingMax(vector<int>&nums, int left, int mid, int right){
    //can't have default values as 0!!
    int maxLeft = nums[mid];
    int curLeft = 0;
    int maxRight = nums[mid + 1];
    int curRight = 0;
    for(int i = mid; i >= left; i--){
        curLeft += nums[i];
        maxLeft = max(maxLeft, curLeft);
    }
    for(int j = mid + 1; j <= right; j++){
        curRight += nums[j];
        maxRight = max(maxRight, curRight);
    }
    return maxLeft + maxRight;
}
    
int maxSubArray(vector<int>& nums) {
    if(nums.size() == 0) return 0;

    int i = 0, j = nums.size() - 1;
    return divide(nums, i, j);
}
```

4.1-4    
- (1) go through each element and check if it's all negative
- (2) return the empty array if it is, otherwise proceed as usual

4.1-5

