# @halostatue/sponge/functions/_sponge_clear_state.fish:v1.2.0
function _sponge_clear_state
    set --erase --global _sponge_current_command
    set --erase --global _sponge_current_command_exit_code
    set --erase --global _sponge_current_command_previously_in_history
end
