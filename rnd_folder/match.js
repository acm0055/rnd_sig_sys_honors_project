randomize_array = function(A) {
   var rnd = 0;
   var temp = 0;
   for (var i = 0; i < A.length; i++) {
      rnd = Math.floor(A.length * Math.random());
      temp = A[i];
      A[i] = A[rnd];
      A[rnd] = temp;
   }
   return A;
}

match = function(sz,k) {
   var A = [], B = [], freq = [];
   for (var i = 0; i < sz; i++) {
      A.push(i);
      B.push(i);
      freq.push(0);
   }

   A = randomize_array(A);
   var c = B.reduce((count,curr) => {
      for (var i = 0; i < sz; i++) {
         if (curr == A[i] && freq[i] < k) {
            A = A.slice(0,i).concat(A.slice(i+1,A.length));
            return count+1;
         }
         else {
            freq[i]++;
         }
      }
      return count;
   },0);
   return c;
}

var sz = parseInt(process.argv[2]);
var k = parseInt(process.argv[3]);
var freq = new Array(sz);
freq.fill(0);
console.log(sz,k);

for(var i = 0; i < 10000; i++) {
   freq[match(sz,k)]++;
}

console.log(freq);

console.log(freq.reduce((max_i, curr_e, i, arr) => {
   return (Math.max(curr_e, arr[max_i]) == arr[max_i]) ?
      max_i : i;
}, 0));

console.log(freq.reduce((prev, curr_e, i) => {
   return i*curr_e + prev;
}, 0)/10000);
