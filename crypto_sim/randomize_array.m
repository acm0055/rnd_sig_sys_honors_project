function B = randomize_array(A)
  sz = size(A);
  sz = sz(2);
  for i = 1:sz
    r = floor(sz * rand(1)) + 1;
    temp = A(i);
    A(i) = A(r);
    A(r) = temp;
  end
  B = A;
end