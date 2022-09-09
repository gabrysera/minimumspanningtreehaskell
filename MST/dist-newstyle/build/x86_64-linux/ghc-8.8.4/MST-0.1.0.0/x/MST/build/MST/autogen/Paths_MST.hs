{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_MST (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/marco/.cabal/bin"
libdir     = "/home/marco/.cabal/lib/x86_64-linux-ghc-8.8.4/MST-0.1.0.0-inplace-MST"
dynlibdir  = "/home/marco/.cabal/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/marco/.cabal/share/x86_64-linux-ghc-8.8.4/MST-0.1.0.0"
libexecdir = "/home/marco/.cabal/libexec/x86_64-linux-ghc-8.8.4/MST-0.1.0.0"
sysconfdir = "/home/marco/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "MST_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "MST_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "MST_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "MST_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "MST_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "MST_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
