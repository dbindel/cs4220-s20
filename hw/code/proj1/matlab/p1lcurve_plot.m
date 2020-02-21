function [rhos, etas, lambdas, kappas] = p1lcurve_plot(obj, lmin, lmax)

  if nargin < 2
    lmin = 1e-4;
    lmax = 1;
  end

  lambdas = exp(linspace(log(lmin), log(lmax)));
  rhos = 0*lambdas;
  etas = 0*lambdas;
  kappas = 0*lambdas;
  for k = 1:length(lambdas)
    [rhos(k), etas(k), kappas(k)] = p1lcurve(obj, lambdas(k));
  end
