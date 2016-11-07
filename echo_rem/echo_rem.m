function crted_audio = echo_rem(wav_path_in, delta_x_in)
  SPEED_OF_SOUND = 1125.33;

  [audio, sample_rate] = wavread(wav_path_in);
  audio = audio(:, 1);
  audio = fft(audio);
  delta_t = delta_x_in / SPEED_OF_SOUND;

  %if sample period is greater than delta_x period ignore_function_time_stamp
  if 1/sample_rate > delta_t
    crted_audio = -1;
    return;
  end

  delta_t_in_samples = floor(delta_t * sample_rate);
  crted_audio = zeros(size(audio));

  sample_length = delta_t_in_samples + 400;
  for i = [1:size(audio)(1) - delta_t_in_samples - sample_length]
    %disp(var(audio(i:delta_t_in_samples)));
    crted_audio(i) = audio(i) - 2*audio(i)*auto_core(audio, i, delta_t_in_samples + sample_length, delta_t_in_samples) / var(audio(i:i+delta_t_in_samples));
  end
  
  disp('Press enter to hear audio');
  pause;
  crted_audio = ifft(crted_audio);
  c_play = audioplayer(crted_audio, sample_rate);
  play(c_play);
end