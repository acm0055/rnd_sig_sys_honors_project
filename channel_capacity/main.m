<<<<<<< HEAD
PRECISION = 100;
=======
PRECISION = 1000;
>>>>>>> dist_write_up
RETRY_COUNT = 100;

%first avg transmission
%second error rate of transmission
<<<<<<< HEAD
%third avg channel capacity
A = zeros(3, 100);
=======
A = zeros(2, PRECISION);
>>>>>>> dist_write_up

temp = 0;
for i = 1:PRECISION
  for j = 1:RETRY_COUNT
    temp = transmit(generate_random_msg(10,4), i/PRECISION, 20);
    if temp == -1
      A(2,i) = A(2,i) + 1;
    else
      A(1,i) = A(1,i) + temp;
    end
  end
  %compute avg ignoring failed transmissions
  temp = RETRY_COUNT - A(2,i);
  if temp == 0
  %do nothing because A(1,i) will be zero also
  else
    A(1,i) = A(1,i)/(RETRY_COUNT-A(2,i));
  end
end

%compute channel cap graphics_toolkit
%min bytes computed by testing for zero error
min_bytes = transmit(generate_random_msg(10,4), 0, 20);
A(3,:) = (ones(1,PRECISION)*min_bytes)./A(1,:);

figure
%bits of info needed for transmission
subplot(3,1,1);
plot(A(1,:))
%number of errors in transmission
subplot(3,1,2);
plot(A(2,:))
%channel capacity
subplot(3,1,3);
plot(A(3,:))