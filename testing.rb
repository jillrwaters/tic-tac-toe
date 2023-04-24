

def winner?

  winning_combinations = [[123], [456], [789], [147], [258], [369], [357], [159]]
  arr1 = [1,2,3,4,5]
  arr2 = [5,2,7,1]


  winning_combinations.each do |combo|
    if arr1.sort.join.to_s.include?(combo.join.to_s)
      puts "arr1 has the winner"
    elsif arr2.sort.join.to_s.include?(combo.join.to_s)
      puts "arr2 has the winner"
    end
  end
end

winner?