SPEED_OF_SOUND = 1125.33;

%for matlab and not octave use audioread
audio_8 = wavread('8ft.wav');
audio_9 = wavread('xft_session.wav');
%reduce to one channel
audio_8 = audio_8(:, 1);
audio_9 = audio_9(:, 1);

[cor_8,lags_8] = xcorr(audio_8, 'biased');
[cor_9,lags_9] = xcorr(audio_9, 'biased');
p_lags_8 = find(lags_8 >= 0);
p_lags_9 = find(lags_9 >= 0);

[l, li] = max(partition(abs(cor_9(p_lags_8(1:1000))), 100));
li*(1000/100)

%figure
%bar(1:1000, cor_8(p_lags_8(1:1000)))

%figure
%bar(1:1000, cor_9(p_lags_9(1:1000)))

%figure
%bar(1:50, partition(abs(cor_9(p_lags_9(1:1000))),50))