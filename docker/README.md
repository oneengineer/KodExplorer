use build.sh to build docker image

the entrypoint.sh will copy data folder content.
you need to create a "data" folder at current directory.

entrypoint.sh will give privilege to httpd as "you", therefore inside kodexplorer you can write/read your file system.
rundocker.sh will start the service.

run
`irundocker.sh bash` will let you enter the docker for debugging.
