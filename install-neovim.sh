#!/bin/bash

LOG_FILE=/tmp/install-neovim.log

function install_neovim() {
  echo "Installing Neovim"
  install_nvim_dependencies
  clone_nvim_source
  build_nvim_from_source
  configure_nvim
  cleanup
}

function install_nvim_dependencies(){
  echo "Installing dependencies"
  sudo apt-get install make ninja-build gettext cmake curl build-essential git -y | tee $LOG_FILE
  echo "Checking npm"
  npm -v
  if [[ $? -gt 0 ]];
  then
    echo "NPM not installed! Please install it first. See https://github.com/nvm-sh/nvm for easy installation"
    exit 1
  else
    npm install -g tree-sitter-cli
  fi
}

function clone_nvim_source(){
  echo "Cloning from source"
  git clone https://github.com/neovim/neovim.git ~/.downloads/neovim | tee $LOG_FILE
}

function build_nvim_from_source() {
  echo "Building Neovim"
  cd ~/.downloads/neovim && make CMAKE_BUILD_TYPE=Release | tee $LOG_FILE && sudo make install | tee $LOG_FILE ; cd -
}

function configure_nvim() {
  echo "Cloning configuration"
  git clone https://github.com/RobinDBL/nvim-robin ~/.config/nvim | tee $LOG_FILE
}

function cleanup() {
  echo "Cleaning up..."
  rm -rf ~/.downloads
}

install_neovim
