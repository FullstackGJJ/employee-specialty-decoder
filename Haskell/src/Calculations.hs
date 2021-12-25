module Calculations where

import qualified Models as M
import qualified Rules as R

import qualified Data.Map as Map

-----------------Function Declarations-----------------
decode :: [M.SpecialtyWithId] -> [M.RawInputId] -> [M.SpecialtyName]

----------------Function Implementations----------------
decode specialtyWithIds rawInputIds = let
    uniqueIdNumbers = getUniqueIdNumbers rawInputIds
    idToSpecialtyMap = Map.fromList specialtyWithIds
    in Prelude.map (\x -> idToSpecialtyMap Map.! x) uniqueIdNumbers
    where 
        getUniqueIdNumbers = Prelude.map (\x -> read x :: Integer) 
                           . R.removeDuplicates 
                           . Prelude.map (R.clean)
