helpers do
  def user_status(score)
    case score
    when score < 0
      return 'unliked'
    when (0..50)
      return 'new-in-town'
    when (50..100)
      return 'kind of a big deal'
    when (100..300)
      return 'Pile Excessive'
    when score > 300
      return 'God Mode'
    end
  end
end
