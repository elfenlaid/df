function pg
    set options $options (fish_opt -s r -l run)
    set options $options (fish_opt -s s -l stop)
    set options $options (fish_opt -s d -l dump)
    set options $options (fish_opt -s p -l shell)
    set options $options (fish_opt -s h -l help)

    argparse $options -- $argv

    if set -q _flag_run
        # --rm Automatically remove the container, and it's associated file system upon exit
        # -d Launch container in background
        # -e Set containers env vars
        # -p Bing the host machine port with container's port
        # -v Mount volume on the host machine to the container volume
        docker run \
            --rm \
            -d \
            --name pg-docker \
            -e POSTGRES_PASSWORD=postgres \
            -e POSTGRES_USER=postgres \
            -p 5432:5432 \
            -v ~/docker/volumes/postgres:/var/lib/postgresql/data \
            postgres
        return
    end

    if set -q _flag_stop
        docker stop pg-docker
        return
    end

    if set -q _flag_dump
        docker exec -it pg-docker pg_dump
        return
    end

    if set -q _flag_shell
        docker exec -it pg-docker psql -U postgres
        return
    end

    printf "\n%s\n" "Usage: pg [options]"

    printf "\n%s\n" "Options:"
    printf "%s\t%s\n" "-h --help Show this help message and exit"
    printf "%s\t%s\n" "-r --run Runs PostgreSQL image"
    printf "%s\t%s\n" "-s --stop Stops PostgreSQL image"
    printf "%s\t%s\n" "-d --dump Executes pg_dump"
    printf "%s\t%s\n" "-p --shell Starts psql"
    return
end
