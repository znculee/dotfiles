function stty13in
    set COLUMNS 181
    set ROWS 53
    stty cols $COLUMNS rows $ROWS
    echo 'Terminal size has been updated to ('$ROWS' x '$COLUMNS')'
end

