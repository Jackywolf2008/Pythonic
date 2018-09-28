   length _strfmt_ $12; drop _strfmt_;
   _strfmt_ = ' ';

   array _tlevname_79251332_{2} $12 _temporary_ ( '           1'
   '           0');

   array _dt_fi_79251332_{2} _temporary_;

   _node_id_ =  0;
   _new_id_  = -1;
   nextnode_79251332:
   if _node_id_ eq 0 then do;
         _strfmt_ = left(trim(put(DELINQ,BEST12.)));
         if _strfmt_ in ('4',
         '1',
         '0',
         '3',
         '2',
         '.') then do;

         _new_id_ = 1;
         end;
         else if _strfmt_ in ('10',
         '5',
         '7',
         '6',
         '8') then do;

         _new_id_ = 2;
         end;
         else do;
         _new_id_ = 1;
         end;
   end;
   else if _node_id_ eq 1 then do;
         _numval_ = DEBTINC;
         if missing(_numval_) then do;
            _node_id_ = 3;
            goto nextnode_79251332;
         end;
         if (_numval_ ge 43.5520309368842 and _numval_ lt 143.949604953611) then do;

            _new_id_ = 3;
         end;
         else if (_numval_ ge 0.52449921542988 and _numval_ lt 43.5520309368842) then do;

            _new_id_ = 4;
         end;
         else if (_numval_ lt 0.52449921542988) then do;
            _new_id_ = 4;
         end;
         else if (_numval_ ge 143.949604953611) then do;
            _new_id_ = 3;
         end;
         else do;
         _new_id_ = 4;
         end;
   end;
   else if _node_id_ eq 2 then do;
         _leaf_id_ = 2;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                    1;
         _dt_fi_79251332_{1} =                    1;
         _dt_fi_79251332_{2} =                    0;
   end;
   else if _node_id_ eq 3 then do;
         _strfmt_ = left(trim(put(DEROG,BEST12.)));
         if _strfmt_ in ('1',
         '0',
         '2',
         '.') then do;

         _new_id_ = 5;
         end;
         else if _strfmt_ in ('4',
         '7',
         '6',
         '3') then do;

         _new_id_ = 6;
         end;
         else do;
         _new_id_ = 5;
         end;
   end;
   else if _node_id_ eq 4 then do;
         _numval_ = VALUE;
         if missing(_numval_) then do;
            _node_id_ = 7;
            goto nextnode_79251332;
         end;
         if (_numval_ ge 474844.95 and _numval_ lt 855909) then do;

            _new_id_ = 7;
         end;
         else if (_numval_ ge 9100 and _numval_ lt 474844.95) then do;

            _new_id_ = 8;
         end;
         else if (_numval_ lt 9100) then do;
            _new_id_ = 8;
         end;
         else if (_numval_ ge 855909) then do;
            _new_id_ = 7;
         end;
         else do;
         _new_id_ = 8;
         end;
   end;
   else if _node_id_ eq 5 then do;
         _numval_ = VALUE;
         if missing(_numval_) then do;
            _node_id_ = 9;
            goto nextnode_79251332;
         end;
         if (_numval_ ge 474844.95 and _numval_ lt 855909) then do;

            _new_id_ = 9;
         end;
         else if (_numval_ ge 9100 and _numval_ lt 474844.95) then do;

            _new_id_ = 10;
         end;
         else if (_numval_ lt 9100) then do;
            _new_id_ = 10;
         end;
         else if (_numval_ ge 855909) then do;
            _new_id_ = 9;
         end;
         else do;
         _new_id_ = 10;
         end;
   end;
   else if _node_id_ eq 6 then do;
         _leaf_id_ = 6;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                    1;
         _dt_fi_79251332_{1} =                    1;
         _dt_fi_79251332_{2} =                    0;
   end;
   else if _node_id_ eq 7 then do;
         _leaf_id_ = 7;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =     0.72727272727272;
         _dt_fi_79251332_{1} =     0.72727272727272;
         _dt_fi_79251332_{2} =     0.27272727272727;
   end;
   else if _node_id_ eq 8 then do;
         _leaf_id_ = 8;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =     0.94372693726937;
         _dt_fi_79251332_{1} =     0.05627306273062;
         _dt_fi_79251332_{2} =     0.94372693726937;
   end;
   else if _node_id_ eq 9 then do;
         _leaf_id_ = 9;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                    1;
         _dt_fi_79251332_{1} =                    1;
         _dt_fi_79251332_{2} =                    0;
   end;
   else if _node_id_ eq 10 then do;
         _numval_ = DEBTINC;
         if missing(_numval_) then do;
            _node_id_ = 12;
            goto nextnode_79251332;
         end;
         if (_numval_ ge 50.7232862237933 and _numval_ lt 143.949604953611) then do;

            _new_id_ = 11;
         end;
         else if (_numval_ ge 0.52449921542988 and _numval_ lt 50.7232862237933) then do;

            _new_id_ = 12;
         end;
         else if (_numval_ lt 0.52449921542988) then do;
            _new_id_ = 12;
         end;
         else if (_numval_ ge 143.949604953611) then do;
            _new_id_ = 11;
         end;
         else do;
         _new_id_ = 12;
         end;
   end;
   else if _node_id_ eq 11 then do;
         _leaf_id_ = 11;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                    1;
         _dt_fi_79251332_{1} =                    1;
         _dt_fi_79251332_{2} =                    0;
   end;
   else if _node_id_ eq 12 then do;
         _strfmt_ = left(trim(put(DELINQ,BEST12.)));
         if _strfmt_ in ('1',
         '0',
         '3',
         '2',
         '.') then do;

         _new_id_ = 13;
         end;
         else if _strfmt_ in ('4') then do;

         _new_id_ = 14;
         end;
         else do;
         _new_id_ = 13;
         end;
   end;
   else if _node_id_ eq 13 then do;
         _strfmt_ = left(trim(put(DELINQ,BEST12.)));
         if _strfmt_ in ('1',
         '0',
         '2',
         '.') then do;

         _new_id_ = 15;
         end;
         else if _strfmt_ in ('3') then do;

         _new_id_ = 16;
         end;
         else do;
         _new_id_ = 15;
         end;
   end;
   else if _node_id_ eq 14 then do;
         _leaf_id_ = 14;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                    1;
         _dt_fi_79251332_{1} =                    1;
         _dt_fi_79251332_{2} =                    0;
   end;
   else if _node_id_ eq 15 then do;
         _numval_ = CLAGE;
         if missing(_numval_) then do;
            _node_id_ = 18;
            goto nextnode_79251332;
         end;
         if (_numval_ ge 175.235034141696 and _numval_ lt 1168.23356094464) then do;

            _new_id_ = 17;
         end;
         else if (_numval_ ge 0 and _numval_ lt 175.235034141696) then do;

            _new_id_ = 18;
         end;
         else if (_numval_ lt 0) then do;
            _new_id_ = 18;
         end;
         else if (_numval_ ge 1168.23356094464) then do;
            _new_id_ = 17;
         end;
         else do;
         _new_id_ = 18;
         end;
   end;
   else if _node_id_ eq 16 then do;
         _leaf_id_ = 16;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =     0.93333333333333;
         _dt_fi_79251332_{1} =     0.93333333333333;
         _dt_fi_79251332_{2} =     0.06666666666666;
   end;
   else if _node_id_ eq 17 then do;
         _leaf_id_ = 17;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =                 0.67;
         _dt_fi_79251332_{1} =                 0.33;
         _dt_fi_79251332_{2} =                 0.67;
   end;
   else if _node_id_ eq 18 then do;
         _leaf_id_ = 18;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =     0.68181818181818;
         _dt_fi_79251332_{1} =     0.68181818181818;
         _dt_fi_79251332_{2} =     0.31818181818181;
   end;
   if _new_id_ >= 0 then do;
       _node_id_ = _new_id_;
      goto nextnode_79251332;
   end;

   I_BAD = _tlevname_79251332_{_dt_pred_lev_+1};
   _i_ = 1;
   _dt_predp_ = _dt_fi_79251332_{_i_};
   P_BAD1 = _dt_predp_;
   _i_+1;
   _dt_predp_ = _dt_fi_79251332_{_i_};
   P_BAD0 = _dt_predp_;
   _i_+1;
   drop _dt_predp_;
   drop _i_;
   drop _dt_pred_lev_;
   drop _dt_pred_prob_;
   drop _numval_;
   drop _node_id_;
   drop _new_id_;



   *------------------------------------------------------------*;
   * Initializing missing posterior and classification variables ;
   *------------------------------------------------------------*;
   if "P_BAD0"n = . then "P_BAD0"n =0.8000839983;
   if "P_BAD1"n = . then "P_BAD1"n =0.1999160017;
   if missing('I_BAD'n) then do;
      drop _P_;
      _P_= 0.0 ;
      if 'P_BAD1'n > _P_ then do;
      _P_ = 'P_BAD1'n;
      'I_BAD'n = '1';
      end;
      if 'P_BAD0'n > _P_ then do;
      _P_ = 'P_BAD0'n;
      'I_BAD'n = '0';
      end;
   end;
