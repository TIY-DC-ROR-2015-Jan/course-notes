def distribution rolls
  counts = {}
  rolls.times do
    total = rand(1..6) + rand(1..6)
    # unless counts[total]
    #   counts[total] = 0
    # end
    counts[total] ||= 0
    counts[total]  += 1
  end
  counts
end

results = distribution(100)
total = 0
results.each { |n, count| total += n * count }
puts "Average score: #{total / 100.0}"

results.sort_by { |n, count| n }.each do |n, count|
  puts "#{n.to_s.rjust 2}) #{'=' * count}"
end