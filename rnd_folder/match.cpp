#include<iostream>
#include<cstdlib>
#include<vector>
#include<list>
#include<cmath>
#include<thread>
#include<future>
using namespace std;

mutex mtx;

//lazy and do not want to put in header file
void randomize_array(vector<int>& arr) {
   int rnd{0};
   int temp{0};
   for (int i{0}; i < arr.size(); i++) {
      rnd = rand()%arr.size();
      temp = arr[i];
      arr[i] = arr[rnd];
      arr[rnd] = temp;
   }
}

void match(int sz, int k, vector<int>& freq) {
   vector<int> A(sz);
   list<int> B(sz);
   for (int i = 0; i < sz; i++) {
      A[i] = i;
      B.push_back(i);
   }

   randomize_array(A);
   list<int>::iterator temp = B.begin();
   int count{0};
   for (int i{0}; i < sz; i++) {
      temp = B.begin();
      for (int j{}; j < k; j++) {
         if (A[i] == *temp) {
            B.erase(temp);
            count++;
            break;
         }
         temp++;
      }
   }
   
   //mtx.lock();
   freq[count]++;
   //mtx.unlock();
}

int main(int num, char* args[]) {
   int sz = atoi(args[1]);
   int k = atoi(args[2]);
   int reps = atoi(args[3]);
   vector<thread> threads(8);
   vector<int> freq(sz,0);

   srand(time(0));
   
   int count{0};
   int thr_sz = threads.size();
   for (int i{0}; i < threads.size(); i++) {
      threads[i] = thread([sz,k,&freq,reps,thr_sz]() {
         for(int i = 0; i < reps / thr_sz; i++){
            match(sz,k,freq);
         }
      }); 
   }

   for (int i{0}; i < threads.size(); i++)
      threads[i].join();
   
   double avg{0};
   for (int i{0}; i < sz; i++) {
      avg = avg + i*freq[i];
   }
   avg = avg / reps;

   cout << "Avg: " << avg << endl;
}
