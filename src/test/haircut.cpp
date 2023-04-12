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

  uint256_t a;
  uint256_t b;

  cin >> a >> b;
  cout << a << " "
       << b << " "
       << a / b << endl;
  return 0;
}
