#=
Three distinct points are plotted at random on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

Consider the following two triangles:

A(-340,495), B(-153,-910), C(835,-947)

X(-175,41), Y(-421,-714), Z(574,-645)

It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one thousand "random" triangles, find the number of triangles for which the interior contains the origin.

NOTE: The first two examples in the file represent the triangles in the example given above.
=#
function pointInTriangle(pointX, pointY, v1X, v1Y, v2X, v2Y, v3X, v3Y) # Find point in triangle using barycentric coordinates
  A = (-v2Y * v3X + v1Y * (-v2X + v3X) + v1X * (v2Y - v3Y) + v2X * v3Y) / 2;
  sign = A < 0 ? -1 : 1;
  s = (v1Y * v3X - v1X * v3Y + (v3Y - v1Y) * pointX + (v1X - v3X) * pointY) * sign;
  t = (v1X * v2Y - v1Y * v2X + (v1Y - v2Y) * pointX + (v2X - v1X) * pointY) * sign;
  return s > 0 && t > 0 && s + t < 2 * A * sign;
end

function calc()
  x = readdlm(dirname(@__FILE__()) * "/../Resources/p102.txt", ',', Int64)
  count = 0
  for i in [1:1000]
    count = pointInTriangle(0, 0, x[i,1], x[i, 2], x[i, 3], x[i, 4], x[i, 5], x[i, 6]) ? count + 1 : count
  end
  count
end
@time println(calc())
