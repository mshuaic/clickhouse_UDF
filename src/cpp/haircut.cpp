#include <boost/multiprecision/cpp_int.hpp>
#include <boost/algorithm/string.hpp>
#include <cmath>
#include <iostream>
#include <string>
#include <sstream>
#include <algorithm>
#include <iterator>
#include <vector>


using namespace boost::multiprecision;
using namespace boost::algorithm;
using namespace std;

int main(int argc, char **argv) {
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


  while (cin >> blk_num >> tx_index >> txid >> src >> des >> value >> balance) {
    if (tainted.contains(src) == false || tainted[src] == 0 || balance == 0) {
      continue;
    }

    tainted[src] = min(balance, tainted[src]);
    uint256_t taint_amount = tainted[src]  * value / balance;
    if(!tainted.contains(des))
      tainted[des] = 0;
    tainted[des] += taint_amount;
    tainted[src] -= taint_amount;

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
