ubuntu-shell
============

simple shell strage

structure for rmts.sh  

(bare repository)  
$HOME/repo/bare.git  
  git init --bare  
  
(original repository)  
$HOME/tmp/.git  
  git init  
  ./gcom.sh  (call mcom.sh)  
  
(remote repositories)  
$HOME/rmt/  
  cleanbxx.sh  
  gpush.sh  
  rmts.sh    (call gcom3.sh)  
  
  (start test)  
  ./rmts.sh  -> make b1 and b2 repos.  
  
  (cleanup)  
  ./cleanbxx.sh  -> rm -Rf bxx  

(sapmle git command)  
git clone localhost:repo/bare.git  
