// interfaces and types cannot be default export since they no longer exist
//     after JavaScript file is emitted
export type Role = | UPGRADER;

export default interface IRole {
  name: string;
}

export enum Enum {
  "enum"
};

export declare const UPGRADER: UPGRADER;

type UPGRADER = "upgrader";

