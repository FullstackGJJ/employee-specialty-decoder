module CalculationsSpec where

import Test.Hspec

import Calculations

spec :: Spec
spec = do 
    describe "decode" $ do
        it "should return correct specialties when given input specialty with ids and raw input ids that are valid case 1" $ do
            let inputSpecialtyWithIds = [(7623, "security")]
            let inputRawInputIds = ["7-623"]
            let expectedResult = ["security"]

            decode inputSpecialtyWithIds inputRawInputIds `shouldBe` expectedResult

        it "should return correct specialties when given input specialty with ids and raw input ids that are valid case 2" $ do
            let inputSpecialtyWithIds = [ (1381, "front-end web development")
                                        , (8235, "data engineering")
                                        , (3434, "API design")
                                        , (7623, "security")
                                        , (9153, "UX")
                                        ]
            let inputRawInputIds = ["7-623", "8235", "8-235"]
            let expectedResult = ["security", "data engineering"]

            decode inputSpecialtyWithIds inputRawInputIds `shouldBe` expectedResult

        it "should return correct specialties when given input specialty with ids and raw input ids that are valid case 3" $ do
            let inputSpecialtyWithIds = [ (1381, "front-end web development")
                                        , (8235, "data engineering")
                                        , (3434, "API design")
                                        , (7623, "security")
                                        , (9153, "UX")
                                        ]
            let inputRawInputIds = ["7-623", "8235", "8-235", "9------------1--5----3", "3+zl;4asdf3@$@!$4", "3=434"]
            let expectedResult = ["security", "data engineering", "UX", "API design" ]

            decode inputSpecialtyWithIds inputRawInputIds `shouldBe` expectedResult
