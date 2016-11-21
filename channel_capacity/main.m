PRECISION = 100;
RETRY_COUNT = 10000;

%first avg transmission
%second error rate of transmission
%third avg channel capacity
A = zeros(3, 100);
A = zeros(2, PRECISION);

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
%remember to subtract parity bytes because not in orginal msg
A(3,:) = (ones(1,PRECISION)*(min_bytes-10))./A(1,:);

figure
%bits of info needed for transmission
a = subplot(3,1,1);
plot(A(1,:))
ylabel(a,'Number of Bits Needed for Transmission')
xlabel(a,'Error Chance (1-Success Percentage)')
%number of errors in transmission
b = subplot(3,1,2);
plot(A(2,:))
ylabel(b,'Number of Errant Messages')
xlabel(b,'Error Chance (1-Success Percentage)')
%channel capacity
c = subplot(3,1,3);
plot(A(3,:))
ylabel(c,'Channel Capacity')
xlabel(c,'Error Chance (1-Success Percentage)')