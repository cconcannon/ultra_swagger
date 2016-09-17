class Shoe < Item
  def overall_rating
    ((performance * 2 + annoyances) / 3).to_i
  end
end
