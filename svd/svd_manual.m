function [U, S, V] = svd_manual(X)
    U = [];S = [];V = [];

    XXT = X * transpose(X);
    [XXT_eigenvec, XXT_eigenval] = eig(XXT);
    XXT_eigenvals = diag(XXT_eigenval);
    XXT_eigenvals = round(XXT_eigenvals .* 100) ./ 100;

    XTX = transpose(X) * X;
    [XTX_eigenvec, XTX_eigenval] = eig(XTX);
    XTX_eigenvals = diag(XTX_eigenval);
    XTX_eigenvals = round(XTX_eigenvals .* 100) ./ 100;

    diagonals = intersect(XXT_eigenvals, XTX_eigenvals);
    diagonals(diagonals<0) = [];
    diagonals = flipud(sort(diagonals));
    diagonals = sqrt(diagonals);
    S = diag(diagonals);

    original_dim = size(X);
    diag_dim = size(S);

    for i = [1 : abs(original_dim(1) - diag_dim(1)) ]
        S = [S; zeros(1, diag_dim(2))];
    end
    for i = [1 : abs(original_dim(2) - diag_dim(2)) ]
        S = [S transpose(zeros(1, original_dim(1))) ];
    end
    U = fliplr(XXT_eigenvec);
    V = fliplr(XTX_eigenvec);
end
