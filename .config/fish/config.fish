if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # Disable welcome message
    set fish_greeting
end

# Added by `rbenv init` on Thu Sep 19 12:03:44 JST 2024
status --is-interactive; and rbenv init - --no-rehash fish | source
