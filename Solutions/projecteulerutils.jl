
# Reconstruct a digit from an array
function nd(a)
  multiplicand,result = 1,0
  for i in reverse(1:length(a))
    result += multiplicand * a[i]
    multiplicand *= 10
  end
  result
end

# Check if one array is a permutation of another
function ispermutation(a, b)
  sort(a) == sort(b)
end
