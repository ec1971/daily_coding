#include <vector>
#include <string>
#include <iostream>
#include <algorithm>
using namespace std;
/*
maximum subarray problem
*/
//bruteforce
//take 1: wrong anwser (corrected)
int maxSubArray(vector<int>& nums) {
    if(nums.size()==0) return 0;
    int maxSum = nums[0];
    //for each subarray starting at index i...
    for(int i = 0; i < nums.size(); i++){
        int curSum = 0;
        //this is where the mistake occurred: skipped the max count when i==j
        for(int j = i; j < nums.size(); j++){
            curSum += nums[j];
            maxSum = max(maxSum, curSum);
        }
    }
    return maxSum;

        
}
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

//approach3: kadane's
int maxSubArray(vector<int>& nums) {
    int maxSum = nums[0];
    int maxSumEndsAt = 0;
    //for each index, calculate the max subarray ending at index i
    for(int i = 0; i < nums.size(); i++){
        maxSumEndsAt = max(0, maxSumEndsAt) + nums[i];
        maxSum = max(maxSumEndsAt, maxSum);
    }
    return maxSum; 
}
bool isIdealPermutation(vector<int>& A) {
    for(int i = 1; i < A.size(); i++){
        if(A[i] < A[i - 1]){
            swap(A[i], A[i - 1]);
        }
    }
    for(int i = 1; i < A.size(); i++){
        if(A[i] < A[i - 1]){
            return false;
        }
    }
    return true;

        
}

int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   

    return 0;
}
 
        
