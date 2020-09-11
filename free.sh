REPOSITORY=$(echo $1 | tr '[:upper:]' '[:lower:]')
FREE_GB=$2
GITHUB_TOKEN=$3
REGISTRY=docker.pkg.github.com
IMAGE_PATH=$REPOSITORY/free-storage

docker logout https://$REGISTRY
docker login https://$REGISTRY -u token --password-stdin <<< $GITHUB_TOKEN

docker pull mcr.microsoft.com/dotnet/core/sdk:3.1
docker tag mcr.microsoft.com/dotnet/core/sdk:3.1 $REGISTRY/$IMAGE_PATH

for (( i=1; i <= $FREE_GB * 4; i++ ))
do
    echo "push and delete $i"
    docker push $REGISTRY/$IMAGE_PATH
    docker run jcansdale/gpr delete $IMAGE_PATH -k $GITHUB_TOKEN --force
done
