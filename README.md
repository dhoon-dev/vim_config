# Install
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/textkiller/vim_config/master/install.sh)"
```
# MacOS ccls
```
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-apple-darwin.tar.xz
mkdir ~/tools
tar xf clang+llvm-11.0.0-x86_64-apple-darwin.tar.xz -C ~/tools
brew install ccls --HEAD -i
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$HOME/tools/clang+llvm-11.0.0-x86_64-apple-darwin -DCMAKE_INSTALL_PREFIX=/usr/local/Cellar/ccls/HEAD-a2d2fd8 -DUSE_SYSTEM_RAPIDJSON=OFF -DCMAKE_CXX_COMPILER=$HOME/tools/clang+llvm-11.0.0-x86_64-apple-darwin/bin/clang++
cd Release
make install
exit
```
