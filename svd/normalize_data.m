function res = normalize_data(x)
    res = x .- mean(x);
    res = x ./ std(res);
end
