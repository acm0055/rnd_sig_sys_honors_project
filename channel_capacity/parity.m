function par = parity(packet)
  num_ones = 0;
  for i = 1:size(packet)(2)
    if packet(i) == 1
      num_ones = num_ones + 1;
    end
  end
  if (mod(num_ones,2) == 0)
    par = 0;
  else
    par = 1;
  end
end