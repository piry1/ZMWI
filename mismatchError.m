function [ error ] = mismatchError( results, labels )

len = length(labels);
errCount = 0;

for i=1:len
    if(results(i) ~= labels(i))
        errCount = errCount +1;
    end
end

    error = (errCount / len) * 100; 
    
end