include("matvec1.jl")
include("matvec2_row.jl")
include("matvec2_col.jl")

dims = zeros(Int64, 3*8, 1)
for i in 1:8
  dims[3*i-2] = 128*i - 1
  dims[3*i-1] = 128*i
  dims[3*i]   = 128*i + 1
end
ndims = length(dims)
rates = zeros(ndims,4)

for k = 1:length(dims)

  n = dims[k]
  A = rand(n, n)
  x = rand(n, 1)

  ntrials = floor(1e7/n^2)
  gflops = 2*n^2*ntrials/1e9
  y = A*x

  y1 = matvec1(A,x)
  y2 = matvec2_row(A,x)
  y3 = matvec2_col(A,x)
  @sprintf("%d: %e %e %e\n", n, norm(y-y1), norm(y-y2), norm(y-y3))

  tic()
  for trial = 1:ntrials
    y = A*x;
  end
  rates[k,1] = gflops/toq();

  tic()
  for trial = 1:ntrials
    y = matvec1(A,x);
  end
  rates[k,2] = gflops/toq();

  tic()
  for trial = 1:ntrials
    y = matvec2_row(A,x);
  end
  rates[k,3] = gflops/toq();

  tic()
  for trial = 1:ntrials
    y = matvec2_col(A,x);
  end
  rates[k,4] = gflops/toq();
end

fp = open("../data/matvec_time.txt", "w")
println(fp, "n    matvec0  matvec1  matvec2_row  matvec2_col")
for i in 1:ndims
  @printf(fp, "%d   %.3f    %.3f      %.3f        %.3f\n", dims[i], rates[i, 1], rates[i, 2], rates[i, 3], rates[i, 4])
end
flush(fp)
close(fp)
