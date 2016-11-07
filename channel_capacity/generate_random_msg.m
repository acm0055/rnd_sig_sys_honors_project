function msg = generate_random_msg(num_packets, packet_len)
  msg = zeros(num_packets,packet_len);
  for i = 1:num_packets
    for j = 1:packet_len
      msg(i,j) = floor(2*rand());
    end
  end
end