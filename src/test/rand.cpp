#include <boost/multiprecision/cpp_int.hpp>
#include <boost/algorithm/string.hpp>
#include <iostream>
#include <string>
#include "truncated_normal.hpp"
#include<ctime>

using namespace boost::multiprecision;
using namespace boost::algorithm;
using namespace std;

int main(int argc, char **argv) {
  namespace mp = boost::multiprecision;
  string seed = argv[1]; to_lower(seed);
  uint256_t amount = uint256_t(stoi((string)argv[2]) * pow(10, 18));

  uint64_t blk_num;
  uint64_t tx_index;
  string txid;
  string src;
  string des;
  uint256_t value;
  uint256_t balance;

  cin.tie(nullptr);
  cin.sync_with_stdio(false);

  cout.tie(nullptr);
  cout.sync_with_stdio(false);

  unordered_map<string, uint256_t> tainted{{seed, amount}};

  int rseed = time(0);


  while (cin >> blk_num >> tx_index >> txid >> src >> des >> value >> balance) {
    if (tainted.contains(src) == false || tainted[src] == 0 || balance == 0) {
      continue;
    }


    uint256_t scale = uint256_t(pow(10, 18));
    double a = 0;
    double b = double(value / scale);
    double mean = double(tainted[src] * value / balance / scale);
    double std = 1;
    // double lower_bound = (a - mean) / std;
    // double upper_bound = (b - mean) / std;

    // // Define the truncated distribution
    double x = truncated_normal_ab_sample(mean, std, a, b, rseed);
    uint256_t taint_amount = min(uint256_t(x * pow(10, 18)), value);

    // uint256_t taint_amount = 0;
    if (taint_amount == 0)
      continue;
    tainted[des] += taint_amount;
    tainted[src] -= taint_amount;
    if (tainted[src] == 0)
      tainted.erase(src);

    cout << to_string(blk_num) << "\t"
         << to_string(tx_index) << "\t"
         << txid << "\t"
         << src << "\t"
         << des << "\t"
         << value.str() << "\t"
         << balance.str() << "\t"
         << taint_amount.str() << "\t"
         << tainted[src].str() << "\t"
         << tainted[des].str() << endl;
    cout.flush();
  }

  return 0;
}
