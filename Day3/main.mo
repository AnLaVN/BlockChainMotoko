import SinhVien "custom";
import Animal "animal";
import List "mo:base/List";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Debug "mo:base/Debug";
import Cycles "mo:base/ExperimentalCycles";
import CustomList "list";

actor {
	//Challenge 1
	public type SinhVien = SinhVien.SinhVien;
	public func getSinhVien() : async(SinhVien){
		var sv : SinhVien = {name = "LADS - Những chàng trai"; age = 19};
		return sv;
	};

	//Challenge 2
	public type Animal = Animal.Animal;
	var sucvat : Animal = {specie = "Con chó"; energy = 50};

	//Challenge 3	in animal.mo	line 6

	//Challenge 4
	public func create_animal_then_takes_a_break(ani : Animal) : async(Animal)	{	return Animal.animalSleep(ani);	};

	//Challenge 5
	var arrAni : List.List<Animal> = List.nil();

	//Challenge 6
	public func push_animal(ani : Animal) : async()	{	arrAni := List.push(ani, arrAni);	};
	public func get_animals() : async([Animal])		{	return List.toArray(arrAni);		};
	
	//Challenge 7	in list.mo	line 5		testing
	public func test_isNull() : async(Bool)			{	return CustomList.is_null(arrAni);	};
	//Challenge 8	in list.mo	line 13		testing
	public func test_Last() : async(?Animal)		{	return CustomList.last(arrAni);		};
	//Challenge 9	in list.mo	line 22		testing
	public func test_Size() : async(Nat)			{	return CustomList.size(arrAni);		};
	//Challenge 10	in list.mo	line 33		testing
	public func test_Get(n : Nat) : async(?Animal)	{	return CustomList.get(arrAni, n);	};

	//Challenge 11
	public shared({caller}) func is_anonymous() : async(Bool)	{	return Principal.isAnonymous(caller);	};

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
	public shared({caller}) func delete_favorite_number() : async(){	favoriteNumber.delete(caller);	};

	//Challenge 16
	public func deposit_cycles() : async(Nat){
		return(Cycles.balance());
		//return Cycles.accept(Cycles.available());
	};

	//Challenge 17

	//Challenge 18
	stable var versionNumber : Nat = 0;
	versionNumber += 1;
	stable var dem : Nat = 0;
	public func increaseDem() : async()	{	dem += 1;	};
	public func showDem() : async(Nat)	{	return dem;	};
	public func showVersionNumber() : async(Nat){	return versionNumber;};

	//Challenge 19
	
	//Challenge 20
};