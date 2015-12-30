function xn = normalizeX(X)
    norms = diag( 1./sqrt(sumsq(X)));
    xn = X * norms;
end
