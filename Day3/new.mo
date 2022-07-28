import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

actor{
	//Challenge 12
	var favoriteNumber = HashMap.HashMap<Principal,Nat>(0, Principal.equal, Principal.hash);

	//Challenge 13
	public shared({caller}) func add_favorite_number(n : Nat) : async()	{	favoriteNumber.put(caller, n);		};
	public shared({caller}) func show_favorite_number() : async(?Nat)	{	return favoriteNumber.get(caller);	};

	//Challenge 14
	public shared({caller}) func add_favorite_number2(n : Nat) : async(Text){
		var value : ?Nat = favoriteNumber.get(caller);
		switch(value){
			case(null){
				favoriteNumber.put(caller, n);
				return "You've successfully registered your number";
			};
			case(_){return "You've already registered your number";};
		};
	};

	//Challenge 15
	public shared({caller}) func update_favorite_number(n : Nat) : async(Text){
		var value : ?Nat = favoriteNumber.replace(caller, n);
		switch(value){
			case(null)	{	return "You don't have any favorite number";		};
			case(_)		{	return "You've successfully updated your number";	};
		};
	};
};