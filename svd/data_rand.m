function res = data_rand(r, maxim, mini)
    res = [];
    c = 5;
    for i = [1:r]
        col = [1:c];
        mass = randi( [ maxim, mini] ) + rand;
        density = randi([ maxim, mini]) + rand;
        volume = mass / density;
        cel = randi( [ maxim, mini] );
        col(1:c) = [mass, density, volume, ctof(cel), cel];
        res = [res; col];
    end
end
