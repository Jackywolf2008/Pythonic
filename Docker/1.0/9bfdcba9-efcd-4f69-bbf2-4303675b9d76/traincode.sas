*------------------------------------------------------------*;
* Macro Variables for input, output data and files;
  %let dm_datalib =;
  %let dm_lib     = WORK;
  %let dm_folder  = %sysfunc(pathname(work));
*------------------------------------------------------------*;
*------------------------------------------------------------*;
  * Training for gradboost;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
  * Initializing Variable Macros;
*------------------------------------------------------------*;
%macro dm_unary_input;
%mend dm_unary_input;
%global dm_num_unary_input;
%let dm_num_unary_input = 0;
%macro dm_interval_input;
'CLAGE'n 'CLNO'n 'DEBTINC'n 'LOAN'n 'MORTDUE'n 'VALUE'n 'YOJ'n
%mend dm_interval_input;
%global dm_num_interval_input;
%let dm_num_interval_input = 7 ;
%macro dm_binary_input;
%mend dm_binary_input;
%global dm_num_binary_input;
%let dm_num_binary_input = 0;
%macro dm_nominal_input;
'DELINQ'n 'DEROG'n 'JOB'n 'NINQ'n
%mend dm_nominal_input;
%global dm_num_nominal_input;
%let dm_num_nominal_input = 4 ;
%macro dm_ordinal_input;
%mend dm_ordinal_input;
%global dm_num_ordinal_input;
%let dm_num_ordinal_input = 0;
%macro dm_class_input;
'DELINQ'n 'DEROG'n 'JOB'n 'NINQ'n
%mend dm_class_input;
%global dm_num_class_input;
%let dm_num_class_input = 4 ;
%macro dm_segment;
%mend dm_segment;
%global dm_num_segment;
%let dm_num_segment = 0;
%macro dm_id;
%mend dm_id;
%global dm_num_id;
%let dm_num_id = 0;
%macro dm_text;
%mend dm_text;
%global dm_num_text;
%let dm_num_text = 0;
%macro dm_strat_vars;
'BAD'n
%mend dm_strat_vars;
%global dm_num_strat_vars;
%let dm_num_strat_vars = 1 ;
*------------------------------------------------------------*;
  * Component Code;
*------------------------------------------------------------*;
proc gradboost data=&dm_datalib..'DM_3GFHXJZEY8F2JGZHVNK9HH9HL'n(&dm_data_caslib)
     earlystop(tolerance=0 stagnation=5)
     numBin=20 binmethod=BUCKET
     maxdepth=6
     maxbranch=2
     minleafsize=5
     assignmissing=USEINSEARCH minuseinsearch=1
     ntrees=100 learningrate=0.1 samplingrate=0.5 lasso=0 ridge=0
     seed=12345
     printtarget
  ;
  partition rolevar='_PartInd_'n (TRAIN='1' VALIDATE='0' TEST='2');
  target 'BAD'n / level=nominal;
  input %dm_interval_input / level=interval;
  input %dm_binary_input %dm_nominal_input %dm_ordinal_input %dm_unary_input  / level=nominal;
  ods output
     VariableImportance   = &dm_lib..VarImp
     Fitstatistics        = &dm_data_outfit
     PredProbName = &dm_lib..PredProbName
     PredIntoName = &dm_lib..PredIntoName
  ;
  savestate rstore=&dm_datalib.._19TV3NKQAE4OCE6A84KGKUAM1_ast;
run;
