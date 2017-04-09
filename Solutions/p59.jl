#=
Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.

Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.

Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.
=#
function check(cypher, key, commonwords)
  y = UInt8[]
  for i in 1:length(cypher)
    push!(y, cypher[i] $ key[mod(i,length(key))+1])
  end
  result = ascii(convert(String, y))
  s = filter((x)->contains(result, x), commonwords)
  if length(s) > 20
    return sum(y)
  end
  return 0
end

function calc()
  x = vec(readdlm(dirname(@__FILE__()) * "/../Resources/p59.txt", ',', UInt8))
  key = UInt8[]
  # https://en.wikipedia.org/wiki/Most_common_words_in_English
  commonwords = split("the|be|to|of|and|a|in|that|have|i|it|for|not|on|with|he|as|you|do|at|this|but|his|by|from|they|we|say|her|she|or|an|will|my|one", '|')
  for a in 'a':'z'
    for b in 'a':'z'
      for c in 'a':'z'
        key = UInt8[a,b,c]
        r = check(x, key, commonwords)
        if r > 0
          return r
        end
      end
    end
  end
end
@time println(calc())
