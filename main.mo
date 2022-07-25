import Nat "mo:base/Nat";
import Array "mo:base/Array";

actor {
  //Challenge 1
  public func add(n : Nat, m : Nat) : async Nat { return n+m; };

  //Challenge 2
  public func square(n : Nat) : async Nat{  return n*n;  };

  //Challenge 3
  public func days_to_second(n : Nat) : async Nat{  return n*24*60*60;  };

  //Challenge 4
  var Count : Nat = 0;
  public func increment_counter() : async Nat{
    Count += 1;
    return Count;
  };
  public func clear_counter() : async Nat{
    Count := 0;
    return Count;
  };

  //Challenge 5
  public func divide(n : Nat , m : Nat) : async Bool{  return (n%m==0);  };

  //Challenge 6
  public func is_even(n : Nat) : async Bool{  return (n%2==0);  };

  //Challenge 7
  public func sum_of_array(arr : [Nat]) : async Nat{
    var Sum : Nat = 0;
    if(arr.size() != 0){  for(value in arr.vals()){Sum+=value;}  };
    return Sum;
  };
  
  //Challenge 8
  public func maximum(arr : [Nat]) : async Nat{
    var Max : Nat = 0;
    if(arr.size() != 0){
      for(value in arr.vals()){
        if(value > Max){Max := value;};
      }
    };
    return Max;
  };

  //Challenge 9
  public func remove_from_array(arr : [Nat], n : Nat) : async [Nat]{
    var arrN : [Nat] = [];
    for(value in arr.vals()){
      if(value != n){arrN :=  Array.append<Nat>(arrN, [value]);}
    };
    return (arrN);
  };

  //Challenge 10
  public func sort(arr:[Nat]): async [Nat]{
    return Array.sort<Nat>(arr, func(a,b){Nat.compare(a,b)});
  };
};