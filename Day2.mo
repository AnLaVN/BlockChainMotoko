import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Nat32 "mo:base/Nat32";
import Debug "mo:base/Debug";
import Char "mo:base/Char";
import Array "mo:base/Array";
import Text "mo:base/Text";

actor {
	//Challenge 1
	public func nat_to_nat8(n : Nat) : async(Nat8){
		if(n < 256){ return Nat8.fromNat(n); };
		return 0;
	};

	//Challenge 2 
	public func max_number_with_n_bits(n : Nat) : async(Nat){	return 2**n;	};

	//Challenge 3
	public func decimal_to_bits(n: Nat) : async(Text){
		var t : Text = "";
		var temp : Nat = 0;
		var tong : Nat = n;
		while(tong > 0){
			temp := tong / 2;
			t := Nat.toText(tong % 2) # t;
			tong := temp;
		};
		return t;
	};

	//Challenge 4
	public func capitalize_character(c : Char) : async(Char){
		var upChar : Char = Char.fromNat32(Char.toNat32(c)-32);
		Debug.print(debug_show(c));
		Debug.print(debug_show(upChar));
		return upChar;
	};

	//Challenge 5
	public func capitalize_text(t : Text) : async(Text){
		var tdp : Text = "";
		for(value in t.chars()){
			var n : Nat32 = Char.toNat32(value);
			if(n >= 97 and n <= 122){	tdp := tdp # Char.toText(	Char.fromNat32(n-32)	);	}
			else					{	tdp := tdp # Char.toText(	value	);					};
		};
		return tdp;
	};

	//Challenge 6
	public func is_inside(t : Text, c : Char) : async(Bool){
		var b : Bool = false;
		Debug.print(debug_show(c));
		Debug.print(debug_show(t));
		for(value in t.chars()){
			if( Char.toNat32(value) == Char.toNat32(c) ){ b := true; };
		};
		return b;
	};

	//Challenge 7
	public func trim_whitespace(t : Text) : async (Text){
		var txt : Text = Text.trim(t, #text " ");
		return txt;
	};

	//Challenge 8
	public func duplicated_character(t : Text) : async (Text){
		var size = t.size();
		var i = 0;
		var j = 0;
		for(c1 in t.chars()){
			for(c2 in t.chars()){
				if(j > i){ if (c1 == c2) return Char.toText(c1); };
				j += 1;
			};
			i += 1;
			j := 0;
		};
		return t;
	};

	//Challenge 9
	public func size_in_bytes(t : Text) : async(Nat){
		return Text.encodeUtf8(t).size();
	};

	//Challenge 10
	public func bubble_sort(arr : [Nat]) : async([Nat]){
		return Array.sort<Nat>(arr, func(a,b){Nat.compare(a,b)});
	};

	//Challenge 11
	public func nat_opt_to_nat(n : ?Nat, m : Nat) : async (Nat){
		switch(n){
			case(null){return m;};
			case(?n){return n;};
		};
	};

	//Challenge 12
	public func day_of_the_week(n : Nat) : async (?Text){
		switch(n){
			case (1)	{ return ?"Monday";		};
			case (2)	{ return ?"Tuesday";	};
			case (3)	{ return ?"Wednesday";	};
			case (4)	{ return ?"Thurday";	};
			case (5)	{ return ?"Friday";		};
			case (6)	{ return ?"Saturday";	};
			case (7)	{ return ?"Sunday";		};
			case (_)	{ return null;			};
		};
	};

	//Challenge 13
	public func populate_array(arr : [?Nat]) : async([Nat]){
		return Array.map<?Nat, Nat>(arr, func(n : ?Nat) : Nat{
			switch(n){
				case null return 0;
				case (?n) return n;
			};
		});
	};

	//Challenge 14
	public func sum_of_array(arr : [Nat]) : async (Nat){
		var sum : Nat = 0;
		return Array.foldLeft<Nat, Nat>(arr, 0, func(sum : Nat, n : Nat){
			return sum + n;
		});
	};

	//Challenge 15
	public func squared_array(arr : [Nat]) : async ([Nat]){
		return Array.map<Nat, Nat>(arr, func(n : Nat) : Nat{
			return n*n;
		});
	};

	//Challenge 16
	public func increase_by_index(arr : [Nat]) : async ([Nat]){
		var i : Nat = 0;
		var chk : Bool = true;
		return Array.map<Nat, Nat>(arr, func(n : Nat) : Nat{
			if(chk){chk := false; return n;};
			i += 1;
			return n + i;
		});
	};

	//Challenge 17
	func contains<A>(arr : [A], a : A, f : (A, A) -> Bool) : async Bool{
		for (value in arr.vals()){
			if(f(value, a) == true){ return true; };
		};
		return false;
	};
	public func test() : async Bool{
		let arr = ["a", "b", "c"];
		let a = "d";
		let f = func(x : Text, y : Text) : Bool{ return (x==y); };
		await contains(arr, a, f);
	};
};
