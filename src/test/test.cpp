# include <cmath>
# include <ctime>
# include <cstdlib>
# include <iomanip>
# include <iostream>
#include <assert.h>     /* assert */

using namespace std;

# include "truncated_normal.hpp"

int main ( );
void truncated_normal_ab_sample_test ( );


int main ( )
{
  timestamp ( );
  cout << "\n";
  cout << "TRUNCATED_NORMAL_TEST\n";
  cout << "  C++ version.\n";
  cout << "  Test the TRUNCATED_NORMAL library.\n";

  truncated_normal_ab_sample_test ( );

  cout << "\n";
  cout << "TRUNCATED_NORMAL_TEST\n";
  cout << "  Normal end of execution.\n";
  cout << "\n";
  timestamp ( );


  return 0;
}


void truncated_normal_ab_sample_test ( )
{
  double a;
  double b;
  int i;
  double mu;
  int sample_num = 1000000;
  int seed;
  double sigma;
  double x;

  a = 50.0;
  b = 150.0;
  mu = 100.0;
  sigma = 25.0;
  seed = time(0);

  cout << "\n";
  cout << "TRUNCATED_NORMAL_AB_SAMPLE_TEST:\n";
  cout << "  TRUNCATED_NORMAL_AB_SAMPLE samples\n";
  cout << "  the Truncated Normal Distribution.\n";
  cout << "\n";
  cout << "  The parent normal distribution has\n";
  cout << "    mean =               " << mu << "\n";
  cout << "    standard deviation = " << sigma << "\n";
  cout << "  The parent distribution is truncated to\n";
  cout << "  the interval [" << a << "," << b << "]\n";
  cout << "\n";

  for ( i = 0; i < sample_num; i++ )
  {
    x = truncated_normal_ab_sample ( mu, sigma, a, b, seed );
    assert(("asdasd", a<=x));
    assert(x<=b);
    cout << "  " << setw(2) << i
         << "  " << setw(14) << x << "\n";
  }

  return;
}

