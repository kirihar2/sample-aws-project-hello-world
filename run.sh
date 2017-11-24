if [ -f Dockerfile]; then
    echo "local extension already removed from Dockerfile!"
else
	mv Dockerfile.local Dockerfile
	echo "Removing local extension from Dockerfile..."
fi
docker build -t my-app-image .
docker run -it --rm -p 3000:8080 my-app-image
trap ctrl_c INT
declare -r output=my-app.zip

function ctrl_c() {
        echo "** Trapped CTRL-C"
        
}


echo "Zipping project to file: $output"
zip -r --exclude=*.git* $output . 
