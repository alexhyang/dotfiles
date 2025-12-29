# Node Project

This document contains notes about node project setup.

Contents:
:InsertToc

## Package management

```bash
yarn init              # initialize a node project
yarn add <package>     # add a package as dependency
yarn add -D <package>  # add a package as dev dependency
yarn remove <package>  # remove a package
yarn install           # install all packages
```

## Usage of common packages

### typescript (`yarn add -D typescript`)

Commonly seen attributes in `tsconfig.js`:
1.  compilerOptions:
    *   module: set the module format of *emitted* JavaScript
    *   moduleResolution: set the module resolution strategy
    *   lib: libraries used by TypeScript
    *   target: changes which JS features are downleveled and which are left
        intact


### eslint (`yarn add -D eslint`)


### prettier (`yarn add -D prettier`)


## References
*   [yarn v1 CLI](https://classic.yarnpkg.com/en/docs/cli/)
*   [TSConfig Reference](https://www.typescriptlang.org/tsconfig/#module)
