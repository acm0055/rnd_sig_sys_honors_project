%https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie
%=UTF-8#q=speed+of+sound+in+feet+per+second
SPEED_OF_SOUND = 1125.33;

%for matlab and not octave use audioread
audio_8 = wavread('8ft.wav');
audio_9 = wavread('xft_session.wav');
%reduce to one channel
audio_8 = audio_8(:, 1);
audio_9 = audio_9(:, 1);

%correlation and positive lag positions
[cor_8,lags_8] = xcorr(audio_8, 'biased');
[cor_9,lags_9] = xcorr(audio_9, 'biased');
p_lags_8 = find(lags_8 >= 0);
p_lags_9 = find(lags_9 >= 0);

%22kHz of frequency band
%chop upper part of spectrum
%since spectral density is an even function
spec_8 = fft(cor_8, 44000);
spec_8 = spec_8(22001:44000);
spec_9 = fft(cor_9, 44000);
spec_9 = spec_9(22001:44000);

%https://www.mathworks.com/matlabcentral/answers/
%92565-how-do-i-control-axis-tick-labels-limits-and-axes-tick-locations
%Thanks to matlab support team for on this article for
%suggesting how to fix the x axis tick labels
figure
plot(1:1000, cor_8(p_lags_8(1:1000)))
xlabel('tau')
ylabel('autocorrelation')
set(gca, 'XTick', 1:50:1000)

figure
plot(1:1000, cor_9(p_lags_9(1:1000)))
xlabel('tau')
ylabel('autocorrelation')
set(gca, 'XTick', 1:50:1000)

%after checking the Matlab documentation and examples
%not sure if the magnitude is off, however that
%will not affect the interpretation of the room response
%since it is off only by a constant scale factor across all values
%and thus the shape of the graph will be the same

figure
bar(.1:22.000/100:22.000, partition(abs(spec_8)-mean(abs(spec_8)),100))
xlabel('kHz')
ylabel('Spectral Density')

figure
bar(.1:22.000/100:22.000, partition(abs(spec_9)-mean(abs(spec_9)),100))
xlabel('kHz')
ylabel('Spectral Density')
