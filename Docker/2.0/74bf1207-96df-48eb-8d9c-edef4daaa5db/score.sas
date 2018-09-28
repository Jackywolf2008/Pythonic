data sasep.out;
  dcl package score sc();
  dcl double "LOAN";
  dcl double "MORTDUE";
  dcl double "VALUE";
  dcl double "YOJ";
  dcl double "DEROG";
  dcl double "DELINQ";
  dcl double "CLAGE";
  dcl double "CLNO";
  dcl double "DEBTINC";
  dcl char(7) "REASON";
  dcl char(7) "JOB";
  dcl double "NINQ";
  dcl double "BAD";
  dcl double "P_BAD1" having label n'Predicted: BAD=1';
  dcl double "P_BAD0" having label n'Predicted: BAD=0';
  dcl char(32) "I_BAD" having label n'Into: BAD';
  dcl char(4) "_WARN_" having label n'Warnings';
  Keep 
    "P_BAD1" 
    "P_BAD0" 
    "I_BAD" 
    "_WARN_" 
    ;
  varlist allvars[_all_];
  method init();
    sc.setvars(allvars);
    sc.setKey(n'FADB67B45F04B2BCE8681D13EE94530A749F9C74');
  end;
  method preScoreRecord();
  end;
  method postScoreRecord();
  end;
  method term();
  end;
  method run();
    set sasep.in;
    preScoreRecord();
    sc.scoreRecord();
    postScoreRecord();
  end;
enddata;
