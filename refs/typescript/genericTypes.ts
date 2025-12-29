// https://www.typescriptlang.org/docs/handbook/2/generics.html#generic-parameter-defaults

interface RoomObject {
  id: number;
}

type BuildableStructureConstant = "tower";

// Generic parameter defaults: `T extends BuildableStructureConstant = BuildableStructureConstant`
interface ConstructionSite<T extends BuildableStructureConstant = BuildableStructureConstant> extends RoomObject {
  structureType: T;
}

const site: ConstructionSite = {
  id: 1234,
  structureType: "tower",
};
