## if docker is not executed as root, the userid and 
## username can be determined programmatically:
#userid="`id -u`"
#user="`id -un`"

## else, userid and user should be specified here:
userid=1000
user=static_builder

## date for labelling?
DATE=`date +%Y%m%d`
docker build \
    --build-arg uid=$userid \
    --build-arg user=$user \
    --tag $user/static_build_keyfinder:$DATE .
 
# --security-opt seccomp:unconfined is needed
# see https://bugreports.qt.io/browse/QTBUG-66930
docker run \
    -ti \
    --security-opt seccomp:unconfined \
    $user/static_build_keyfinder:$DATE /home/$user/BUILD/build_static.sh
dc_id="`docker ps -l -q`"
docker cp $dc_id:/home/$user/BUILD/KeyFinderGui_static/is_KeyFinder/KeyFinder ./KeyFinder
#docker container rm $dc_id

