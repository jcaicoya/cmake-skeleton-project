#include <gtest/gtest.h> // googletest header file

#include <prime.h>

/*
TEST(TestSuiteName, TestName) {
  ... test body ...
}
*/

TEST(PrimeSuite, isPrime) {
    EXPECT_TRUE(isPrime(23));
}

TEST(PrimeSuite, isNotPrime) {
    EXPECT_FALSE(isPrime(33));
}
