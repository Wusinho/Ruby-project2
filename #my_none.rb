array = [1,2,3,4,5]
def my_none(arr)
    myArray = []
    switch = true
        while switch
            switch = false
                arr.length.times do |i|
                    if yield(arr[i])
                        myArray.push(arr[i])
                    end
                end
        end
        if myArray.length == 0
        puts true
        else
          puts false
    end
  end
    my_none(array) do |a|
          a > 100
    end