function successes = match(sz, k)
  A = B = 1:sz;
  A = randomize_array(A);
  count = 0;
  
  for i = 1:sz
    for j = 1:k
      if A(i) == B(j)
        B(j) = [];
        count = count + 1;
        break;
      end
    end
  end
  successes = count;
end