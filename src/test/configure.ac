AC_PREREQ(2.59)
AC_INIT(test, 1.0)
AC_CONFIG_SRCDIR(haircut.cpp)
AM_INIT_AUTOMAKE
dnl AC_CONFIG_HEADERS(config.h)
dnl AC_CONFIG_MACRO_DIR([m4])

AC_PROG_CXX
dnl AC_PROG_CC
AC_LANG(C++)
dnl AX_CHECK_COMPILE_FLAG([-std=c++20], [CXXFLAGS="$CXXFLAGS -std=c++20"])
AX_CXX_COMPILE_STDCXX(20, [], [])


# Check for Boost library
AC_ARG_WITH(boost,
	AS_HELP_STRING([--with-boost], [boost libraries]),
	[CXXFLAGS="${CXXFLAGS} -I${withval}/include" LDFLAGS="${LDFLAGS} -L${withval}/lib"])
AC_CHECK_LIB(boost_system, main, [], [AC_CHECK_LIB(boost_system-mt, main, [], [AC_MSG_ERROR(boost_system not found)])])


AC_CONFIG_FILES(Makefile)

AC_OUTPUT

