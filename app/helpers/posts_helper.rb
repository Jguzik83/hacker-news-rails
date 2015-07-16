module PostsHelper
  def post_time(datetime)
    from_time = Time.now
    distance_of_time_in_words(from_time, datetime)

  end
end
