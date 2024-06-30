function lb
    # --rm Automatically remove the container, and it's associated file system upon exit
    # -e Set containers env vars
    # -p Bing the host machine port with container's port
    # -v Mount volume on the host machine to the container volume
    # docker run \
    #     --rm \
    #     --name livebook \
    #     -p 8080:8080 \
    #     -u (id -u):(id -g) \
    #     -v ~/docker/volumes/livebook:/data \
    #     livebook/livebook
    LIVEBOOK_ROOT_PATH="$HOME/docker/volumes/livebook" livebook server --open
end
