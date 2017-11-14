#include <cppunit/TestFixture.h>
#include <cppunit/extensions/HelperMacros.h>
#include <iostream>
#include "../shapley.h"

using namespace Shapley;

class ShapleyTests : public CppUnit::TestFixture {
  private:
	
	class TaxiPlayer : public Player {
	  public:
		explicit TaxiPlayer(double contribution) : taxiFare(contribution) {}
		
		double getContribution() const override {
			return taxiFare;
		}
	  
	  protected:
		double taxiFare;
	};
	
	class TaxiCharacteristicFunction : public CharacteristicFunction<TaxiPlayer> {
	  public:
		
		double getValue(const Coalition<TaxiPlayer>& coalition) override {
			double value = 0.0;
			// Find largest taxi fare of any coalition member.
			for (const TaxiPlayer* member : coalition.getMembers()) {
				if (member->getContribution() > value)
					value = member->getContribution();
			}
			return value;
		}
	};
	
	Coalition<TaxiPlayer>* coalition;
  
  public:
	void setUp() override {
		coalition = new Coalition<TaxiPlayer>();
	}
	
	void tearDown() override {
		delete coalition;
	}
	
	void testCoalition() {
		std::cout << "[ShapleyTests/testCoalition]" << std::endl;
		TaxiPlayer player1(6), player2(12);
		CPPUNIT_ASSERT_EQUAL(false, coalition->contains(&player1));
		coalition->add(&player1);
		CPPUNIT_ASSERT_EQUAL(true, coalition->contains(&player1));
		coalition->add(&player2);
		bool exception = false;
		try {
			coalition->add(&player1);
		} catch (const std::exception& e) {
			exception = true;
		}
		CPPUNIT_ASSERT_EQUAL(true, exception);
		coalition->remove(&player1);
		CPPUNIT_ASSERT_EQUAL(false, coalition->contains(&player1));
		CPPUNIT_ASSERT_EQUAL(true, coalition->contains(&player2));
		CPPUNIT_ASSERT_EQUAL(size_t(1), coalition->getMembers().size());
	}
	
	void testCharacteristicFunction() {
		std::cout << "[ShapleyTests/testCharacteristicFunction]" << std::endl;
		double fareA = 6.0, fareB = 12.0, fareC = 42.0;
		TaxiPlayer playerA(fareA), playerB(fareB), playerC(fareC);
		coalition->add(&playerA);
		TaxiCharacteristicFunction characteristicFunction;
		CPPUNIT_ASSERT_EQUAL(fareA, characteristicFunction.getValue(*coalition));
		coalition->add(&playerB);
		CPPUNIT_ASSERT_EQUAL(fareB, characteristicFunction.getValue(*coalition));
		coalition->add(&playerC);
		CPPUNIT_ASSERT_EQUAL(fareC, characteristicFunction.getValue(*coalition));
		coalition->remove(&playerC);
		CPPUNIT_ASSERT_EQUAL(fareB, characteristicFunction.getValue(*coalition));
		coalition->remove(&playerB);
		CPPUNIT_ASSERT_EQUAL(fareA, characteristicFunction.getValue(*coalition));
		coalition->remove(&playerA);
		CPPUNIT_ASSERT_EQUAL(0.0, characteristicFunction.getValue(*coalition));
	}
	
	CPPUNIT_TEST_SUITE(ShapleyTests);
		CPPUNIT_TEST(testCoalition);
		CPPUNIT_TEST(testCharacteristicFunction);
	CPPUNIT_TEST_SUITE_END();
};
