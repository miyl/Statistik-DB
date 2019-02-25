#! /usr/bin/env sh

sed -e 's/Mænd,0-4 år/M, 1/g' \
-e 's/Mænd,5-9 år/M,2/g' \
-e 's/Mænd,10-14 år/M,3/g' \
-e 's/Mænd,15-19 år/M,4/g' \
-e 's/Mænd,20-24 år/M,5/g' \
-e 's/Mænd,25-29 år/M,6/g' \
-e 's/Mænd,30-34 år/M,7/g' \
-e 's/Mænd,35-39 år/M,8/g' \
-e 's/Mænd,40-44 år/M,9/g' \
-e 's/Mænd,45-49 år/M,10/g' \
-e 's/Mænd,50-54 år/M,11/g' \
-e 's/Mænd,55-59 år/M,12/g' \
-e 's/Mænd,60-64 år/M,13/g' \
-e 's/Mænd,65-69 år/M,14/g' \
-e 's/Mænd,70-74 år/M,15/g' \
-e 's/Mænd,75-79 år/M,16/g' \
-e 's/Mænd,80-84 år/M,17/g' \
-e 's/Mænd,85-89 år/M,18/g' \
-e 's/Kvinder,0-4 år/K,01/g' \
-e 's/Kvinder,5-9 år/K,02/g' \
-e 's/Kvinder,10-14 år/K,03/g' \
-e 's/Kvinder,15-19 år/K,04/g' \
-e 's/Kvinder,20-24 år/K,05/g' \
-e 's/Kvinder,25-29 år/K,06/g' \
-e 's/Kvinder,30-34 år/K,07/g' \
-e 's/Kvinder,35-39 år/K,08/g' \
-e 's/Kvinder,40-44 år/K,09/g' \
-e 's/Kvinder,45-49 år/K,10/g' \
-e 's/Kvinder,50-54 år/K,11/g' \
-e 's/Kvinder,55-59 år/K,12/g' \
-e 's/Kvinder,60-64 år/K,13/g' \
-e 's/Kvinder,65-69 år/K,14/g' \
-e 's/Kvinder,70-74 år/K,15/g' \
-e 's/Kvinder,75-79 år/K,16/g' \
-e 's/Kvinder,80-84 år/K,17/g' \
-e 's/Kvinder,85-89 år/K,18/g' \
tmp4/fra_til_med_id.csv > final.csv
