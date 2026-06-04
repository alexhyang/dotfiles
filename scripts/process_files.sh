#!/bin/bash
# Batch process files
process_files() {
  # check if exefile is defined
  if ! command -v exefile >/dev/null 2>&1; then
    echo "exefile is not defined"
    echo "setExefile"
    return 1
  fi

  # start file processing
  setglob
  case "$1" in
    -h)
      echo "process_files -h:          show help information"
      echo "process_files -f <files>": process all given files
      echo "process_files -e <file-extensions>: process all files with given extensions"
      echo "process_files -a: process all files"
      echo "process_files -ai: process all files including dotfiles"
      echo "exefile:"
      where exefile
      which exefile
      ;;
    -f)
      if [[ $# -eq 2 ]]; then
        file=$2
        exefile $file
      else
        files=${@:2}
        for file in $files; do
          process_files -f $file
        done
      fi
      ;;
    -e)
      if [[ $# -eq 2 ]]; then
        ext=$2
        echo $ext
        for file in *.$2; do # TODO: debug proc_f -e jpg mp4 // multiple extensions not working
          echo $file
          process_files -f $file
        done
      else
        extensions=${@:2}
        echo "multiple $extensions"
        for ext in $extensions; do
          process_files -e $ext
        done
      fi
      ;;
    -a)
      for file in *.*; do
        if [[ "$file" != *.sh ]]; then
          process_files -f $file
        fi
      done
      ;;
    -ai)
      for file in .* *.*; do
        if [[ "$file" != *.sh ]]; then
          process_files -f $file
        fi
      done
      ;;
    *)
      process_files -h
      ;;
  esac
  unsetglob
}
alias proc_f="process_files"


# utils
setglob() {
  if [[ $SHELL == "/usr/bin/zsh" ]]; then
    # nullglob: expand to nothing (this avoids interruption of loops by no matches)
    # dotglob: make sure dotfiles are also included in matching
    setopt nullglob dotglob
  else
    shopt -s nullglob dotglob
  fi
}

unsetglob() {
  if [[ $SHELL == "/usr/bin/zsh" ]]; then
    unsetopt nullglob dotglob
  else
    shopt -u nullglob dotglob
  fi
}

# delete all files without an extension
del_rnd_files() {
  find . -maxdepth 1 -type f ! -name "*.*" -delete
}

# dump files to dump folder
alias dumpD="cd /media/alex/777X/FILES/Extro/dump"
setExefile() {
  case $1 in
    dump)
      alias exefile="dump"
      echo "set exefile to dump"
      ;;
    rrnd)
      alias exefile="rename_random"
      echo "set exefile to rename_random"
      ;;
    *)
      echo "dump: move files to dump folder"
      echo "rrnd: rename files randomly"
      ;;
  esac
}

# dump file
dump() {
  mv $1 /media/alex/777X/FILES/Extro/dump
}
rename_random() {
  mv -f $1 "$(mktemp XXXXXXXXXX)"
}


# additional layer to avoid expose the dangerous function accidentally
enable_corrupt() {
  # move line 2-4 up one line, insert the original line 1 in new line 4
  corrupt_file() {
    file="$1"
    if [ $(wc -l <"$file") -ge 4 ]; then
      sed -i '1{h;d}; 5{H;x}' $file
    elif [ $(wc -l <"$file") -ge 1 ]; then
      sed -i '1{h;d}; 2{H;x}' $file
    fi
  }

  # corrupt all files that are not shell script
  corrupt_all_files() {
    for file in .* *.*; do
      if [[ "$file" != *.sh ]]; then
        corrupt_file $file
        rename_rnd $file
      fi
    done
  }
}
