function msg = insert_parity_bit(msg_in)
  c = size(msg_in)(1);
  msg = zeros(size(msg_in)(1),size(msg_in)(2) + 1);
  for i = 1:c
    %https://www.mathworks.com/matlabcentral/newsreader/view_thread/331396
    msg(i,:) = [parity(msg_in(i,:)) msg_in(i,:)];
  end
end