#ifndef SHAPLEY_LIBRARY_H
#define SHAPLEY_LIBRARY_H

#include <vector>
#include <algorithm>
#include <stdexcept>

namespace Shapley {
  /**
 * A Player contributes to a coalition's worth in some way.
 */
  class Player {
	public:
	  /**
	   * @return This player's contribution to the characteristic function.
	   */
	  virtual double getContribution() const = 0;
  };

/**
 * A Coalition contains any number of Players.
 */
  template <class T>
  class Coalition {
	public:
	  /**
	   * Constructs an empty coalition.
	   */
	  Coalition<T>() {}
	  
	  /**
	   * @param members This coalition's members.
	   * The Coalition will *not* delete the pointers upon destruction.
	   */
	  explicit Coalition<T>(const std::vector<const T*>& members) {
		  // Call copy constructor.
		  this->members = std::vector<const T*>(members);
	  }
	  
	  virtual ~Coalition<T>() {}
	  
	  /**
	   * Adds 'member' to this coalition.
	   * @param member
	   * @throws invalid_argument If the coalition already contains 'member'.
	   */
	  void add(const T* member) {
		  if (contains(member))
			  throw std::invalid_argument("Coalition::add called, but 'member' is already contained.");
		  this->members.push_back(member);
	  }
	  
	  void remove(const T* member) {
		  members.erase(std::remove(members.begin(), members.end(), member), members.end());
	  }
	  
	  bool contains(const T* member) {
		  return std::find(members.begin(), members.end(), member) != members.end();
	  }
	  
	  size_t size() const {
		  return members.size();
	  }
	  
	  const std::vector<const T*>& getMembers() const {
		  return members;
	  }
	
	protected:
	  std::vector<const T*> members;
  };

/**
 * The Characteristic Function determines a Coalition's worth.
 */
  template <class T>
  class CharacteristicFunction {
	public:
	  virtual double getValue(const Coalition<T>& coalition) = 0;
  };
}

#endif