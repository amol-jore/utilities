#rebase your remote repo
sudo killall -15 Rserve
now="$(date +'%d%h-%Y %H%M%S')" || exit
mv "rcloud" "rcloud_$now" || exit
echo "(DONE) :: rcoud folder renamed to rcloud_$now"
git clone -b develop https://github.com/amol-jore/rcloud.git
cp "rcloud_$now/conf/rcloud.conf" "rcloud/conf/rcloud.conf" || exit
cd rcloud || exit
git remote add upstream https://github.com/att/rcloud.git
git fetch upstream
echo "(DONE) : fetched upstream"
git checkout develop || exit
echo "(DONE) : chkout develop"
git merge upstream/develop || exit
echo "(DONE) : merge develop"
##git push origin develop || exit
echo "(DONE) :: pushed develop"
git branch "resolve_$1" || exit
git checkout "resolve_$1" || exit
echo "(DONE) :: created a resolve_$1 branch" || exit
cd rcloud
scripts/fresh_start.sh
echo "(DONE) started rcloud and taken the backup of your work, you are working on resolve_$1 branch ...."
