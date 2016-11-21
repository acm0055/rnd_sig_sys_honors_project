function y = partition(vector, num_bins)
  y = zeros(1, num_bins);
  
  if size(vector,1) > size(vector,2)
    sz = size(vector,1);
  else
    sz = size(vector,2);
  end
  
  p_sz = ceil(sz/num_bins);
  r_sz = p_sz;
  for i = 1:num_bins
    for j = 1:p_sz
      if i*p_sz + j > sz
        r_sz = sz - i*p_sz +j;
        break;
      end
      y(i) = y(i) + vector(i*p_sz + j);
    end
  end
  
  for i = 1:num_bins
    if i == num_bins
      y(i) = y(i)/r_sz;
    else
      y(i) = y(i)/p_sz;
    end
  end
end