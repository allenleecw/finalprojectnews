module NewsHelper
  def proper_data(positive_hash, negative_hash)
    new_positive = []
    new_negative = []

    positive_hash.each do |k , v|
      if negative_hash[k] == nil
        new_negative << [k, 0.0]
      end
    end

    negative_hash.each do |k, v|
      new_negative << [k, v]
    end

    negative_hash.each do |k, v|
      if positive_hash[k] == nil
        new_positive << [k, 0.0]
      end
    end

    positive_hash.each do |k, v|
      new_positive << [k, v]
    end

    new_positive = new_positive.sort_by do | array |
      array[0]
    end

    new_negative = new_negative.sort_by do | array |
      array[0]
    end

    {"positive" => new_positive, "negative" => new_negative}
  end
end
