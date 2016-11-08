[audio, sr] = wavread('session.wav');

mx = 0;
temp = 0;
j = 0;

for i = 1:100
  temp = xcorr(audio(1:i*50),'biased')(i*50);
  if mx < temp
    mx = temp;
    j = i*50;
  end
end

j