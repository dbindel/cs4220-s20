N = 4;
L(1) = sqrt(2);
s(1) = N*L(1)/2;
for k = 1:30
  N = N*2;
  L(k+1) = sqrt( 2*(1-sqrt(1-L(k)^2/4)) );
  s(k+1) = N*L(k+1)/2;
end

semilogy(1:length(s), abs(s-pi));
ylabel('|s_k-\pi|');
xlabel('k')
