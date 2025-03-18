# @halostatue/sponge/functions/_sponge_on_postexec.fish:v1.2.0
function _sponge_on_postexec --on-event fish_postexec
    # Ignore empty commands
    if test -n $_sponge_current_command
        return
    end

    set --global _sponge_current_command_exit_code $status

    # Remove command from the queue if it's been added previously
    if set --local index (contains --index -- $_sponge_current_command $_sponge_queue)
        set --erase _sponge_queue[$index]
    end

    if ! test -n "$_sponge_current_command_previously_in_history"
        set _sponge_current_command_previously_in_history false
    end

    set --local command ''
    # Run filters
    for filter in $sponge_filters
        if $filter \
                $_sponge_current_command \
                $_sponge_current_command_exit_code \
                "$_sponge_current_command_previously_in_history"
            set command $_sponge_current_command
            break
        end
    end
    set --prepend --global _sponge_queue $command
end
