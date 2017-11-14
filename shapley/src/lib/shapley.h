#ifndef SHAPLEY_LIBRARY_H
#define SHAPLEY_LIBRARY_H

#include <vector>
#include <algorithm>
#include <stdexcept>
#include <iostream>
#include <map>

namespace Shapley {
  /**
 * A Player contributes to a coalition's worth in some way.
 */
  class Player {
	public:
	  
	  virtual ~Player() {}
	  
	  /**
	   * @return This player's contribution to the characteristic function.
	   */
	  virtual double getContribution() const = 0;
  };

/**
 * A Coalition contains any number of Players.
 */
  template <class PlayerType>
  class Coalition {
	public:
	  /**
	   * Constructs an empty coalition.
	   */
	  Coalition<PlayerType>() {}
	  
	  /**
	   * @param members This coalition's members.
	   * The Coalition will *not* delete the pointers upon destruction.
	   */
	  explicit Coalition<PlayerType>(const std::vector<const PlayerType*>& members) {
		  // Call copy constructor.
		  this->members = std::vector<const PlayerType*>(members);
	  }
	  
	  virtual ~Coalition<PlayerType>() {}
	  
	  /**
	   * Adds 'member' to this coalition.
	   * @param member
	   * @throws invalid_argument If the coalition already contains 'member'.
	   */
	  void add(const PlayerType* member) {
		  if (contains(member))
			  throw std::invalid_argument("Coalition::add called, but 'member' is already contained.");
		  this->members.push_back(member);
	  }
	  
	  void remove(const PlayerType* member) {
		  members.erase(std::remove(members.begin(), members.end(), member), members.end());
	  }
	  
	  bool contains(const PlayerType* member) {
		  return std::find(members.begin(), members.end(), member) != members.end();
	  }
	  
	  size_t size() const {
		  return members.size();
	  }
	  
	  const std::vector<const PlayerType*>& getMembers() const {
		  return members;
	  }
	  
	  /**
	   * @param index
	   * @return A Coalition with all members up to but not including 'index'.
	   */
	  Coalition getUpUntil(size_t index) {
		  Coalition copy;
		  for (size_t i = 0; i < index; i++)
			  copy.add(members.at(i));
		  return copy;
	  }
	
	protected:
	  std::vector<const PlayerType*> members;
  };

/**
 * The Characteristic Function determines a Coalition's worth.
 */
  template <class PlayerType>
  class CharacteristicFunction {
	public:
	  virtual ~CharacteristicFunction() {}
	  
	  virtual double getValue(const Coalition<PlayerType>& coalition) const = 0;
  };
  
  template <class PlayerType>
  static std::vector<double> compute(const std::vector<const PlayerType*>& players,
	                                     const CharacteristicFunction<PlayerType>& charFunc) {
	  std::vector<double> shapleyValues;
	  for (size_t i = 0; i < players.size(); i++) {
		
	  }
	  return shapleyValues;
  }
  
  template <class PlayerType>
  static std::map<const PlayerType*, double> getMarginalContribution(const std::vector<const PlayerType*>& permutation,
	                                                     const CharacteristicFunction<PlayerType>& charFunc) {
  std::map<const PlayerType*, double> contributions;
  Coalition<PlayerType> coalition;
  for (size_t i = 0; i < permutation.size(); i++) {
	  const PlayerType* currentPlayer = permutation.at(i);
	  coalition.add(currentPlayer);
	  if (coalition.size() > 1)
	    contributions[currentPlayer] = (charFunc.getValue(coalition) - charFunc.getValue(coalition.getUpUntil(i)));
	  else
	    contributions[currentPlayer] = (charFunc.getValue(coalition));
  }
  return contributions;
}
}

#endif