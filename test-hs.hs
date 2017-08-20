
import Data.Int (Int32)
import Foreign.C.Types (CDouble(..))
import Data.Number.Kirk
import qualified Data.Number.Kirk.Irram as Irram

foreign import ccall "kirk-dyadic-real.h" kirk_test_real :: IO KirkRealPtr
foreign import ccall "kirk-dyadic-real.h" kirk_dyadic_test_real_d :: CDouble -> IO KirkRealPtr

putRealLn :: KirkReal -> Int32 -> IO ()
putRealLn x acc = do
  apx <- approx x (AbsAcc acc)
  putStrLn $ show apx
--  putStrLn $ "exponent = " ++ (show $ k_exponent $ radius apx)
--  putStrLn $ "mantissa = " ++ (show $ k_mantissa $ radius apx)
--  putStrLn $ "center = " ++ (show $ center apx)

main :: IO ()
main = do
  two      <- kirk_dyadic_test_real_d 2.0 >>= kirk10
  putRealLn two (-10)

  kr       <- kirk_test_real >>= kirk10 -- 123.456

  Irram.init

  kr_sqrt  <- Irram.sqrt kr
  kr'      <- Irram.pow_n kr_sqrt 2
  kr''     <- Irram.pow   kr_sqrt two
  putRealLn kr (-10)
  putRealLn kr_sqrt (-10)
  putRealLn kr' (-10)
  putRealLn kr'' (-10)

  pi       <- Irram.pi
  putRealLn pi (-10)
