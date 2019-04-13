function [A, B, L] = row_swap(k, n, A, B, L)
    Lmax = abs(L(k,k));
    imax = k;

    % find row
    for i = k+1 : n
        if abs(L(i,k)) > Lmax
            Lmax = abs(L(i,k));
            imax = i;
        end
    end

    % swap row
    for j = 1 : n
        temp = A(k, j);
        A(k, j) = A(imax, j);
        A(imax, j) = temp;

        temp = L(k, j);
        L(k, j) = L(imax, j);
        L(imax, j) = temp;

    end

    temp = B(1, k);
    B(1, k) = B(1, imax);
    B(1, imax) = temp;
end