package = "pixCrypt"
version = "1.1-1"
source = {
   url = "git+https://github.com/ttwizz/pixCrypt.git"
}
description = {
   summary = "Key-based Encryption & Decryption Library",
   detailed = "Key-based Encryption & Decryption Library",
   homepage = "https://github.com/ttwizz/pixCrypt",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      pixCrypt = "src/pixCrypt.lua"
   }
}
