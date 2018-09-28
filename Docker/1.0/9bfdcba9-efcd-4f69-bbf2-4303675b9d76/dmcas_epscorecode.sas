data sasep.out;
   dcl package score _19TV3NKQAE4OCE6A84KGKUAM1();
   dcl double "CLAGE";
   dcl double "CLNO";
   dcl double "DEBTINC";
   dcl double "LOAN";
   dcl double "MORTDUE";
   dcl double "VALUE";
   dcl double "YOJ";
   dcl double "DELINQ";
   dcl double "DEROG";
   dcl double "NINQ";
   dcl nchar(7) "JOB";
   dcl double "P_BAD1" having label n'Predicted: BAD=1           ';
   dcl double "P_BAD0" having label n'Predicted: BAD=0           ';
   dcl nchar(32) "I_BAD" having label n'Into: BAD';
   dcl nchar(4) "_WARN_" having label n'Warnings';
   dcl double EM_EVENTPROBABILITY;
   dcl nchar(32) EM_CLASSIFICATION;
   dcl double EM_PROBABILITY;
   varlist allvars [_all_];
 
    
   method init();
      _19TV3NKQAE4OCE6A84KGKUAM1.setvars(allvars);
      _19TV3NKQAE4OCE6A84KGKUAM1.setkey(n'586F5118160A265B5EDF523012055D01A9956C26');
   end;
    
   method post_19TV3NKQAE4OCE6A84KGKUAM1();
      dcl double _P_;
       
      if "P_BAD0" = . then "P_BAD0" = 0.8000839983;
      if "P_BAD1" = . then "P_BAD1" = 0.1999160017;
      if MISSING("I_BAD") then do ;
      _P_ = 0.0;
      if "P_BAD1" > _P_ then do ;
      _P_ = "P_BAD1";
      "I_BAD" = '1';
      end;
      if "P_BAD0" > _P_ then do ;
      _P_ = "P_BAD0";
      "I_BAD" = '0';
      end;
      end;
      EM_EVENTPROBABILITY = "P_BAD1";
      EM_CLASSIFICATION = "I_BAD";
      EM_PROBABILITY = MAX("P_BAD1", "P_BAD0");
    
   end;
    
 
   method run();
      set SASEP.IN;
      _19TV3NKQAE4OCE6A84KGKUAM1.scoreRecord();
      post_19TV3NKQAE4OCE6A84KGKUAM1();
   end;
 
   method term();
   end;
 
enddata;
