function index=LookupTable(P)
global Lookup;
index=-1;
for i=1:58
    if(Lookup(i,1)==P)
        index=i;
       
    end
    if(index ~=-1)
        break;
    end
end

