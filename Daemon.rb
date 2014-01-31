class  Daemon
   def name(string)
      num=3+rand(4)
     dd=string.split.join.upcase
     dd=dd.split(//).in_groups(num,"G")

    (0..dd.length-1).each do |col|
    
       dd[col].each do |i|
           if dd[col].length >1
              dd[col] = dd[col].shuffle[0..-2]
           else
             dd[col] = dd[col]
          end
       end
    end
     name=dd
  end
end


