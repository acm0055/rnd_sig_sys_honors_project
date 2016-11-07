function msg = transmit_msg(msg_in, err_prob)
  msg = zeros(size(msg_in));
  rnd_num = 0;
  for i = 1:size(msg_in)(2)
    rnd_num = rand();
    
    if rnd_num < err_prob
      if msg_in(i) == 0
        msg(i) = 1;
      else
        msg(i) = 0;
      end
    else
      msg(i) = msg_in(i);
    end
  end
end