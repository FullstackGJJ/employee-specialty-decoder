module Rules where

import qualified Models as M

import Data.Char
import qualified Data.List as List
import qualified Data.Set as Set

-----------------Function Declarations-----------------
clean :: M.RawInputId -> M.InputId
removeDuplicates :: (Ord a, Eq a) => [a] -> [a]

----------------Function Implementations----------------
clean rawInputId = Prelude.filter (isDigit) rawInputId

removeDuplicates inputList = let
    (uniqueList, _) = List.foldl takeUnique ([], Set.fromList []) inputList
    in uniqueList
    where 
        takeUnique acc input = let
            (accList, accSet) = acc
            in if (Set.member input accSet)
               then acc
               else (accList ++ [input], Set.insert input accSet)
