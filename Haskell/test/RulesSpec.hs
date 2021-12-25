module RulesSpec where

import Test.Hspec

import Rules

spec :: Spec
spec = do 
    describe "clean" $ do
        it "should return correct input id when given raw input id containing only numbers" $ do
            let inputRawInputId = "1234"
            let expectedResult = "1234"

            clean inputRawInputId `shouldBe` expectedResult

        it "should return correct input id when given raw input id containing letters and numbers" $ do
            let inputRawInputId = "s1a2p34f"
            let expectedResult = "1234"

            clean inputRawInputId `shouldBe` expectedResult

        it "should return correct input id when given raw input id containing letters, special characters and numbers" $ do
            let inputRawInputId = "p+)*&&s1a2p*34f&"
            let expectedResult = "1234"

            clean inputRawInputId `shouldBe` expectedResult

        it "should return correct input id when given raw input id containing letters, special characters, whitespace and numbers" $ do
            let inputRawInputId = " p+)*&&s1a2p*  34f&"
            let expectedResult = "1234"

            clean inputRawInputId `shouldBe` expectedResult

        it "should return correct input id when given raw input id containing numbers and special characters case 1" $ do
            let inputRawInputId = "7-623"
            let expectedResult = "7623"

            clean inputRawInputId `shouldBe` expectedResult

        it "should return correct input id when given raw input id containing numbers and special characters case 2" $ do
            let inputRawInputId = "..2965a"
            let expectedResult = "2965"

            clean inputRawInputId `shouldBe` expectedResult

    describe "removeDuplicates" $ do
        it "should return same list when there are no duplicates" $ do
            let inputList = [ "a", "b", "c" ]
            let expectedResult = [ "a", "b", "c" ]

            removeDuplicates inputList `shouldBe` expectedResult

        it "should return correct list when there are duplicates case 1" $ do
            let inputList = [ "a", "b", "c", "b" ]
            let expectedResult = [ "a", "b", "c" ]

            removeDuplicates inputList `shouldBe` expectedResult

        it "should return correct list when there are duplicates case 2" $ do
            let inputList = ["a", "b", "c", "a", "b", "d"]
            let expectedResult = ["a", "b", "c", "d"]

            removeDuplicates inputList `shouldBe` expectedResult

        it "should return correct list when there are duplicates case 3" $ do
            let inputList = [4, 4, 3, 2, 3, 1]
            let expectedResult = [4, 3, 2, 1]

            removeDuplicates inputList `shouldBe` expectedResult

        it "should return correct list when there are duplicates case 4" $ do
            let inputList = [4, 4, 3, 2, 3, 1, 5, 5, 5, 5]
            let expectedResult = [4, 3, 2, 1, 5]

            removeDuplicates inputList `shouldBe` expectedResult
