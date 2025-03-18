# @halostatue/sponge/functions/_sponge_on_exit.fish:v1.2.0
function _sponge_on_exit --on-event fish_exit
    sponge_delay=0 _sponge_remove_from_history
end
