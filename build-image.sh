export REPOSITORY_NAME="macielbombonato"
export SERVICE_NAME="docker-builder-dotnet"
export VERSION="latest"

export DOCKER_FILE="."

echo 'Building image'
docker build --rm -t ${REPOSITORY_NAME}/${SERVICE_NAME}:${VERSION} ${DOCKER_FILE}