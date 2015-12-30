function [U, S, V] = svd_manual(X)
    U = [];S = [];V = [];

    XXT = X * transpose(X);
    [XXT_eigenvec, XXT_eigenval] = eigs(XXT);
    XXT_eigenvals = diag(XXT_eigenval);
    XXT_eigenvals = round(XXT_eigenvals .* 100) ./ 100;

    XTX = transpose(X) * X;
    [XTX_eigenvec, XTX_eigenval] = eig(XTX);
    XTX_eigenvals = diag(XTX_eigenval);
    XTX_eigenvals = round(XTX_eigenvals .* 100) ./ 100;

    diagonals = intersect(XXT_eigenvals, XTX_eigenvals);
    diagonals(diagonals<=0) = [];
    diagonals = flipud(sort(diagonals));
    diagonals = sqrt(diagonals);

    S = diag(diagonals);
    %U = fliplr(XXT_eigenvec);
    V = fliplr(XTX_eigenvec);

    diag_dim = size(S);
    diff = abs(size(V)(1) - diag_dim(1));

    if ( size(S)(1) < size(V)(1))
        for i = [1: diff ]
            S = [S; zeros(1, diag_dim(2))];
        end
        for i = [1: diff]
            S = [S transpose(zeros(1, size(S)(1))) ];
        end
    end

    U = X * V * pinv(S);

    %VT = pinv(S) * U' * X;
    %V = VT';
end
