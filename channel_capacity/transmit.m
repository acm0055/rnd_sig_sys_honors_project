function bit_count = transmit(msg, err_prob, retry_lim)
  msg = insert_parity_bit(msg);
  
  num_transmissions = 0;
  transmitted_msg = 0;
  for i = 1:size(msg)(1)
    transmitted_msg = transmit_msg(msg(i,:),err_prob);
    %check rough equality with parity bit
    %guarentees proper transmission for one or less errors
    temp_c = 0;
    while transmitted_msg(1) != parity(transmitted_msg(2:end)) && temp_c < retry_lim
      num_transmissions = num_transmissions + 1;
      temp_c = temp_c + 1;
      transmitted_msg = transmit_msg(msg(i,:),err_prob);
    end
    %msg would fail using given parity scheme and error probality
    if isequal(transmitted_msg, msg(i,:)) == false
      bit_count = -1;
      return
    end
    %always one transmission
    num_transmissions = num_transmissions + 1;
  end
  
  %num trans multiplied by the size of packet transmitted
  bit_count = num_transmissions * size(msg)(2);
end