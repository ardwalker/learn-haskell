ghci

:?      -- help
:module -- loads a module ; e.g. :module + Data.Ratio
:info   -- prints information :info (+)
:set +t -- prints the type
:show bindings


-- =============================================================================
-- Arithmetic 
-- =============================================================================

ghci> 2 + 2

ghci> (+) 2 2

ghci> 7.0 / 2.0

ghci> 2 + (-3)

-- Integers can be arbitrarily large. Here, (^) provides integer exponentiation:
ghci> 313 ^ 15



-- ---------

-- =============================================================================
-- Functions 
-- =============================================================================


double x = x + x
quadruple x = double (double x)


factorial n = product [1..n]
average ns = sum ns `div` length ns


-- =============================================================================
-- Strings
-- =============================================================================
"This is a string."

putStrLn "Here's a newline -->\n<-- See?"

let a = ['l', 'o', 't', 's', ' ', 'o', 'f', ' ', 'w', 'o', 'r', 'k']

'a':"bc"



-- =============================================================================
-- Lists
-- =============================================================================
[1,2,3]

[1..10]

-- Concat 
[3,1,3] ++ [3,7]

1 : [2,3]


-- Zip 
zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]
zip [1 .. 5] ["one", "two", "three", "four", "five"]


-- =============================================================================
-- Tuples 
-- =============================================================================
fst ("Wow", False)
snd (8,11)



let sum n = 
  let initialValue  = 0
  let action sumSoFar x = sumSoFar * x
  [1..n] List.fold action initialValue

