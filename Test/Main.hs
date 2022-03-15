module Main where

import Test.Hspec
import IHP.Prelude

import Test.Controller.TreeNodesSpec

main :: IO ()
main = hspec do
    Test.Controller.TreeNodesSpec.tests 