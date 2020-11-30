
array = [1,2,3,4,5]

def my_each(arr)
  arr=self.to_a
  n= arr.length-1
  i=0  
  n_array=[]
   for i in 0..n do
   x=arr[i]
   n_array[i] = yield(x)
  end
  return self
end

 my_each(array) {|a|print a+2}
