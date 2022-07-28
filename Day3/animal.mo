module {
	public type Animal = {
		specie : Text;
		energy : Nat;
	};
	public func animalSleep(animal : Animal) : Animal {
        var ani : Animal = {
            specie = animal.specie;
            energy = animal.energy + 10;
        };
        return ani;
    };
};