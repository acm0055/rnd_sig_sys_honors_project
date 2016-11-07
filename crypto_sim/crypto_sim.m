freq = zeros(100, 100);
match_num = 0;

for j = 25:25
  for i = 1:10000
    match_num = match(100,j);
    freq(j, match_num) = freq(j, match_num) + 1;
  end
end

plot(freq(10,:));