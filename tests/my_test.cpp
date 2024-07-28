#include <gtest/gtest.h>

using namespace std;
using namespace testing;

class AddStockReservationTest : public testing::Test
{
protected:
    virtual void SetUp()
    {
    }
};

TEST_F(AddStockReservationTest, NegativeValue)
{
    EXPECT_EQ(1, 2);
}
