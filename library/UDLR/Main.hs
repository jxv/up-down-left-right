module UDLR.Main where

import Control.Concurrent (threadDelay)
import SDL.Vect
import qualified SDL
import Foreign.C.Types (CInt)

import Paths_up_down_left_right (getDataFileName)

screenWidth, screenHeight :: CInt
(screenWidth, screenHeight) = (640, 480)

main :: IO ()
main = do
  SDL.initialize [SDL.InitVideo]
  window <- SDL.createWindow "SDL Tutorial" SDL.defaultWindow { SDL.windowInitialSize = V2 screenWidth screenHeight }
  SDL.showWindow window
  screenSurface <- SDL.getWindowSurface window

  helloWorld <- getDataFileName "data/chrono.bmp" >>= SDL.loadBMP

  SDL.surfaceBlit helloWorld Nothing screenSurface Nothing
  SDL.updateWindowSurface window

  threadDelay 2000000

  SDL.destroyWindow window
  SDL.freeSurface helloWorld
  SDL.quit
