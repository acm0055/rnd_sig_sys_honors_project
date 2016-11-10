PRECISION = 100;
RETRY_COUNT = 10;

freq = zeros(100, 100);
match_num = 0;

%Graph for each k as 
for j = 1:PRECISION
  for i = 1:RETRY_COUNT
    match_num = match(PRECISION,j);
    freq(j, match_num) = freq(j, match_num) + 1;
  end
end

%variation and standard deviation
temp = zeros(PRECISION, RETRY_COUNT);
for i = 1:PRECISION
  for j = 1:PRECISION
    if freq(i,j) != 0
      t = [temp(i,temp(i,:) != 0) ones(1,freq(i,j))*j];
      temp(i,:) = padarray(t, [0 (RETRY_COUNT - size(t,2))], 'post');
    end
  end
end

variance = var(temp');
std_deviation = std(temp');
mean_val = mean(temp');

figure
surf(freq);
figure
plot(1:PRECISION, variance, 1:PRECISION, std_deviation);
figure
plot(1:PRECISION, mean_val);