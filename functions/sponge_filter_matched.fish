# @halostatue/sponge/functions/sponge_filter_matched.fish:v1.2.0
function sponge_filter_matched \
    --argument-names command

    for pattern in $sponge_regex_patterns
        if string match --regex --quiet $pattern -- $command
            return
        end
    end

    return 1
end
