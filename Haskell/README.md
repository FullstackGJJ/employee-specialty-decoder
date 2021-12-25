## Setup instructions

This project utilized ubuntu distribution of Haskell's GHC, to set up the development environment, follow these steps
Run the apt-get update command and then install the haskell-platform
```
sudo apt-get update
sudo apt-get install haskell-platform
```
Now when you run the command `ghc --version` and `cabal --version` you should get this version of GHC and Cabal installed respectively
```
"The Glorious Glasgow Haskell Compilation System, version 8.6.5"
```
```
"cabal-install version 2.4.0.0"
```
Then you have to install stack toolchain using this command
```
sudo curl -sSL https://get.haskellstack.org/ | sh
```
Now you can check the version to make sure it matches this
```
> stack --version
> "Version 2.7.3, Git revision 7927a3aec32e2b2e5e4fb5be76d0d50eddcc197f x86_64 hpack-0.34.4"
```

With the development environment installed you can now run the included unit tests (it will build the project automatically)
```
cd employee-specialty-decoder
stack test
```

**Note:**
Problem 1 tests are found within `test/RulesSpec.hs` in this describe block
```
describe "clean" $ do
```

Problem 2 tests are found within `test/RulesSpec.hs` in this describe block
```
describe "removeDuplicates" $ do
```

Problem 3 tests are found within `test/CalculationsSpec.hs` in this describe block
```
describe "decode" $ do
```

## Question answering

_How might your design differ if the list of specialties was expected to never change? What
if changes frequently?_

- If the list of specialties was expected to never change then that would indicate to me that there is a specific domain or category this library is meant to support and it's not just a generic decoder of id. I would use that reasoning to hardcode the list of specialties as domain information (if creating a separate package to expand upon this one isn't an option). I would also adjust the name of this library/package to communicate to a user what domain space this occupies.
- If the list of specialties was expected to change frequently, I would add in more robust error checking and error reporting. The more subject to change an input is, the higher the risk of error caused by input variation and tighter feedback would be desireable.
