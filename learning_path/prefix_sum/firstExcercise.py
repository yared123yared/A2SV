def getPostive(nums):
    str_val=1
    postive=False
    while (postive==False):
        prefix_sum=[0]*len(nums)
        prefix_sum[0]=nums[0]+str_val
        postive=True
        # print(prefix_sum)
        for i in range(1,len(nums)):
            # print(i)
            current_sum=prefix_sum[i-1]+nums[i]
            if(current_sum<1):
                str_val+=1
                postive=False
                break
            else:
                prefix_sum[i]=current_sum
    return str_val
            
            