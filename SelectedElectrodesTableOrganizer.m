function SelectedElectrodesTableOrganizer(X)

if X ~= 200300
   warning("Choose a timewindow.  Ex.: 200300 ");
elseif X ~= 300500
    warning("Choose a timewindow.  Ex.: 200300 ");
elseif X ~= 500800
    warning("Choose a timewindow.  Ex.: 200300 ");
elseif X ~= 8001100
    warning("Choose a timewindow.  Ex.: 200300 ");
elseif X == 200300
    warning("Running 200-300 table organizer"); 
    run CR_Table_200300.m
    run Neg_Table_200300.m
    run Pos_Table_200300.m
    run Neu_Table_200300.m
elseif X == 300500
  warning("Running 300-500 table organizer"); 
    run CR_Table_300500.m
    run Neg_Table_300500.m
    run Pos_Table_300500.m
    run Neu_Table_300500.m
elseif X == 500800
  warning("Running 500-800 table organizer, its going to take a while"); 
    run CR_Table_500800.m
    run Neg_Table_500800.m
    run Pos_Table_500800.m
    run Neu_Table_500800.m
elseif X == 8001100
  warning("Running 800-1100 table organizer, its going to take a while"); 
    run CR_Table_8001100.m
    run Neg_Table_8001100.m
    run Pos_Table_8001100.m
    run Neu_Table_8001100.m

end

