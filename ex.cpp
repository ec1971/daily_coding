#include <vector>
#include <string>
#include <iostream>
#include <algorithm>
using namespace std;

string longestCommonPrefix(vector<string>& strs) {
    if(strs.size()==0) return "";
    string res = "";
    int len = strs[0].size();
    for(int i = 0; i < len; i++){
        char cur = strs[0][i];
        for(auto &s: strs){
            if(i==s.size() || s[i] != cur){
                return res;
            }
        }
        res += cur;

    }
    return res;

        
        
        
}
    
int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   

    return 0;
}
 
        
