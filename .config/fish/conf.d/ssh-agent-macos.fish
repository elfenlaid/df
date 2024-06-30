if test -z "$SSH_ENV"
    set -gx SSH_ENV "$HOME/.ssh/environment"
end

if not test -e "$SSH_ENV"
    # Environment file does not exist at all
    echo "Environment file does not exist at all"
    __ssh_agent_start
end

__ssh_agent_source

if not ps -ax | grep ssh-agent | grep "$SSH_AGENT_PID" >/dev/null
    # The process that $SSH_AGENT_PID references is not alive
    echo "The process that $SSH_AGENT_PID references is not alive"
    __ssh_agent_start
end
