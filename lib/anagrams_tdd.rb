

def anagrams(str, dict_file)
  dict_hash = {}
  dict_file.readlines.each {|word| dict_hash[word.to_sym] = true}

  def perms(str)
    if str.length <= 1
      return [str]
    end

    perms_array = str.chars.to_a.map.with_index do |c, i|
      subperms = perms(str[0...i]+str[i+1...str.length])
      subperms.map { |p| c + p } 
    end

    return perms_array.reduce { |arr, x| arr.concat(x) }
  end

  return perms(str).select do |perm|
    perm != str && dict_hash[perm.to_sym] 
  end

end
