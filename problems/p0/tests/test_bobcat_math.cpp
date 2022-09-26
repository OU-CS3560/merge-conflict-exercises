#include "../../common/vendors/catch2/catch.hpp"

#include "../bobcat_math.h"

TEST_CASE( "add is correct", "[add]" ) {
    REQUIRE( add(3, 4) == 7 );
}

TEST_CASE( "sub is correct", "[add]" ) {
    REQUIRE( sub(10, 2) == 8 );
}

TEST_CASE( "mult is correct", "[add]" ) {
    REQUIRE( mult(12, 2) == 24 );
}
